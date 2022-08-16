package com.example.test_mottu

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val getContentChannel =
                MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "getContent")

        getContentChannel.setMethodCallHandler { call, result ->
            when (call.method) {
                "getContent" -> {
                    var index = call.arguments as Int
                    var resultText = "nenhum indice selecionado"
                    when (index) {
                        0 -> resultText = "Conteudo do indice 0"
                        1 -> resultText = "Conteudo do indice 1"
                        2 -> resultText = "Conteudo do indice 2"
                        else -> { // Note the block
                            resultText = "ìndice não encontrado"
                        }
                    }
                    result.success(resultText)
                }
                else -> result.notImplemented()
            }
        }
    }
}
