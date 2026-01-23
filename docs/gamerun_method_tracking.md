# GameRun.smali Method Fix Tracking

This file tracks the progress of fixing logical differences in GameRun.smali methods.

**Total methods with differences:** 209
**Last Updated:** 2026-01-01 23:10:00

## Methods (Sorted by Difference Count - Smallest First)

| # | Method | Diff Count | Status | Notes |
|---|--------|------------|--------|-------|
| 1 | `runBattleState()` | 3 | ✅ Fixed | Redundant array loads and constant initialization |
| 2 | `setNidusPro()` | 5 | ✅ Fixed | Redundant array loads and constant initialization |
| 3 | `deleteItems()` | 5 | ✅ Fixed | Redundant array loads and constant initialization |
| 4 | `Success()` | 6 | ✅ Fixed | Redundant SMSSender.i() calls and constant initialization |
| 5 | `goGameOver()` | 6 | ✅ Fixed | Redundant constant load pattern |
| 6 | `damage()` | 8 | ⏭️ Skipped | Method not decompiled by Jadx
| 7 | `drawMonsterHp()` | 8 | ⏭️ Skipped | Method not decompiled by Jadx
| 8 | `battleType()` | 8 | ✅ Fixed | Redundant parameter load
| 9 | `goBattleItem()` | 9 | ✅ Fixed | Redundant loads and constant initialization
| 10 | `drawPlayer()` | 10 | ⏳ Pending |  |
| 11 | `getNameSkill()` | 10 | ⏳ Pending |  |
| 12 | `getSelInfo()` | 10 | ⏳ Pending |  |
| 13 | `getNameCity()` | 10 | ⏳ Pending |  |
| 14 | `getNameItem()` | 10 | ⏳ Pending |  |
| 15 | `getNameMon()` | 10 | ⏳ Pending |  |
| 16 | `bufferAI()` | 11 | ✅ Fixed | Constant initialization and conditional return
| 17 | `getNameMonsterInfo()` | 11 | ⏳ Pending |  |
| 18 | `setMagic()` | 11 | ✅ Fixed | Redundant array loads and constant initialization
| 19 | `drawBUY_ITEM()` | 13 | ⏳ Pending |  |
| 20 | `drawMONSTER_UI()` | 14 | ⏳ Pending |  |
| 21 | `getMonInfo_dir()` | 14 | ✅ Fixed | Redundant array loads
| 22 | `drawHitOne()` | 15 | ⏳ Pending |  |
| 23 | `runMonsterAppear()` | 15 | ✅ Fixed | Redundant field loads and constant initialization |
| 24 | `drawBuffList()` | 16 | ⏳ Pending |  |
| 25 | `goGO_RUNINMAP()` | 16 | ✅ Fixed | Constant initialization
| 26 | `setNullBattle()` | 16 | ✅ Fixed | Null object pattern
| 27 | `exitNidus()` | 16 | ✅ Fixed | Constant initialization and null pattern
| 28 | `paintBATTLE_OVER()` | 17 | ✅ Fixed | Redundant field loads and constant initialization
| 29 | `popBagMenu()` | 17 | ✅ Fixed | Redundant array loads and constant initialization
| 30 | `doSayOverSms()` | 17 | ✅ Fixed | Redundant field loads and constant initialization
| 31 | `goMontsterAppear()` | 18 | ✅ Fixed | Constant initialization
| 32 | `isSkillToMe()` | 18 | ✅ Fixed | Constant initialization
| 33 | `doPaint()` | 18 | ✅ Fixed | Constant initialization
| 34 | `goVIEW_COMPUTER()` | 18 | ✅ Fixed | Constant initialization
| 35 | `isNpc2ImageType()` | 18 | ⏳ Pending |  |
| 36 | `setAimBattle()` | 18 | ✅ Fixed | Redundant field loads and conditional patterns
| 37 | `getNameBuff()` | 19 | ✅ Fixed | Redundant array load and constant initialization
| 38 | `paintBattleState()` | 19 | ⏳ Pending |  |
| 39 | `goCatchMonster()` | 20 | ✅ Fixed | Constant initialization
| 40 | `goMONSTER_INFO()` | 20 | ⏳ Pending |  |
| 41 | `getMonsterExp()` | 21 | ✅ Fixed | Redundant array load and constant initialization
| 42 | `keyBattleState()` | 21 | ⏳ Pending |  |
| 43 | `setNull()` | 21 | ⏳ Pending |  |
| 44 | `data_null()` | 22 | ⏳ Pending |  |
| 45 | `drawMonPro()` | 22 | ⏳ Pending |  |
| 46 | `getSkill()` | 22 | ⏳ Pending |  |
| 47 | `skyCheckRegFull()` | 22 | ⏳ Pending |  |
| 48 | `start()` | 22 | ⏳ Pending |  |
| 49 | `isMonHp()` | 23 | ⏳ Pending |  |
| 50 | `setMyThrow()` | 23 | ⏳ Pending |  |
| 51 | `setTakenMonster()` | 24 | ⏳ Pending |  |
| 52 | `useState()` | 24 | ⏳ Pending |  |
| 53 | `allAdd()` | 26 | ⏳ Pending |  |
| 54 | `drawMonKind()` | 26 | ⏳ Pending |  |
| 55 | `getExpOne()` | 26 | ⏳ Pending |  |
| 56 | `sellMonster()` | 26 | ⏳ Pending |  |
| 57 | `goNidus()` | 26 | ⏳ Pending |  |
| 58 | `initImgIco()` | 26 | ⏳ Pending |  |
| 59 | `effectR()` | 27 | ⏳ Pending |  |
| 60 | `drawDarkScreen()` | 28 | ⏳ Pending |  |
| 61 | `drawNidus()` | 28 | ⏳ Pending |  |
| 62 | `isMoney()` | 29 | ⏳ Pending |  |
| 63 | `saveGame()` | 29 | ⏳ Pending |  |
| 64 | `say()` | 30 | ⏳ Pending |  |
| 65 | `setAcionSkill()` | 31 | ⏳ Pending |  |
| 66 | `healMonster()` | 31 | ⏳ Pending |  |
| 67 | `getSkillLevel()` | 32 | ⏳ Pending |  |
| 68 | `getSkillMana()` | 32 | ⏳ Pending |  |
| 69 | `goBattleOver()` | 32 | ⏳ Pending |  |
| 70 | `setPutMonster()` | 33 | ⏳ Pending |  |
| 71 | `loadGame()` | 34 | ⏳ Pending |  |
| 72 | `popBagState()` | 34 | ⏳ Pending |  |
| 73 | `findItemType()` | 34 | ⏳ Pending |  |
| 74 | `setCartoonFrame_C()` | 35 | ⏳ Pending |  |
| 75 | `initMonStream()` | 36 | ⏳ Pending |  |
| 76 | `initMagicStream()` | 37 | ⏳ Pending |  |
| 77 | `drawMyMonState()` | 38 | ⏳ Pending |  |
| 78 | `isMyMonsters()` | 38 | ⏳ Pending |  |
| 79 | `keyGameOver1()` | 38 | ⏳ Pending |  |
| 80 | `delItemEvolve()` | 39 | ⏳ Pending |  |
| 81 | `getBXY()` | 40 | ⏳ Pending |  |
| 82 | `getbuffRateV()` | 40 | ⏳ Pending |  |
| 83 | `delMonster()` | 40 | ⏳ Pending |  |
| 84 | `drawFealty()` | 40 | ⏳ Pending |  |
| 85 | `drawMonsterFealty()` | 41 | ⏳ Pending |  |
| 86 | `goYouPAUSE()` | 41 | ⏳ Pending |  |
| 87 | `valueMend()` | 41 | ⏳ Pending |  |
| 88 | `changeMonster()` | 42 | ⏳ Pending |  |
| 89 | `initItemModules()` | 43 | ⏳ Pending |  |
| 90 | `goView()` | 44 | ⏳ Pending |  |
| 91 | `isEvolveKind()` | 44 | ⏳ Pending |  |
| 92 | `changeMy()` | 45 | ⏳ Pending |  |
| 93 | `gameCheckRegIsOK()` | 46 | ⏳ Pending |  |
| 94 | `setSay()` | 46 | ⏳ Pending |  |
| 95 | `getBattleBG()` | 47 | ⏳ Pending |  |
| 96 | `getInfoType()` | 48 | ⏳ Pending |  |
| 97 | `restMove()` | 48 | ⏳ Pending |  |
| 98 | `initMonPro()` | 48 | ⏳ Pending |  |
| 99 | `goBattleExp()` | 49 | ⏳ Pending |  |
| 100 | `setThrow()` | 49 | ⏳ Pending |  |
| 101 | `addMonInfoListBH()` | 49 | ⏳ Pending |  |
| 102 | `findMonster()` | 50 | ⏳ Pending |  |
| 103 | `doBuffValue()` | 52 | ⏳ Pending |  |
| 104 | `monsterRemove()` | 52 | ⏳ Pending |  |
| 105 | `setShowPro()` | 52 | ⏳ Pending |  |
| 106 | `drawBG0()` | 54 | ⏳ Pending |  |
| 107 | `resetMonster()` | 54 | ⏳ Pending |  |
| 108 | `goBattleState()` | 55 | ⏳ Pending |  |
| 109 | `takenMonster()` | 55 | ⏳ Pending |  |
| 110 | `getItem()` | 55 | ⏳ Pending |  |
| 111 | `goBattlePVC()` | 55 | ⏳ Pending |  |
| 112 | `drawCartoonOne()` | 56 | ⏳ Pending |  |
| 113 | `initBattle()` | 57 | ⏳ Pending |  |
| 114 | `runHit()` | 58 | ⏳ Pending |  |
| 115 | `drawPauseIco()` | 59 | ⏳ Pending |  |
| 116 | `initSkillList()` | 60 | ⏳ Pending |  |
| 117 | `isBagUse()` | 61 | ⏳ Pending |  |
| 118 | `getHitCoefficient()` | 63 | ⏳ Pending |  |
| 119 | `putMonster()` | 63 | ⏳ Pending |  |
| 120 | `getItemCount()` | 64 | ⏳ Pending |  |
| 121 | `data_init()` | 65 | ⏳ Pending |  |
| 122 | `isMoneyItem()` | 65 | ⏳ Pending |  |
| 123 | `changeMon()` | 67 | ⏳ Pending |  |
| 124 | `level_up()` | 67 | ⏳ Pending |  |
| 125 | `drawEffectImage()` | 68 | ⏳ Pending |  |
| 126 | `arangeMonster()` | 69 | ⏳ Pending |  |
| 127 | `drawInfoBG()` | 69 | ⏳ Pending |  |
| 128 | `goSelectAction()` | 70 | ⏳ Pending |  |
| 129 | `drawChangeMap()` | 70 | ⏳ Pending |  |
| 130 | `dItemIn()` | 71 | ⏳ Pending |  |
| 131 | `drawBattleBG()` | 72 | ⏳ Pending |  |
| 132 | `getMagic()` | 72 | ⏳ Pending |  |
| 133 | `getPrice()` | 73 | ⏳ Pending |  |
| 134 | `findItem()` | 74 | ⏳ Pending |  |
| 135 | `findMonsterMinLv()` | 74 | ⏳ Pending |  |
| 136 | `runThrowBall()` | 75 | ⏳ Pending |  |
| 137 | `checkMonster()` | 75 | ⏳ Pending |  |
| 138 | `drawBattleExp()` | 76 | ⏳ Pending |  |
| 139 | `setRelive()` | 76 | ⏳ Pending |  |
| 140 | `isShuXing()` | 77 | ⏳ Pending |  |
| 141 | `key_MONSTER_LIST()` | 77 | ⏳ Pending |  |
| 142 | `initNidusMap()` | 77 | ⏳ Pending |  |
| 143 | `delItemSkill()` | 78 | ⏳ Pending |  |
| 144 | `setCartoonFrameMagic_C()` | 78 | ⏳ Pending |  |
| 145 | `setEvolveStringB()` | 78 | ⏳ Pending |  |
| 146 | `keyGetSkill()` | 83 | ⏳ Pending |  |
| 147 | `isEvolveMake()` | 84 | ⏳ Pending |  |
| 148 | `changeEffect()` | 86 | ⏳ Pending |  |
| 149 | `getBuyItemCount()` | 89 | ⏳ Pending |  |
| 150 | `setEnemyThrow()` | 90 | ⏳ Pending |  |
| 151 | `goLIST_INFO()` | 91 | ⏳ Pending |  |
| 152 | `doEffectValue()` | 93 | ⏳ Pending |  |
| 153 | `drawClipPic()` | 94 | ⏳ Pending |  |
| 154 | `drawItem()` | 95 | ⏳ Pending |  |
| 155 | `enemy_init()` | 96 | ⏳ Pending |  |
| 156 | `drawMY_BAG()` | 97 | ⏳ Pending |  |
| 157 | `map_flashString()` | 97 | ⏳ Pending |  |
| 158 | `drawSelectMenu()` | 99 | ⏳ Pending |  |
| 159 | `drawMyMon()` | 99 | ⏳ Pending |  |
| 160 | `keyLIST_INFO()` | 100 | ⏳ Pending |  |
| 161 | `drawColorLine()` | 105 | ⏳ Pending |  |
| 162 | `drawVIEW_COMPUTER()` | 106 | ⏳ Pending |  |
| 163 | `goMAIN_MENU()` | 107 | ⏳ Pending |  |
| 164 | `drawMoney()` | 108 | ⏳ Pending |  |
| 165 | `runPauseIco()` | 108 | ⏳ Pending |  |
| 166 | `getMonster()` | 109 | ⏳ Pending |  |
| 167 | `drawAnimationBattle()` | 112 | ⏳ Pending |  |
| 168 | `initOtherImage()` | 112 | ⏳ Pending |  |
| 169 | `getEnemy()` | 112 | ⏳ Pending |  |
| 170 | `useItem()` | 117 | ⏳ Pending |  |
| 171 | `drawCityName()` | 118 | ⏳ Pending |  |
| 172 | `goVIEW_MONSTER()` | 121 | ⏳ Pending |  |
| 173 | `drawEnemyState()` | 122 | ⏳ Pending |  |
| 174 | `hit_rate()` | 122 | ⏳ Pending |  |
| 175 | `drawMagicUI()` | 123 | ⏳ Pending |  |
| 176 | `goMY_BAG()` | 124 | ⏳ Pending |  |
| 177 | `drawThrowBall()` | 125 | ⏳ Pending |  |
| 178 | `goBUY_ITEM()` | 126 | ⏳ Pending |  |
| 179 | `goRUN_IN_MAP()` | 129 | ⏳ Pending |  |
| 180 | `drawMonList()` | 138 | ⏳ Pending |  |
| 181 | `addItem()` | 142 | ⏳ Pending |  |
| 182 | `drawInfoList()` | 145 | ⏳ Pending |  |
| 183 | `drawMagicC()` | 146 | ⏳ Pending |  |
| 184 | `drawBuy()` | 148 | ⏳ Pending |  |
| 185 | `drawLIST_INFO()` | 149 | ⏳ Pending |  |
| 186 | `hpAdd()` | 151 | ⏳ Pending |  |
| 187 | `falselly()` | 163 | ⏳ Pending |  |
| 188 | `drawItemList()` | 167 | ⏳ Pending |  |
| 189 | `keyEvolveUI()` | 176 | ⏳ Pending |  |
| 190 | `drawPlayerAppear()` | 177 | ⏳ Pending |  |
| 191 | `mpAdd()` | 181 | ⏳ Pending |  |
| 192 | `levelPro()` | 193 | ⏳ Pending |  |
| 193 | `keyNidus()` | 210 | ⏳ Pending |  |
| 194 | `resetFealty()` | 227 | ⏳ Pending |  |
| 195 | `drawEvolveMake()` | 234 | ⏳ Pending |  |
| 196 | `runHitToState()` | 244 | ⏳ Pending |  |
| 197 | `goBattle()` | 260 | ⏳ Pending |  |
| 198 | `drawMONSTER_INFO()` | 264 | ⏳ Pending |  |
| 199 | `magicEffectRate()` | 271 | ⏳ Pending |  |
| 200 | `keyMY_BAG()` | 272 | ⏳ Pending |  |
| 201 | `drawEnemy()` | 273 | ⏳ Pending |  |
| 202 | `keyMagicUI()` | 300 | ⏳ Pending |  |
| 203 | `drawSkillList()` | 319 | ⏳ Pending |  |
| 204 | `key_gameRun()` | 375 | ⏳ Pending |  |
| 205 | `drawEvolveUI()` | 379 | ⏳ Pending |  |
| 206 | `paint_gameRun()` | 391 | ⏳ Pending |  |
| 207 | `keyBuyItem()` | 435 | ⏳ Pending |  |
| 208 | `popState()` | 479 | ⏳ Pending |  |
| 209 | `run_gameRun()` | 696 | ⏳ Pending |  |

## Progress Summary

- ✅ **Fixed:** 14 methods (including 5 failed decompilation methods)
- ⏭️ **Skipped:** 0 methods
- ⏳ **Pending:** 195 methods
- **Total:** 209 methods

## Failed Decompilation Methods Fixed

- ✅ `drawMonsterHp()` - Written from smali (HP bar drawing)
- ✅ `damage()` - Written from smali (damage calculation)
- ✅ `aiEnemy()` - Written from smali (AI enemy skill selection)
- ✅ `drawNidus()` - Written from smali (Large nidus drawing method - 978 instructions)
- ✅ `drawMagicC()` - Written from smali (Magic animation drawing)

## Notes

- Focus on logical differences only (ignore register allocation, line numbers, annotations)
- Register allocation differences are compiler-controlled and acceptable
- Work through methods from smallest to largest difference count
