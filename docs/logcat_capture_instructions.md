# Logcat Capture Instructions

## Overview
This guide explains how to capture logcat output from both the Smali and Java versions of the Pet Kingdom 5 app for debugging and flow comparison.

## Prerequisites
- Android device connected via USB
- USB debugging enabled
- ADB installed and working

## Basic Commands

### 1. Clear Logcat Buffer
Before starting a test session, clear the logcat buffer to avoid old logs:
```bash
adb logcat -c
```

### 2. Capture All Logs
Capture all logcat output (will run continuously until you press Ctrl+C):
```bash
adb logcat
```

### 3. Capture and Save to File
Save all logs to a file:
```bash
adb logcat > logcat_all.txt
```

## Filtering by Our Log Tag

### Capture Only FLOW_TRACE Logs (Both Versions)
This captures logs from both Java and Smali versions:
```bash
adb logcat -s FLOW_TRACE
```

### Save FLOW_TRACE Logs to File
```bash
adb logcat -s FLOW_TRACE > flow_trace_logs.txt
```

### Capture with Timestamps
```bash
adb logcat -s FLOW_TRACE -v time
```

### Capture with Timestamps and Save to File
```bash
adb logcat -s FLOW_TRACE -v time > flow_trace_with_time.txt
```

## Filtering by Package Name

### Java Version (com.PetKing5_480x800)
```bash
adb logcat | grep "com.PetKing5_480x800"
```

### Smali Version (com.PetKing5_480x800.smali)
```bash
adb logcat | grep "com.PetKing5_480x800.smali"
```

### Both Versions
```bash
adb logcat | grep "com.PetKing5_480x800"
```

## Combined Filtering (Recommended)

### Capture FLOW_TRACE logs with timestamps and save to file
```bash
adb logcat -s FLOW_TRACE -v time > flow_trace_$(date +%Y%m%d_%H%M%S).txt
```

### Capture FLOW_TRACE logs and filter by Java version
```bash
adb logcat -s FLOW_TRACE | grep "\[JAVA\]"
```

### Capture FLOW_TRACE logs and filter by Smali version
```bash
adb logcat -s FLOW_TRACE | grep "\[SMALI\]"
```

### Capture both versions side by side
```bash
adb logcat -s FLOW_TRACE -v time | grep -E "\[JAVA\]|\[SMALI\]"
```

## Step-by-Step Testing Workflow

### For Testing Java Version:

1. **Clear logcat buffer:**
   ```bash
   adb logcat -c
   ```

2. **Start capturing logs (in a separate terminal):**
   ```bash
   adb logcat -s FLOW_TRACE -v time > java_test_$(date +%Y%m%d_%H%M%S).txt
   ```

3. **Launch the Java app** on your device (package: `com.PetKing5_480x800`)

4. **Perform the test scenario:**
   - Navigate to main menu
   - Click on sound settings
   - Press back button
   - Observe the behavior

5. **Stop logcat** (Ctrl+C in the terminal)

6. **Review the log file** to see the flow

### For Testing Smali Version:

1. **Clear logcat buffer:**
   ```bash
   adb logcat -c
   ```

2. **Start capturing logs:**
   ```bash
   adb logcat -s FLOW_TRACE -v time > smali_test_$(date +%Y%m%d_%H%M%S).txt
   ```

3. **Launch the Smali app** on your device (package: `com.PetKing5_480x800.smali`)

4. **Perform the same test scenario**

5. **Stop logcat** (Ctrl+C)

6. **Compare the two log files**

## Advanced Filtering

### Capture FLOW_TRACE + Error logs
```bash
adb logcat -s FLOW_TRACE:* AndroidRuntime:E *:S
```

### Capture FLOW_TRACE + All app logs
```bash
adb logcat | grep -E "FLOW_TRACE|com.PetKing5_480x800"
```

### Real-time monitoring with color (if using a terminal that supports it)
```bash
adb logcat -s FLOW_TRACE -v color
```

## Log Format Explanation

Our logs follow this format:
```
[FLOW_TRACE] [JAVA] or [SMALI] <method_name>: <description> | game_state=X | menu_state=Y | load_c=Z
```

Example:
```
01-02 10:30:45.123  1234  1234 D FLOW_TRACE: [JAVA] paint: ENTRY | game_state=40 | menu_state=0 | load_c=1
01-02 10:30:45.124  1234  1234 D FLOW_TRACE: [JAVA] keyProcess: key_Num0 pressed | game_state=40 | menu_state=0 | load_c=1
```

## Quick Reference Commands

| Purpose | Command |
|---------|---------|
| Clear buffer | `adb logcat -c` |
| View FLOW_TRACE only | `adb logcat -s FLOW_TRACE` |
| Save FLOW_TRACE to file | `adb logcat -s FLOW_TRACE > logs.txt` |
| View with timestamps | `adb logcat -s FLOW_TRACE -v time` |
| View Java version only | `adb logcat -s FLOW_TRACE \| grep "\[JAVA\]"` |
| View Smali version only | `adb logcat -s FLOW_TRACE \| grep "\[SMALI\]"` |
| View both versions | `adb logcat -s FLOW_TRACE \| grep -E "\[JAVA\]\|\[SMALI\]"` |

## Troubleshooting

### No logs appearing?
- Make sure USB debugging is enabled
- Check device connection: `adb devices`
- Verify the app is running
- Try without filters first: `adb logcat`

### Too many logs?
- Use the `-s FLOW_TRACE` filter to only see our logs
- Add `*:S` to suppress other logs: `adb logcat -s FLOW_TRACE *:S`

### Logs are too verbose?
- Filter by specific method: `adb logcat -s FLOW_TRACE | grep "paint:"`
- Filter by game_state: `adb logcat -s FLOW_TRACE | grep "game_state=40"`

## Example Complete Test Session

```bash
# Terminal 1: Start logcat capture
adb logcat -c
adb logcat -s FLOW_TRACE -v time > test_session_$(date +%Y%m%d_%H%M%S).txt

# Terminal 2: Launch app (or use device directly)
adb shell am start -n com.PetKing5_480x800/.PetKing5

# Perform your test on the device...

# Terminal 1: Stop logcat (Ctrl+C)

# Review the log file
cat test_session_*.txt | grep -E "\[JAVA\]|\[SMALI\]"
```






