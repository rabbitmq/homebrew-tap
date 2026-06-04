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
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    on_arm do
      url "https://github.com/rabbitmq/rabbitmqadmin-ng/releases/download/v2.32.0/rabbitmqadmin-2.32.0-aarch64-apple-darwin.tar.gz"
      sha256 "15e1ae9b6f047efc24153090cd88c312eb845084732875db273d638bd88cc650"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabbitmq/rabbitmqadmin-ng/releases/download/v2.32.0/rabbitmqadmin-2.32.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fdd9859ceb05637efa021d22b93dfc85153642284630781a84738b834062360b"
    end
    on_intel do
      url "https://github.com/rabbitmq/rabbitmqadmin-ng/releases/download/v2.32.0/rabbitmqadmin-2.32.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b64bfc19d2d6587dc894606f83016b9b5b92b66883a5f8ed059432f4f81ecfcb"
    end
  end

  def install
    bin.install "rabbitmqadmin"
  end

  test do
    system bin/"rabbitmqadmin", "help"
  end
end
