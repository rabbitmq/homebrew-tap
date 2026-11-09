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
      url "https://github.com/rabbitmq/omq/releases/download/v0.60.0/omq_0.60.0_darwin_arm64"
      sha256 "7e4745726b6a7ba07adbdfd5a78fd31288d484356dd3b10df5497419e18b1ce6"
    end
    on_intel do
      url "https://github.com/rabbitmq/omq/releases/download/v0.60.0/omq_0.60.0_darwin_amd64"
      sha256 "d37b18f2d0e9588d5ebf51e2b1d2d74e62e6ab7d4f310f7290bd969cb416af8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabbitmq/omq/releases/download/v0.60.0/omq_0.60.0_linux_arm64"
      sha256 "56e29d0142864c4492cf6f33a24964aa85ff049b6bf946e9fad5f62d1c9f1eb7"
    end
    on_intel do
      url "https://github.com/rabbitmq/omq/releases/download/v0.60.0/omq_0.60.0_linux_amd64"
      sha256 "2da10cf7c0645c75956f1a5074d03b81dcb19ce5054304b96307957962294b6f"
    end
  end

  def install
    bin.install Dir["omq_*"].first => "omq"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/omq version")
  end
end
