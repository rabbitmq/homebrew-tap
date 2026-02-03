# MIT License
#
# Copyright (c) 2025-2026 Michael S. Klishin and Contributors
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

class RabbitmqLqt < Formula
  desc "CLI tool for parsing, annotating, and querying RabbitMQ log files"
  homepage "https://github.com/michaelklishin/rabbitmq-lqt"
  version "0.19.0"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    on_arm do
      url "https://github.com/michaelklishin/rabbitmq-lqt/releases/download/v0.19.0/rabbitmq-lqt-0.19.0-aarch64-apple-darwin.tar.gz"
      sha256 "27299206992d8924fe39fa282f5967b40af1a19d42a5dd3bbf1c4ed9430112cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/michaelklishin/rabbitmq-lqt/releases/download/v0.19.0/rabbitmq-lqt-0.19.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "227710cf05921983b0230b3dd2b9d8cd3587a8e7a2cae14bc25bf3f93a9839a8"
    end
    on_intel do
      url "https://github.com/michaelklishin/rabbitmq-lqt/releases/download/v0.19.0/rabbitmq-lqt-0.19.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ffb419e97f0aa6fae479581eb1a534330a10254c690f28f5892fd630e7104faf"
    end
  end

  def install
    bin.install "rabbitmq-lqt"
  end

  test do
    system "#{bin}/rabbitmq-lqt", "--version"
  end
end
