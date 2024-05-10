import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

class CurrentStateProvider extends ChangeNotifier {
  DeviceInfo currentDevice = Devices.ios.iPhone13;

  void changeSelectedDevice(DeviceInfo device) {
    currentDevice = device;
    notifyListeners();
  }
}
