# MIT License
#
# Copyright (c) 2026 the RabbitMQ Core Team and Contributors
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

class Omq < Formula
  desc "Test client for AMQP 1.0, AMQP 0.9.1, MQTT and STOMP"
  homepage "https://github.com/rabbitmq/omq"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rabbitmq/omq/releases/download/v0.57.0/omq_0.57.0_darwin_arm64"
      sha256 "0ddad1fd2065263b924a8f2f750f34c1037cae25070b6a7c3f9aab988989157d"
    end
    on_intel do
      url "https://github.com/rabbitmq/omq/releases/download/v0.57.0/omq_0.57.0_darwin_amd64"
      sha256 "d564e34b7ad24e7285653404434da885d08b7715afd1d6d4545086a136a2a0b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabbitmq/omq/releases/download/v0.57.0/omq_0.57.0_linux_arm64"
      sha256 "2f61e14bdba4aeb31d61b12818986eee5f920a8dbd3e52f0532df0b76ab88757"
    end
    on_intel do
      url "https://github.com/rabbitmq/omq/releases/download/v0.57.0/omq_0.57.0_linux_amd64"
      sha256 "e2675a56778b63c79a677e117a0135b4b3cc847d208891648a6e695cf2f10e27"
    end
  end

  def install
    bin.install Dir["omq_*"].first => "omq"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/omq version")
  end
end
