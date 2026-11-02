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
      url "https://github.com/rabbitmq/omq/releases/download/v0.59.0/omq_0.59.0_darwin_arm64"
      sha256 "1f01d881ab1bff95fc5aeeac0af61235f5ad6855f56c51617b54dc8e910c049e"
    end
    on_intel do
      url "https://github.com/rabbitmq/omq/releases/download/v0.59.0/omq_0.59.0_darwin_amd64"
      sha256 "7a6225f0240bc0d4b69744cc8df515e955246b1abd4ec5fdd5f69c927892d3a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabbitmq/omq/releases/download/v0.59.0/omq_0.59.0_linux_arm64"
      sha256 "60b4506824887fb6e22437ca0f09deb038ffa7036f1e2eb7fab8d3cd5718ed11"
    end
    on_intel do
      url "https://github.com/rabbitmq/omq/releases/download/v0.59.0/omq_0.59.0_linux_amd64"
      sha256 "2ec94815804a600d1b12e3ce9c8ec740e55b675d48795a6458a8048276833896"
    end
  end

  def install
    bin.install Dir["omq_*"].first => "omq"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/omq version")
  end
end
