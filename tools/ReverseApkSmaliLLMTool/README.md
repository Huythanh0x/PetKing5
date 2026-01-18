# ReverseApkSmaliLLMTool

A Kotlin Swing application for reverse engineering APK files by comparing original smali code with compiled smali from Java source, using LLM to suggest and apply fixes for mismatches.

## Features

- **Smali Diff Comparison**: Compare original APK smali with compiled smali from Java source
- **Pattern Detection**: Identify common mismatch patterns (redundant loads, control flow, etc.)
- **LLM-Powered Fix Suggestions**: Use LLM to suggest Java code fixes for detected mismatches
- **One-Click Apply**: Single accept button to apply LLM suggestions to Java source

## Architecture

```
core/
  - SmaliParser.kt      # Parse smali files
  - DiffAnalyzer.kt     # Compare and analyze differences
  - PatternDetector.kt  # Detect common mismatch patterns
  - LLMFixSuggester.kt  # LLM-based fix suggestions

ui/
  - MainWindow.kt       # Main application window
  - DiffViewPanel.kt    # Side-by-side diff viewer
  - MethodListPanel.kt  # Method/file selector
  - SuggestionPanel.kt  # LLM suggestion display with accept button
```

## Build

```bash
./gradlew build
```

## Run

```bash
./gradlew run
```

## License

Part of PetKing5 reverse engineering project.

