# MIT License
#
# Copyright (c) 2023-2026 The rabbitmqadmin v2 Contributors
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

class Rabbitmqadmin < Formula
  desc "Modern RabbitMQ CLI based on the HTTP API"
  homepage "https://www.rabbitmq.com/docs/management-cli"
  version "2.26.0"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    on_arm do
      url "https://github.com/rabbitmq/rabbitmqadmin-ng/releases/download/v2.26.0/rabbitmqadmin-2.26.0-aarch64-apple-darwin.tar.gz"
      sha256 "1057271dcb476125b01895abdaa526b2b7f6259588bc47359b1ee83fe56bba16"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabbitmq/rabbitmqadmin-ng/releases/download/v2.26.0/rabbitmqadmin-2.26.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "155bc4b8f2ef3241414bb0b5df72d877296e7fe696e8decffdcd1c39260c9864"
    end
    on_intel do
      url "https://github.com/rabbitmq/rabbitmqadmin-ng/releases/download/v2.26.0/rabbitmqadmin-2.26.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "35c592bf4600bc9f92cac71c9115d9ec9fae10469bb5ba8a01c04691255c1ab7"
    end
  end

  def install
    bin.install "rabbitmqadmin"
  end

  test do
    system "#{bin}/rabbitmqadmin", "help"
  end
end
