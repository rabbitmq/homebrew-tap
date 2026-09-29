#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <formula>" >&2
  exit 1
fi

formula="$1"
file="Formula/${formula}.rb"

output() {
  if [[ -n "${GITHUB_OUTPUT:-}" ]]; then
    echo "$1=$2" >> "$GITHUB_OUTPUT"
  fi
}

release_url=$(grep -oE 'github\.com/[^/]+/[^/]+/releases/download/v[^/]+/' "$file" | head -n 1)
repo=$(cut -d/ -f2-3 <<< "$release_url")
current=$(cut -d/ -f6 <<< "$release_url")
current="${current#v}"

latest=$(gh release view --repo "$repo" --json tagName --jq .tagName)
latest="${latest#v}"

output repo "$repo"
output current "$current"
output latest "$latest"

newest=$(printf '%s\n%s\n' "$current" "$latest" | sort -V | tail -n 1)
if [[ "$latest" == "$current" || "$newest" != "$latest" ]]; then
  echo "${formula} is up to date (${current}, latest release: ${latest})"
  output updated false
  exit 0
fi

echo "Bumping ${formula} from ${current} to ${latest}"

CURRENT="$current" LATEST="$latest" \
  perl -pi -e 's/(?<![\d.])\Q$ENV{CURRENT}\E(?!\.?\d)/$ENV{LATEST}/g' "$file"

while IFS=: read -r line_no line; do
  url=$(sed -E 's/.*url "([^"]+)".*/\1/' <<< "$line")
  sha_line_no=$((line_no + 1))
  if ! sed -n "${sha_line_no}p" "$file" | grep -qE '^[[:space:]]*sha256 "'; then
    echo "Expected a sha256 line after the url on line ${line_no} of ${file}" >&2
    exit 1
  fi

  echo "Computing sha256 of ${url}"
  sum=$(curl -fsSL --retry 3 "$url" | shasum -a 256 | cut -d' ' -f1)

  SUM="$sum" LINE_NO="$sha_line_no" \
    perl -pi -e 's/sha256 "[0-9a-f]+"/sha256 "$ENV{SUM}"/ if $. == $ENV{LINE_NO}' "$file"
done < <(grep -nE '^[[:space:]]*url "' "$file")

output updated true
