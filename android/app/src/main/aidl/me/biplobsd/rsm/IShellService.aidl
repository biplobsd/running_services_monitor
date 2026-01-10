package me.biplobsd.rsm;

import android.os.ParcelFileDescriptor;
import me.biplobsd.rsm.ShellResult;

interface IShellService {
    ShellResult executeCommand(String command) = 1;
    ParcelFileDescriptor executeCommandWithFd(String command) = 2;
    void destroy() = 16777114;
}
