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
      url "https://github.com/rabbitmq/omq/releases/download/v0.56.0/omq_0.56.0_darwin_arm64"
      sha256 "31f5b5904abb79cde3b09818d7a91fc194d1ac69fc23e99b685f914016f7d174"
    end
    on_intel do
      url "https://github.com/rabbitmq/omq/releases/download/v0.56.0/omq_0.56.0_darwin_amd64"
      sha256 "ebcba58c7a78de9f2fdcd44eb6303d61b8c89e0c0d56dbcb0004e923fed2a865"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabbitmq/omq/releases/download/v0.56.0/omq_0.56.0_linux_arm64"
      sha256 "6812336b4605a1f76135e659c1ece1a7656b782ed50a177e3b3b5a69dad7fdff"
    end
    on_intel do
      url "https://github.com/rabbitmq/omq/releases/download/v0.56.0/omq_0.56.0_linux_amd64"
      sha256 "9bf34372f38317ea587a376a09649843eb5c9e55a7d9cc2d5981b128a9d774cc"
    end
  end

  def install
    bin.install Dir["omq_*"].first => "omq"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/omq version")
  end
end
