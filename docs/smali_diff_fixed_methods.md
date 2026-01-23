# Smali Diff for Fixed Methods

## Overview

This document shows the original smali structure for the 5 failed decompilation methods that were fixed.

## Methods Fixed

| Method | Original Smali Lines | Java Lines | Description |
|--------|---------------------|------------|-------------|
| `drawMonsterHp()` | ~195 | ~55 | HP bar drawing |
| `damage()` | ~376 | ~145 | Damage calculation |
| `aiEnemy()` | ~497 | ~191 | AI enemy skill selection |
| `drawMagicC()` | ~159 | ~83 | Magic animation drawing |
| `drawNidus()` | ~1224 | ~460 | Nidus UI drawing |
| **Total** | **~2,451** | **~934** | |

## How to Generate Smali Diff

To see the actual smali diff (original vs newly compiled):

```bash
# 1. Build the APK
cd jadx_gradle_export
./gradlew assembleDebug

# 2. Decompile the built APK
apktool d app/build/outputs/apk/debug/app-debug.apk -o /tmp/built_smali

# 3. Compare specific methods
for method in drawMonsterHp damage aiEnemy drawMagicC drawNidus; do
  echo "=== Comparing $method ==="
  diff -u \
    <(awk "/\.method.*$method/,/\.end method/" original_petking_5/smali/main/GameRun.smali) \
    <(awk "/\.method.*$method/,/\.end method/" /tmp/built_smali/smali/main/GameRun.smali) \
    > /tmp/${method}_smali.diff
  echo "Diff saved to /tmp/${method}_smali.diff"
done

# 4. Or compare entire file
diff -u original_petking_5/smali/main/GameRun.smali \
     /tmp/built_smali/smali/main/GameRun.smali \
     > /tmp/GameRun_full_smali.diff
```

## Original Smali Structure

### 1. drawMonsterHp()

```smali
.method private drawMonsterHp(Ldm/Monster;IIIIII)V
    .locals 13
    .param p1, "monster"    # Ldm/Monster;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "w"    # I
    .param p5, "mode"    # I
    .param p6, "type"    # I
    .param p7, "t2"    # I

    .prologue
    .line 3318
    const/4 v4, 0x2
    move/from16 v0, p5
    move v1, v4
    if-ge v0, v1, :cond_1
    
    .line 3319
    iget-object v4, p1, Ldm/Monster;->monsterPro:[S
    add-int/lit8 v5, p5, 0x0
    aget-short v11, v4, v5
    
    .line 3320
    .local v11, "t0":S
    iget-object v4, p1, Ldm/Monster;->monsterPro:[S
    add-int/lit8 v5, p5, 0x2
    aget-short v12, v4, v5
    
    .line 3327
    .local v12, "t1":S
    :goto_0
    invoke-static {}, Ldm/Ui;->i()Ldm/Ui;
    move-result-object v4
    invoke-static {}, Ldm/Ms;->i()Ldm/Ms;
    move-result-object v5
    const/4 v6, 0x2
    sub-int v6, p4, v6
    move-object v0, v5
    move/from16 v1, p7
    move v2, v6
    move v3, v12
    invoke-virtual {v0, v1, v2, v3}, Ldm/Ms;->mathPercent(III)S
    move-result v8
    # ... more instructions ...
.end method
```

**Key patterns:**
- Constant initialization: `const/4 v4, 0x2`
- Redundant array loads: `iget-object` multiple times
- Conditional branching: `if-ge v0, v1, :cond_1`
- Method calls with explicit parameter moves

### 2. damage()

```smali
.method private damage(Ldm/Battle;Ldm/Battle;Ldm/Monster;Ldm/Monster;II)V
    .locals 17
    .param p1, "amB"    # Ldm/Battle;
    .param p2, "dmB"    # Ldm/Battle;
    .param p3, "am"    # Ldm/Monster;
    .param p4, "dm"    # Ldm/Monster;
    .param p5, "skill_no"    # I
    .param p6, "mini"    # I

    .prologue
    .line 4358
    move-object/from16 v0, p3
    iget-object v0, v0, Ldm/Monster;->monster:[B
    move-object v14, v0
    const/4 v15, 0x2
    aget-byte v6, v14, v15
    .local v6, "LevelA":I
    
    # ... complex damage calculation logic ...
    # Level difference calculations
    # Buff/debuff handling
    # Critical hit logic
    # Final hit application
.end method
```

