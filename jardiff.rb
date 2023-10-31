class Jardiff < Formula
  desc "Diff tool for Java classes or classpaths"
  homepage "https://github.com/scala/jardiff"
  url "https://github.com/scala/jardiff/releases/download/v1.8.0/jardiff.jar" #, using => :nounzip
  sha256 "97fbf16fc5a88457cd7eac69b684340e97859538900a998a6952cb73d6cc6a30"

  depends_on "openjdk@8"

  def install
    libexec.install "jardiff.jar"

    (bin/"jardiff").write <<~EOS
      #!/bin/sh
      java $JAVA_OPTS -jar "#{libexec}/jardiff.jar" "$@"
    EOS
  end

  test do
    assert_match "usage: jardiff", shell_output("#{bin}/jardiff -help")
  end
end
