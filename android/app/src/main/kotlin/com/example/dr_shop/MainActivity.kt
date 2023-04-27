package com.example.myapp

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.tekartik.sqflite.SqflitePlugin

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        // Registra la implementación de la plataforma de sqflite
        SqflitePlugin.registerWith(flutterEngine.dartExecutor.binaryMessenger)
    }
}
