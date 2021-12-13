module source.app;

import core.sys.windows.dll;

import std.stdio;
import core.runtime;
import core.stdc.stdio;
import core.sys.windows.windows;
import std.concurrency;
import core.thread;
import core.sys.windows.windef : HINSTANCE;
import core.sys.windows.winnt;
import loop;

extern (Windows)
BOOL DllMain(HINSTANCE module_, uint reason, void*)
{
    try
    {
        if (reason == DLL_PROCESS_ATTACH)
        {
            Runtime.initialize;
            Loop cheatLoop = new Loop();
            auto tid = new Thread( () {
                cheatLoop.run();
			}).start();
		}
        else if (reason == DLL_PROCESS_DETACH)
        {
            Runtime.terminate;
        }

        return true;
    }
    catch (Throwable exception)
    {

    }

    return false;
}