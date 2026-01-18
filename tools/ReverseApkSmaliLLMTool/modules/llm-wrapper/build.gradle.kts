plugins {
    kotlin("jvm")
    kotlin("plugin.serialization")
}

dependencies {
    implementation(project(":core"))
    implementation(kotlin("stdlib"))
    
    // LLM API client (OpenAI-compatible)
    implementation("com.aallam.openai:openai-client:3.7.0")
    implementation("io.ktor:ktor-client-core:2.3.7")
    implementation("io.ktor:ktor-client-cio:2.3.7")
    implementation("io.ktor:ktor-client-content-negotiation:2.3.7")
    implementation("io.ktor:ktor-serialization-kotlinx-json:2.3.7")
    
    // JSON handling
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.6.2")
}

