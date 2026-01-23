# Smali Comparison Status Summary

**Last Updated:** 2026-01-18

## ✅ Files Completely Fixed (Logical Differences Resolved)

| File | Diff Lines | Status | Notes |
|------|------------|--------|-------|
| **XConnection.smali** | 108 | ✅ **FIXED** | Only cosmetic differences remain (line numbers, annotations) |
| **CreateThread.smali** | 268 | ✅ **FIXED** | Only cosmetic differences remain (register allocation, line numbers) |
| **MainCanvas.smali** | 5,072 | ✅ **FIXED** | Key logical patterns fixed. Remaining are register allocation optimizations (~2,053 code diffs, rest cosmetic) |

**Total:** 3 files with all logical differences fixed

---

## 🔄 Files In Progress

### GameRun.smali - IN PROGRESS

- **Total diff:** 68,513 lines
- **Logical differences:** ~6,153 lines (actual code/logic differences)
- **Cosmetic differences:** ~62,360 lines (register allocation, line numbers, annotations)

**Progress:**
- ✅ **Fixed:** 14 methods (including 5 failed decompilation methods)
- ⏳ **Pending:** 195 methods
- **Total:** 209 methods with differences

**Top 10 Largest Pending Methods:**
1. `run_gameRun()` - 696 diffs ⏳
2. `popState()` - 479 diffs ⏳
3. `keyBuyItem()` - 435 diffs ⏳
4. `paint_gameRun()` - 391 diffs ⏳
5. `drawEvolveUI()` - 379 diffs ⏳
6. `key_gameRun()` - 375 diffs ⏳
7. `drawSkillList()` - 319 diffs ⏳
8. `drawEnemy()` - 273 diffs ⏳
9. `keyMY_BAG()` - 272 diffs ⏳
10. `magicEffectRate()` - 271 diffs ⏳

**Next Smallest Methods to Fix (Priority Order):**
1. `drawPlayer()` - 10 diffs ⏳
2. `getNameSkill()` - 10 diffs ⏳
3. `getSelInfo()` - 10 diffs ⏳
4. `getNameCity()` - 10 diffs ⏳
5. `getNameItem()` - 10 diffs ⏳
6. `getNameMon()` - 10 diffs ⏳
7. `getNameMonsterInfo()` - 11 diffs ⏳
8. `drawBUY_ITEM()` - 13 diffs ⏳
9. `drawMONSTER_UI()` - 14 diffs ⏳
10. `drawHitOne()` - 15 diffs ⏳

---

## ⏳ Files Pending (Not Started)

| File | Diff Lines | Priority | Notes |
|------|------------|----------|-------|
| **Constants_H.smali** | 766 | Medium | Start after GameRun.smali smaller methods |
| **MD5.smali** | 3,153 | Low | Utility class, likely mostly cosmetic |
| **PointerKey.smali** | 3,571 | Medium | Handles touch/key input |
| **SMSSender.smali** | 4,487 | Low | Likely legacy/payment code |
| **GameRun_F.smali** | 6,688 | Medium | Related to GameRun |
| **Map.smali** | 46,939 | Low | Very large, likely mostly cosmetic (register names, line numbers) |

---

## 📊 Overall Progress

- ✅ **Completely Fixed:** 3 files (27.3%)
- 🔄 **In Progress:** 1 file (GameRun.smali - 6.7% of methods fixed)
- ⏳ **Pending:** 6 files

**Total Files with Differences:** 10 files

---

## 🎯 Recommended Next Steps

### Immediate Priority (GameRun.smali)

1. **Continue fixing smallest methods first:**
   - Start with `drawPlayer()` (10 diffs)
   - Then `getNameSkill()`, `getSelInfo()`, `getNameCity()`, `getNameItem()`, `getNameMon()` (all 10 diffs)
   - These are likely simple getter methods with redundant load patterns

2. **After small methods, tackle medium methods:**
   - `drawBUY_ITEM()` (13 diffs)
   - `drawMONSTER_UI()` (14 diffs)
   - `drawHitOne()` (15 diffs)
   - `drawBuffList()` (16 diffs)

3. **Large methods (after establishing patterns):**
   - `run_gameRun()` (696 diffs) - Main game loop
   - `popState()` (479 diffs) - State management
   - `keyBuyItem()` (435 diffs) - Input handling

### After GameRun.smali

1. **Constants_H.smali** (766 lines) - Medium priority
2. **PointerKey.smali** (3,571 lines) - Medium priority (input handling)
3. **GameRun_F.smali** (6,688 lines) - Medium priority (related to GameRun)

### Low Priority (Likely Mostly Cosmetic)

- **MD5.smali** (3,153 lines) - Utility class
- **SMSSender.smali** (4,487 lines) - Legacy code
- **Map.smali** (46,939 lines) - Very large, likely mostly cosmetic

---

## 🔍 How to Check Current Status

```bash
# View all diff files
ls -lh smali_comparison/diffs/*.diff

# Check diff sizes
wc -l smali_comparison/diffs/*.diff | sort -n

# View specific method diff in GameRun
grep -A 50 "\.method.*drawPlayer" smali_comparison/diffs/GameRun.smali.diff

# Rebuild and compare
./compare_built_apk_smali.sh
```

---

## 📝 Notes

- **Focus on logical differences only** - Ignore register allocation, line numbers, annotations
- **Register allocation differences are acceptable** - Compiler-controlled, doesn't affect behavior
- **Work smallest to largest** - Validates approach and builds confidence
- **Pattern recognition** - Many methods follow similar patterns (redundant loads, constant initialization)
