class QrImages < Formula
  desc "Generate QR code images"
  homepage "https://github.com/cable8mm/qr-images"
  url "https://github.com/cable8mm/qr-images/releases/download/v1.2.8/qr-images.phar"
  sha256 "05860d2a240d5d3984e43222c92e28c2545d4991b32026f988c436a0beb930e5"

  depends_on "php"

  def install
    libexec.install "qr-images.phar"

    (bin/"qr-images").write <<~'EOS'
      #!/bin/bash
      exec "#{Formula["php"].opt_bin}/php" "#{libexec}/qr-images.phar" "$@"
    EOS
  end

  test do
    system "#{bin}/qr-images", "--version"
  end
end