**Key patterns:**
- 17 local variables (`.locals 17`)
- Complex arithmetic operations
- Multiple conditional branches for buffs/crits
- Final `addHit()` call

### 3. aiEnemy()

```smali
.method private aiEnemy()V
    .locals 11
    .prologue
    const/4 v10, 0x4
    const/4 v9, 0x3
    const/4 v8, 0x2
    const/4 v7, 0x0
    const/4 v6, 0x1
    
    .line 5679
    const/4 v3, 0x5
    .local v3, "skill_num":B
    invoke-static {}, Ldm/Ms;->i()Ldm/Ms;
    const/16 v4, 0x64
    invoke-static {v4}, Ldm/Ms;->getRandom(I)I
    move-result v4
    int-to-byte v1, v4
    .local v1, "n":B
    
    :goto_0
    const/4 v4, -0x1
    if-le v3, v4, :cond_0
    # ... skill selection logic ...
    # Battle type branching
    # Random-based selection
    # HP-based selection
.end method
```

**Key patterns:**
- Multiple constants initialized at start
- While loop with break condition
- Switch statements (packed-switch)
- Battle type branching logic

### 4. drawMagicC()

```smali
.method public drawMagicC(IIIIII)Z
    .locals 7
    .param p1, "i"    # I
    .param p2, "skill_mode"    # I
    .param p3, "select"    # I
    .param p4, "x"    # I
    .param p5, "y"    # I
    .param p6, "dir"    # I

    .prologue
    const/4 v4, 0x2
    const/4 v6, 0x1
    const/4 v3, 0x0
    
    .line 5384
    iget-object v0, p0, Lmain/GameRun;->now_action_Magic:[S
    aget-short v0, v0, p1
    # ... frame management loop ...
    # Animation frame tracking
    # Battle effect handling
    # Ui.drawFrameOne() call
.end method
```

**Key patterns:**
- Boolean return type
- Frame management with arrays
- While loop for animation
- Battle effect array updates

### 5. drawNidus()

```smali
.method private drawNidus(II)V
    .locals 22
    .param p1, "x"    # I
    .param p2, "w"    # I

    .prologue
    .line 1308
    const/16 v18, 0x168    # HEIGHT = 360
    .local v18, "HEIGHT":I
    const/16 v20, 0x140    # WIDTH_H = 320
    .local v20, "WIDTH_H":I
    const/16 v19, 0xb4     # HEIGHT_H = 180
    .local v19, "HEIGHT_H":I
    
    # Early return for mini_state == 16
    # Main drawing logic:
    # - fillRectB() and drawBG0()
    # - Log.e() debug call
    # - Page number string drawing
    # - Status string drawing
    # - drawCartoonOne() animations
    # - Progress bar with getNexp()
    # - Status text drawing
    # - drawEvolveMake() call
    # - drawStringY() calls
    # - drawMonKind() call
    # - drawTriangle() navigation
    # - drawYesNo() confirmation
    # - PointerKey.selectMenuX() input
.end method
```

**Key patterns:**
- 22 local variables (largest method)
- Multiple constants initialized
- Complex UI drawing sequence
- Multiple conditional branches
- Input handling at end

## Expected Diff Results

After rebuilding, the smali should match for:

✅ **Logical equivalence:**
- Control flow (if/else, loops, switches)
- Method calls and parameters
- Field accesses
- Array operations
- Constant values
- Arithmetic operations

⚠️ **Expected minor differences (cosmetic):**
- Register allocation (v0, v1, v2, etc.) - compiler controlled
- Line numbers (`.line` annotations) - debug info only
- Local variable names (`.local` annotations) - debug info only
- `.prologue` annotations - old smali style

## Verification

To verify the fixes match the original smali:

1. Build and decompile as shown above
2. Compare the logical structure (ignore register names)
3. Verify method calls match
4. Verify control flow matches
5. Verify constant values match

The Java code was written to exactly match the original smali bytecode patterns, including redundant loads and constant initialization.





