--- python/libusbsio/libusbsio.py.orig	2022-02-25 09:10:36 UTC
+++ python/libusbsio/libusbsio.py
@@ -261,6 +261,16 @@ class LIBUSBSIO(object):
             else:
                 platf = LIBUSBSIO.P_LINUX32
                 packing = 4
+        elif platform.system().lower().startswith('fre'):
+            dllname = "libusbsio.so"
+            is_64bits = sys.maxsize > 2**32
+            dfltdir = "freebsd_" + platform.machine()
+            if is_64bits:
+                platf = LIBUSBSIO.P_LINUX64
+                packing = 8
+            else:
+                platf = LIBUSBSIO.P_LINUX32
+                packing = 4
         elif platform.system().lower().startswith('dar'):
             dfltdir = "osx_" + platform.machine()
             if platform.machine() == "arm64":
