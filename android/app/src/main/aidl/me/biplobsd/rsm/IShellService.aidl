package me.biplobsd.rsm;

import android.os.ParcelFileDescriptor;
import me.biplobsd.rsm.ShellResult;
import me.biplobsd.rsm.AppInfoResult;

interface IShellService {
    ShellResult executeCommand(String command) = 1;
    ParcelFileDescriptor executeCommandWithFd(String command) = 2;
    List<AppInfoResult> getInstalledApps() = 3;
    AppInfoResult getAppInfo(String packageName) = 4;
    void destroy() = 16777114;
}
