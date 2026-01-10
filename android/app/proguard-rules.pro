# Shizuku AIDL service classes - required for user service binding in release builds
-keep class me.biplobsd.rsm.ShellService { *; }
-keep class me.biplobsd.rsm.IShellService { *; }
-keep class me.biplobsd.rsm.IShellService$Stub { *; }
-keep class me.biplobsd.rsm.IShellService$Stub$Proxy { *; }

# Keep Shizuku library classes
-keep class rikka.shizuku.** { *; }
-dontwarn rikka.shizuku.**