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
  version "2.25.0"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    on_arm do
      url "https://github.com/rabbitmq/rabbitmqadmin-ng/releases/download/v2.25.0/rabbitmqadmin-2.25.0-aarch64-apple-darwin.tar.gz"
      sha256 "ff86386db18150724b6a378266997ffb6ca2fdb2447abd21c80d4d75a76a0188"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabbitmq/rabbitmqadmin-ng/releases/download/v2.25.0/rabbitmqadmin-2.25.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc24191cf6220a9ee57078975b183e4de788b25fc310e40058dc3e12617e72a2"
    end
    on_intel do
      url "https://github.com/rabbitmq/rabbitmqadmin-ng/releases/download/v2.25.0/rabbitmqadmin-2.25.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "36374371706fb6fe5367fb5e9dec09d686224fc54c7028265b1ed96785e4ddf1"
    end
  end

  def install
    bin.install "rabbitmqadmin"
  end

  test do
    system "#{bin}/rabbitmqadmin", "help"
  end
end
