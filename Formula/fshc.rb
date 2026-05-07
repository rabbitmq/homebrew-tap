# MIT License
#
# Copyright (c) 2024-2026 Michael S. Klishin, the RabbitMQ Core Team, and Contributors
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

class Fshc < Formula
  desc "File and socket handle counter, a modern alternative to handle.exe"
  homepage "https://github.com/rabbitmq/fshc"
  version "1.5.0"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    on_arm do
      url "https://github.com/rabbitmq/fshc/releases/download/v1.5.0/fshc-1.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "2a5ed110ff5c32ff90919ed05feeffc3669d6f5ad3ce3131095ded2b2bb79104"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabbitmq/fshc/releases/download/v1.5.0/fshc-1.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "08c30ac855a4bbc8c8bd1e1a816f5e26b67241c4101d34eb35a5165dfa4eacc7"
    end
    on_intel do
      url "https://github.com/rabbitmq/fshc/releases/download/v1.5.0/fshc-1.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8ede1677a894bea6d6cbc565f8bd31672afe1a07dde763f7671026ed880ad91a"
    end
  end

  def install
    bin.install "fshc"
  end

  test do
    system "#{bin}/fshc", "--version"
  end
end
