rootProject.name = "ReverseApkSmaliLLMTool"

include("core")
include("utils")
include("apktool-wrapper")
include("jadx-wrapper")
include("llm-wrapper")
include("cli")
include("gui")

project(":core").projectDir = file("modules/core")
project(":utils").projectDir = file("modules/utils")
project(":apktool-wrapper").projectDir = file("modules/apktool-wrapper")
project(":jadx-wrapper").projectDir = file("modules/jadx-wrapper")
project(":llm-wrapper").projectDir = file("modules/llm-wrapper")
project(":cli").projectDir = file("modules/cli")
project(":gui").projectDir = file("modules/gui")
