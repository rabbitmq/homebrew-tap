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
      url "https://github.com/rabbitmq/omq/releases/download/v0.60.1/omq_0.60.1_darwin_arm64"
      sha256 "0d2d2cdd8e1150a2f88961860b1aa74645ee2ba87f4780e2945d993350a35af4"
    end
    on_intel do
      url "https://github.com/rabbitmq/omq/releases/download/v0.60.1/omq_0.60.1_darwin_amd64"
      sha256 "68c23f94fb4cba50a3781401a25de4604cb42751cb875f7f5eb32a3f4edcd4cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabbitmq/omq/releases/download/v0.60.1/omq_0.60.1_linux_arm64"
      sha256 "eb5780469872cf7bcfe53dc87a9fd86fb1a1d5e3ed2965652f7129c35635d154"
    end
    on_intel do
      url "https://github.com/rabbitmq/omq/releases/download/v0.60.1/omq_0.60.1_linux_amd64"
      sha256 "89bfcf91689077b1c30e31876b5c809f3607a0aa9aad27d24a70cc7e14f63318"
    end
  end

  def install
    bin.install Dir["omq_*"].first => "omq"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/omq version")
  end
end
