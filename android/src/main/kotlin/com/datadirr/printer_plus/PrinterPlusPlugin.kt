package com.datadirr.printer_plus

/*import androidx.annotation.NonNull*/
import android.util.Log

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import com.example.tscdll.TSCActivity

/*import com.example.tscdll.TSCUSBActivity
import com.example.tscdll.TscWifiActivity*/

enum class TYPE {
    text,
    qrcode,
    barcode
}

/** PrinterPlusPlugin */
class PrinterPlusPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "printer_plus")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        try {
            when (call.method) {
                "getPlatformVersion" -> {
                    result.success("Android ${android.os.Build.VERSION.RELEASE}")
                }

                "printByTSCBTPrinter" -> {
                    val arg = call.arguments as Map<*, *>
                    val macAddress = (arg["macAddress"] as String?) ?: ""
                    val type = (arg["type"] as String?) ?: ""
                    val content = (arg["content"] as String?) ?: ""
                    val codePage = (arg["codePage"] as String?) ?: "UTF-8"
                    val timeout = (arg["timeout"] as Int?) ?: 0
                    val pageWidth = (arg["pageWidth"] as Int?) ?: 80
                    val pageHeight = (arg["pageHeight"] as Int?) ?: 40
                    val pageGap = (arg["pageGap"] as Int?) ?: 2
                    val printDirection = (arg["printDirection"] as Int?) ?: 0
                    val fontWeight = (arg["fontWeight"] as String?) ?: "0"
                    val qty = (arg["qty"] as Int?) ?: 1
                    val axisX = (arg["axisX"] as Int?) ?: 0
                    val axisY = (arg["axisY"] as Int?) ?: 0
                    val height = (arg["height"] as Int?) ?: 0
                    val humanReadable = (arg["humanReadable"] as Boolean?) ?: true
                    val rotation = (arg["rotation"] as Int?) ?: 0
                    val stretchX = (arg["stretchX"] as Int?) ?: 1
                    val stretchY = (arg["stretchY"] as Int?) ?: 1
                    val alignment = (arg["alignment"] as Int?) ?: 0

                    printByTSCBTPrinter(
                            result = result,
                            macAddress = macAddress,
                            type = type,
                            content = content,
                            codePage = codePage,
                            timeout = timeout,
                            pageWidth = pageWidth,
                            pageHeight = pageHeight,
                            pageGap = pageGap,
                            printDirection = printDirection,
                            fontWeight = fontWeight,
                            qty = qty,
                            axisX = axisX,
                            axisY = axisY,
                            height = height,
                            humanReadable = humanReadable,
                            rotation = rotation,
                            stretchX = stretchX,
                            stretchY = stretchY,
                            alignment = alignment
                    )
                }

                else -> {
                    result.success("notImplemented")
                    /*result.notImplemented()*/
                }
            }
        } catch (e: Exception) {
            Log.e("EXCEPTION", e.toString())
            result.success(false)
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun printByTSCBTPrinter(
        result: Result,
        macAddress: String,
        type: String,
        content: String,
        codePage: String,
        timeout: Int,
        pageWidth: Int,
        pageHeight: Int,
        pageGap: Int,
        printDirection: Int,
        fontWeight: String,
        qty: Int,
        axisX: Int,
        axisY: Int,
        height: Int,
        humanReadable: Boolean,
        rotation: Int,
        stretchX: Int,
        stretchY: Int,
        alignment: Int
    ) {
        try {
            if (macAddress.isNotEmpty()) {
                val humanReadableValue = if (humanReadable) "1" else "0"

                val tscBTSdk = TSCActivity() //BT
                tscBTSdk.openport(macAddress) //BT

                /*val tscNetSdk = TscWifiActivity() //WiFi,ETHERNET,NET
                tscNetSdk.openport(ipAddress, 9100) //WiFi,ETHERNET,NET

                val tscUSBSdk = TSCUSBActivity() //USB
                tscUSBSdk.openport(usbManager, usbDevice) //USB*/

                if (tscBTSdk.IsConnected) {
                    tscBTSdk.sendcommand("CODEPAGE $codePage\r\n")
                    tscBTSdk.sendcommand("SIZE $pageWidth mm, $pageHeight mm\r\n")
                    tscBTSdk.sendcommand("GAP $pageGap mm, 0 mm\r\n")
                    /*tscBTSdk.sendcommand("BLINE 2 mm, 0 mm\r\n")*/
                    tscBTSdk.sendcommand("SPEED 4\r\n")
                    tscBTSdk.sendcommand("DENSITY 12\r\n")
                    tscBTSdk.sendcommand("SET TEAR ON\r\n")
                    tscBTSdk.sendcommand("DIRECTION $printDirection\r\n")
                    /*tscBTSdk.sendcommand("SET COUNTER @1 1\r\n")
                    tscBTSdk.sendcommand("@1 = \"0001\"\r\n")*/
                    tscBTSdk.sendcommand("CLS\r\n")

                    when (type) {
                        TYPE.text.name -> {
                            tscBTSdk.sendcommand("TEXT $axisX,$axisY,\"$fontWeight\",$rotation,$stretchX,$stretchY,$alignment,\"$content\"\r\n")
                        }

                        TYPE.qrcode.name -> {
                            tscBTSdk.sendcommand("QRCODE $axisX,$axisY,Q,8,A,$rotation,M1,S7,\"$content\"\r\n")
                        }

                        TYPE.barcode.name -> {
                            tscBTSdk.sendcommand("BARCODE $axisX,$axisY,\"128\",$height,$humanReadableValue,$rotation,$stretchX,$stretchY,$alignment,\"$content\"\r\n")
                        }
                    }

                    tscBTSdk.sendcommand("PRINT $qty, 1\r\n")
                    tscBTSdk.closeport(timeout)
                    result.success(true)
                } else {
                    tscBTSdk.closeport(timeout)
                    Log.e("LOG", "MAC Address not connect")
                    result.success(false)
                }
            } else {
                Log.e("LOG", "MAC Address not found")
                result.success(false)
            }
        } catch (e: Exception) {
            Log.e("EXCEPTION", e.toString())
            result.success(false)
        }
    }
}
