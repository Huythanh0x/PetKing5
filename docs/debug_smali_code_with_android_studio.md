Follow the steps at [smali debugging using Android Studio](https://www.youtube.com/watch?v=MilmeHVA1Rw)
Step by step:
1. Install Android Studio (of course)
2. Create virtual machine (prefer android 5, sdk version 22)
3. Install plugin smalidea. This plugin not avaialble on market. Download file and install from disk.
4. Start the virtual machine and install apk into that device
5. Attach debugger to the app process. Process name `com.Petking5_480x800`



There are some note:
- We don't need install Genymotion, just AS emulator is sufficent
- We might not found the process on debugger selection. Tick the checkbox `show all process` and manually select the matching process.
- If the source dir was highlight (in dark yellow) or not show on the **Project View**. Remove `.idea` directory