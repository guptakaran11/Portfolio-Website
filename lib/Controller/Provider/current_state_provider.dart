import 'dart:developer';

import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CurrentStateProvider extends ChangeNotifier {
  DeviceInfo currentDevice = Devices.ios.iPhone13;
  int knobSelected = 2;

  void changeSelectedDevice(DeviceInfo device) {
    currentDevice = device;
    notifyListeners();
  }

  void changeGradient(int index) {
    knobSelected = index;
    notifyListeners();
  }

  Future<void> launchInBrowser(String link) async {
    Uri url = Uri.parse(link);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        log("Error loading $url");
      }
    } catch (e) {
      log(e.toString());
      log("Something Went wrong");
    }
  }
}
