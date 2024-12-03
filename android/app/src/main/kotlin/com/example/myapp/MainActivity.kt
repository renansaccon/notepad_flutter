package com.example.myapp

import io.flutter.embedding.android.FlutterActivity;
import android.os.Build;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.embedding.engine.FlutterEngine;

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.device/nameDevice"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine){
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getDeviceName") {
                val deviceName = Build.MODEL
                result.success(deviceName)
            } else {
                result.notImplemented()
            }
        }
    }

}


