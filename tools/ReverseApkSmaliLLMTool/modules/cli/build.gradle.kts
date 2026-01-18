plugins {
    kotlin("jvm")
    application
}

dependencies {
    implementation(project(":core"))
    implementation(project(":utils"))
    implementation(project(":apktool-wrapper"))
    implementation(project(":jadx-wrapper"))
    implementation(project(":llm-wrapper"))
    implementation(kotlin("stdlib"))
}

application {
    mainClass.set("com.petking.reverse.cli.CliMainKt")
}
