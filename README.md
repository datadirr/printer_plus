[<img src="https://datadirr.com/datadirr.png" width="200" />](https://datadirr.com)


# printer_plus

This package helps to encryption and decryption with or without secret key.

## Using

For help getting started with Flutter, view our
[online documentation](https://pub.dev/documentation/printer_plus/latest), which offers tutorials,
samples, guidance on mobile and web development, and a full API reference.

## Installation

First, add `printer_plus` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/platform-integration/platform-channels).

In your flutter project add the dependency:

```yml
dependencies:
  ...
  printer_plus:
```

For help getting started with Flutter, view the online
[documentation](https://flutter.io/).


## Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :-----: |
|   ✔️    | ️X  |  ️X   | ️X  |  ️X   |   ️X    |


## Setup
### Change the minSdkVersion for Android

Flutter_blue is compatible only from version 19 of Android SDK so you should change this in **android/app/build.gradle**:
```dart
Android {
  defaultConfig {
     minSdkVersion: 19
```
### Add permissions for Bluetooth
We need to add the permission to use Bluetooth and access location:

#### **Android**
In the **android/app/src/main/AndroidManifest.xml** let’s add:

```xml
	 <uses-permission android:name="android.permission.BLUETOOTH" />  
	 <uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />  
	 <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
```
#### **IOS**
In the **ios/Runner/Info.plist** let’s add:

```dart 
	<dict>  
	    <key>NSBluetoothAlwaysUsageDescription</key>  
	    <string>Need BLE permission</string>  
	    <key>NSBluetoothPeripheralUsageDescription</key>  
	    <string>Need BLE permission</string>  
	    <key>NSLocationAlwaysAndWhenInUseUsageDescription</key>  
	    <string>Need Location permission</string>  
	    <key>NSLocationAlwaysUsageDescription</key>  
	    <string>Need Location permission</string>  
	    <key>NSLocationWhenInUseUsageDescription</key>  
	    <string>Need Location permission</string>
```

For location permissions on iOS see more at: [https://developer.apple.com/documentation/corelocation/requesting_authorization_for_location_services](https://developer.apple.com/documentation/corelocation/requesting_authorization_for_location_services)


## Example

Please follow this [example](https://github.com/datadirr/printer_plus/tree/master/example) here.

### Print (TSC Bluetooth Printer)

```dart
TSCBTPrinter.printText(macAddress: "MAC Address", content: "datadirr");
TSCBTPrinter.printQR(macAddress: "MAC Address", content: "datadirr");
TSCBTPrinter.printBarcode(macAddress: "MAC Address", content: "datadirr");
```
