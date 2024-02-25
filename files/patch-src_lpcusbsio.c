--- src/lpcusbsio.c.orig	2022-02-25 09:10:36 UTC
+++ src/lpcusbsio.c
@@ -13,7 +13,11 @@
 #include <stdlib.h>
 #include <stdarg.h>
 #include <ctype.h>
+#if defined(__FreeBSD__)
+#include "hidapi_mock.h"
+#else
 #include "hidapi.h"
+#endif
 #include "lpcusbsio.h"
 #include "lpcusbsio_protocol.h"
 #ifdef _WIN32
