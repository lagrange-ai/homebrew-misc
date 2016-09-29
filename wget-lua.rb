class WgetLua < Formula
  desc "wget-lua"
  url "http://warriorhq.archiveteam.org/downloads/wget-lua/wget-1.14.lua.LATEST.tar.bz2"
  sha256 "d432357ff459559ef739c0b863a6c36f84e975b0bd284b42435b12cc6763061b"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "xz" => :build
  depends_on "gettext"
  depends_on "pkg-config" => :build
  depends_on "openssl" => :recommended

  def install
    # Fixes undefined symbols _iconv, _iconv_close, _iconv_open
    # Reported 10 Jun 2016: https://savannah.gnu.org/bugs/index.php?48193
    ENV.append "LDFLAGS", "-liconv"

    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --with-ssl=openssl
    ]

    args << "--with-libssl-prefix=#{Formula["openssl"].opt_prefix}"
    args << "--disable-nls"

    system "./bootstrap" if build.head?
    system "./configure", *args
    system "make"
    cp "src/wget", "#{bin}/wget-lua"
  end

  test do
    system "#{bin}/wget-lua -V | grep -qi 'wget\+lua'"
  end
end
