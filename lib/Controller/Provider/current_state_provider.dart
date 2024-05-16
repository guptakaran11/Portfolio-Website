//* Dart Packages
import 'dart:developer';

//* Packages
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//* Screens
import 'package:portfolio/View/Screens/main_screens/phone_home.dart';

//* Utility
import 'package:portfolio/View/Utilities/data_list.dart';

class CurrentStateProvider extends ChangeNotifier {
  DeviceInfo currentDevice = Devices.ios.iPhone13;
  String selectedCloud = "assets/images/cloudyBlue.svg";
  int knobSelected = 2;

  Gradient bgGradient = const LinearGradient(
    begin: Alignment.topLeft,
    // end: Alignment(0, -0.4),
    colors: [Colors.blue, Colors.black45],
  );

  int selectedColor = 1; // values can range from 0 to 5

  void changeSelectedDevice(DeviceInfo device) {
    currentDevice = device;
    notifyListeners();
  }

  String? title;
  bool isMainScreen = true;

  Widget currentScreen = const PhoneHomeScreen();

  void changeGradient(int index) {
    selectedColor = index;
    bgGradient = colorPalette[index].gradient;
    selectedCloud = colorPalette[index].svgPath;
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

  void changePhoneScreen(Widget change, bool isMain, {String? titleL}) {
    // current
    currentScreen = change;
    isMainScreen = isMain;
    title = titleL;
    notifyListeners();
  }
}
