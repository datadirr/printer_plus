import 'dart:io';
import 'package:flutter/services.dart';

class TSCBLEPrinter {
  static const _platformPrinter = MethodChannel('printer_plus');

  static Future<bool> _print(
      {required String macAddress,
      required String type,
      String? content,
      String? codePage,
      int? timeout,
      int? pageWidth,
      int? pageHeight,
      int? pageGap,
      String? fontWeight,
      int? qty,
      int? axisX,
      int? axisY,
      int? height,
      bool? humanReadable,
      int? rotation,
      int? stretchX,
      int? stretchY}) async {
    if (Platform.isAndroid) {
      return await _platformPrinter
          .invokeMethod("printByTSCBLEPrinter", <String, dynamic>{
        "macAddress": macAddress,
        "type": type,
        "content": content,
        "codePage": codePage,
        "timeout": timeout,
        "pageWidth": pageWidth,
        "pageHeight": pageHeight,
        "pageGap": pageGap,
        "fontWeight": fontWeight,
        "qty": qty,
        "axisX": axisX,
        "axisY": axisX,
        "height": height,
        "humanReadable": humanReadable,
        "rotation": rotation,
        "stretchX": stretchX,
        "stretchY": stretchY
      });
    } else {
      return false;
    }
  }

  static Future<bool> printText(
      {required String macAddress,
      String? content,
      String? codePage,
      int? timeout,
      int? pageWidth,
      int? pageHeight,
      int? pageGap,
      String? fontWeight,
      int? qty,
      int? axisX,
      int? axisY,
      int? rotation,
      int? stretchX,
      int? stretchY}) async {
    return await _print(
        macAddress: macAddress,
        type: "text",
        content: content,
        codePage: codePage,
        timeout: timeout,
        pageWidth: pageWidth,
        pageHeight: pageHeight,
        pageGap: pageGap,
        fontWeight: fontWeight,
        qty: qty,
        axisX: axisX,
        axisY: axisY,
        rotation: rotation,
        stretchX: stretchX,
        stretchY: stretchY);
  }

  static Future<bool> printQR(
      {required String macAddress,
      String? content,
      String? codePage,
      int? timeout,
      int? pageWidth,
      int? pageHeight,
      int? pageGap,
      int? qty,
      int? axisX,
      int? axisY,
      int? rotation}) async {
    return await _print(
        macAddress: macAddress,
        type: "qrcode",
        content: content,
        codePage: codePage,
        timeout: timeout,
        pageWidth: pageWidth,
        pageHeight: pageHeight,
        pageGap: pageGap,
        qty: qty,
        axisX: axisX,
        axisY: axisY,
        rotation: rotation);
  }

  static Future<bool> printBarcode(
      {required String macAddress,
      String? content,
      String? codePage,
      int? timeout,
      int? pageWidth,
      int? pageHeight,
      int? pageGap,
      int? qty,
      int? axisX,
      int? axisY,
      int? height,
      bool? humanReadable,
      int? rotation,
      int? stretchX,
      int? stretchY}) async {
    return await _print(
        macAddress: macAddress,
        type: "barcode",
        content: content,
        codePage: codePage,
        timeout: timeout,
        pageWidth: pageWidth,
        pageHeight: pageHeight,
        pageGap: pageGap,
        qty: qty,
        axisX: axisX,
        axisY: axisY,
        height: height,
        humanReadable: humanReadable,
        rotation: rotation,
        stretchX: stretchX,
        stretchY: stretchY);
  }
}
