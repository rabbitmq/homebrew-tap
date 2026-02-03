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
  version "2.24.0"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    on_arm do
      url "https://github.com/rabbitmq/rabbitmqadmin-ng/releases/download/v2.24.0/rabbitmqadmin-2.24.0-aarch64-apple-darwin.tar.gz"
      sha256 "02420cfb38f6dad48193df9b0065a95c7f023548f3288c4439bc8ba5de37ad8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabbitmq/rabbitmqadmin-ng/releases/download/v2.24.0/rabbitmqadmin-2.24.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "30935afdcc217fea0d81cc502c00942a00cbd53377940832a5854d6c4bd59f6d"
    end
    on_intel do
      url "https://github.com/rabbitmq/rabbitmqadmin-ng/releases/download/v2.24.0/rabbitmqadmin-2.24.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed427604e6a708e9ce0c042884b72cda99fbd1413347d294d3505a686a0386fe"
    end
  end

  def install
    bin.install "rabbitmqadmin"
  end

  test do
    system "#{bin}/rabbitmqadmin", "help"
  end
end
