import 'dart:io';
import 'package:flutter/services.dart';

enum TYPE { text, qrcode, barcode }

/// [TSCBTPrinter] this class provide print label using TSC Bluetooth Printer
class TSCBTPrinter {
  static const _platformPrinter = MethodChannel('printer_plus');

  /// print label [TEXT, QRCODE, BARCODE]
  static Future<bool> _print(
      {required String macAddress,
      required TYPE type,
      String? content,
      String? codePage,
      int? timeout,
      int? pageWidth,
      int? pageHeight,
      int? pageGap,
      int? printDirection,
      String? fontWeight,
      int? qty,
      int? axisX,
      int? axisY,
      int? height,
      bool? humanReadable,
      int? rotation,
      int? stretchX,
      int? stretchY,
      int? alignment}) async {
    try {
      if (Platform.isAndroid) {
        return await _platformPrinter
            .invokeMethod("printByTSCBTPrinter", <String, dynamic>{
          "macAddress": macAddress,
          "type": type.name,
          "content": content,
          "codePage": codePage,
          "timeout": timeout,
          "pageWidth": pageWidth,
          "pageHeight": pageHeight,
          "pageGap": pageGap,
          "printDirection": printDirection,
          "fontWeight": fontWeight,
          "qty": qty,
          "axisX": axisX,
          "axisY": axisY,
          "height": height,
          "humanReadable": humanReadable,
          "rotation": rotation,
          "stretchX": stretchX,
          "stretchY": stretchY,
          "alignment": alignment
        });
      } else {
        return false;
      }
    } catch (_) {
      return false;
    }
  }

  /// print label [TEXT]
  static Future<bool> printText(
      {required String macAddress,
      String? content,
      String? codePage,
      int? timeout,
      int? pageWidth,
      int? pageHeight,
      int? pageGap,
      int? printDirection,
      String? fontWeight,
      int? qty,
      int? axisX,
      int? axisY,
      int? rotation,
      int? stretchX,
      int? stretchY,
      int? alignment}) async {
    try {
      return await _print(
          macAddress: macAddress,
          type: TYPE.text,
          content: content,
          codePage: codePage,
          timeout: timeout,
          pageWidth: pageWidth,
          pageHeight: pageHeight,
          pageGap: pageGap,
          printDirection: printDirection,
          fontWeight: fontWeight,
          qty: qty,
          axisX: axisX,
          axisY: axisY,
          rotation: rotation,
          stretchX: stretchX,
          stretchY: stretchY,
          alignment: alignment);
    } catch (_) {
      return false;
    }
  }

  /// print label [QRCODE]
  static Future<bool> printQR(
      {required String macAddress,
      String? content,
      String? codePage,
      int? timeout,
      int? pageWidth,
      int? pageHeight,
      int? pageGap,
      int? printDirection,
      int? qty,
      int? axisX,
      int? axisY,
      int? rotation}) async {
    try {
      return await _print(
          macAddress: macAddress,
          type: TYPE.qrcode,
          content: content,
          codePage: codePage,
          timeout: timeout,
          pageWidth: pageWidth,
          pageHeight: pageHeight,
          pageGap: pageGap,
          printDirection: printDirection,
          qty: qty,
          axisX: axisX,
          axisY: axisY,
          rotation: rotation);
    } catch (_) {
      return false;
    }
  }

  /// print label [BARCODE]
  static Future<bool> printBarcode(
      {required String macAddress,
      String? content,
      String? codePage,
      int? timeout,
      int? pageWidth,
      int? pageHeight,
      int? pageGap,
      int? printDirection,
      int? qty,
      int? axisX,
      int? axisY,
      int? height,
      bool? humanReadable,
      int? rotation,
      int? stretchX,
      int? stretchY,
      int? alignment}) async {
    try {
      return await _print(
          macAddress: macAddress,
          type: TYPE.barcode,
          content: content,
          codePage: codePage,
          timeout: timeout,
          pageWidth: pageWidth,
          pageHeight: pageHeight,
          pageGap: pageGap,
          printDirection: printDirection,
          qty: qty,
          axisX: axisX,
          axisY: axisY,
          height: height,
          humanReadable: humanReadable,
          rotation: rotation,
          stretchX: stretchX,
          stretchY: stretchY,
          alignment: alignment);
    } catch (_) {
      return false;
    }
  }
}
