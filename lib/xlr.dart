// import 'xlr_platform_interface.dart';

// class Xlr {
//   Future<String?> getPlatformVersion() {
//     return XlrPlatform.instance.getPlatformVersion();
//   }
// }

import 'dart:ffi';
import 'dart:io';

import 'package:xlr/bridge_generated.dart';

const base = "interface";
final path = Platform.isWindows ? "$base.dll" : "lib$base.so";
final dylib = Platform.isIOS
    ? DynamicLibrary.process()
    : Platform.isMacOS
        ? DynamicLibrary.executable()
        : DynamicLibrary.open(path);

final api = InterfaceImpl(dylib);

class Xlr {
  Future<int> getcounterfromrust() {
    return api.getCount();
  }
}
