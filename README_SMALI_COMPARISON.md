# Smali Comparison Workflow - Quick Start

## Status

✅ **Script is working!** The comparison found differences between the Java-compiled code and the original Smali.

## Results

- **MainCanvas.smali**: 2901 lines changed (4948 total diff lines)
- **10 files total** with differences

Most differences are **cosmetic** (register names, line numbers), but there are some **logical differences** to investigate.

## Quick Commands

```bash
# Run the comparison
./compare_built_apk_smali.sh

# View differences for MainCanvas
cat smali_comparison/diffs/MainCanvas.smali.diff

# View differences for keyProcess method specifically
grep -B 2 -A 200 "\.method private final keyProcess" smali_comparison/diffs/MainCanvas.smali.diff

# View summary report
cat smali_comparison/comparison_report.txt
```

## Key Findings

1. **keyProcess() method**: Uses `.locals 8` in built code vs `.locals 7` in original
   - This suggests the Java code uses one more local variable
   - Need to investigate if this affects behavior

2. **Field initialization**: Constructor initializes fields in different order
   - Usually not a problem, but worth checking

## Next Steps

1. Focus on `keyProcess()` method - this is where the menu navigation issue is
2. Compare the control flow (if/else, switch statements)
3. Look for missing `break` statements or different return paths
4. Fix Java code to match original Smali logic
5. Rebuild and compare again

## Tips

- Most register name differences (v0 vs v2) are cosmetic - ignore them
- Focus on control flow differences (goto labels, method calls, field access)
- Line number differences (`.line` annotations) are not important
- Look for differences in the actual logic, not code style






