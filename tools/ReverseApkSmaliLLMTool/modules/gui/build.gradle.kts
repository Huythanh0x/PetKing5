plugins {
    kotlin("jvm")
    application
}

dependencies {
    implementation(project(":cli")) // GUI wraps CLI
    implementation(kotlin("stdlib"))
    implementation("com.formdev:flatlaf:3.2.5")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-swing:1.7.3")
}

application {
    mainClass.set("com.petking.reverse.MainKt")
}
