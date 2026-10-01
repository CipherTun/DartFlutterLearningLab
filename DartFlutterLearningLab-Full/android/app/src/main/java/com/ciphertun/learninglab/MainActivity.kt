package com.ciphertun.learninglab

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.ciphertun.learninglab.runtime.RuntimeRegistry

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val runtimes = RuntimeRegistry()
        setContent { HostScreen(runtimes) }
    }
}

@Composable
private fun HostScreen(runtimes: RuntimeRegistry) {
    MaterialTheme(colorScheme = darkColorScheme(primary = androidx.compose.ui.graphics.Color(0xFFB7C9FF), secondary = androidx.compose.ui.graphics.Color(0xFFB6E8D4))) {
        Scaffold(topBar = { TopAppBar(title = { Column { Text("Dart + Flutter Learning Lab"); Text("Native Android + Compose host", style = MaterialTheme.typography.labelSmall) } }) }) { p ->
            Column(Modifier.fillMaxSize().padding(p).padding(16.dp), verticalArrangement = Arrangement.spacedBy(12.dp)) {
                Text("Learning Lab Host", style = MaterialTheme.typography.headlineMedium)
                Status("Dart", runtimes.dart.status())
                Status("Flutter", runtimes.flutter.status())
                Text("The Flutter module is the learning application. Compose is the native Android integration layer.")
            }
        }
    }
}

@Composable private fun Status(title: String, text: String) {
    ElevatedCard(Modifier.fillMaxWidth()) { Column(Modifier.padding(16.dp)) { Text(title, style = MaterialTheme.typography.titleLarge); Spacer(Modifier.height(4.dp)); Text(text) } }
}
