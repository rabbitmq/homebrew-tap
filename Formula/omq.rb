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
      url "https://github.com/rabbitmq/omq/releases/download/v0.55.0/omq_0.55.0_darwin_arm64"
      sha256 "74f189eaca6da9ba503a8d06b35d13b42ba3d6bcabb3ee735be83a2d96139b4b"
    end
    on_intel do
      url "https://github.com/rabbitmq/omq/releases/download/v0.55.0/omq_0.55.0_darwin_amd64"
      sha256 "f704c8ff7db97c1bc231f570cda2b50e7e9cbcf367c7523a3f2ea7bfb6273aef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabbitmq/omq/releases/download/v0.55.0/omq_0.55.0_linux_arm64"
      sha256 "5bfa168b3d93f1d08fa6c93f3ff8d5ee6c2055860f186927ac177883acd868d0"
    end
    on_intel do
      url "https://github.com/rabbitmq/omq/releases/download/v0.55.0/omq_0.55.0_linux_amd64"
      sha256 "daaf731590655f36c72decc64c18858c3814d8857016e3314359a29081d7d3ba"
    end
  end

  def install
    bin.install Dir["omq_*"].first => "omq"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/omq version")
  end
end
