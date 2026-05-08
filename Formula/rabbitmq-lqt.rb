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
  version "0.21.0"
  license any_of: ["Apache-2.0", "MIT"]

  url "https://github.com/michaelklishin/rabbitmq-lqt/archive/refs/tags/v0.21.0.tar.gz"
  sha256 "1fc777f4a542a9456f329f5acdd1c5aeab08e3bb2c10669b90498c2bb58cc94c"

  depends_on "rust" => :build

  on_macos do
    on_arm do
      url "https://github.com/michaelklishin/rabbitmq-lqt/releases/download/v0.21.0/rabbitmq-lqt-0.21.0-aarch64-apple-darwin.tar.gz"
      sha256 "411a15b4a757ae9e8500889d39c8e6dba61b8e66cd2fe5584a3359113c01332f"
    end
    on_intel do
      url "https://github.com/michaelklishin/rabbitmq-lqt/archive/refs/tags/v0.21.0.tar.gz"
      sha256 "1fc777f4a542a9456f329f5acdd1c5aeab08e3bb2c10669b90498c2bb58cc94c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/michaelklishin/rabbitmq-lqt/releases/download/v0.21.0/rabbitmq-lqt-0.21.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "200ece7df7ad286732c29e424d3cee267fd31f8effc4d940a24439e6c6eecf2a"
    end
    on_intel do
      url "https://github.com/michaelklishin/rabbitmq-lqt/releases/download/v0.21.0/rabbitmq-lqt-0.21.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "89961227bc2dc68c1f7e4f2197dc869643c1283ef5f0e10706ec2ac5179588f6"
    end
  end

  def pour_bottle?
    return false if OS.mac? && Hardware::CPU.intel?
    super
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      system "cargo", "install", "--locked", "--root", prefix, "-p", "rabbitmq-lqt-cli"
    else
      bin.install "rabbitmq-lqt"
    end
  end

  test do
    system "#{bin}/rabbitmq-lqt", "--version"
  end
end
