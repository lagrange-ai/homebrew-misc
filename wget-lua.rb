class WgetLua < Formula
  desc "wget-lua"
  head "https://github.com/alard/wget-lua.git", :branch => "lua"
  keg_only "too lazy to figure out make install renames"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "xz" => :build
  depends_on "gettext"
  depends_on "pkg-config" => :build
  depends_on "openssl" => :recommended
  depends_on "lua"

  patch :DATA

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
    system "make", "install"
  end

  test do
    system "#{bin}/wget-lua -V | grep -qi 'wget\+lua'"
  end
end

__END__
diff --git a/src/luahooks.c b/src/luahooks.c
index 2ec5239..4ab4f36 100644
--- a/src/luahooks.c
+++ b/src/luahooks.c
@@ -145,7 +145,7 @@ luahooks_init ()
   if (opt.lua_filename == NULL)
     return;

-  lua = lua_open ();
+  lua = luaL_newstate ();
   luaL_openlibs (lua);

   /* Initialize constants. */
@@ -489,7 +489,7 @@ luahooks_lookup_host (const char *host)
         return NULL;

       /* Copy to the buffer. */
-      size_t ret_l = lua_strlen(lua, -1);
+      size_t ret_l = lua_rawlen(lua, -1);
       ret_l = (ret_l <= MAX_HOST_LENGTH) ? ret_l : MAX_HOST_LENGTH;
       strncpy (lookup_host_result, ret, ret_l);
