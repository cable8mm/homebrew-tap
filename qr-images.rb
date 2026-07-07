class QrImages < Formula
  desc "Generate QR code images"
  homepage "https://github.com/cable8mm/qr-images"
  url "https://github.com/cable8mm/qr-images/releases/download/v1.2.9/qr-images.phar"
  sha256 "14a768291d0dded8b7033d8d78e68d6885c889bfb63bf53722bb41e8cc8e5500"

  depends_on "php"

  def install
    libexec.install "qr-images.phar"

    (bin/"qr-images").write <<~EOS
      #!/bin/bash
      exec "#{Formula["php"].opt_bin}/php" "#{libexec}/qr-images.phar" "$@"
    EOS
  end

  test do
    system "#{bin}/qr-images", "--version"
  end
end
