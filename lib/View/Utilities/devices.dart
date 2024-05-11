//* Packages
import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';

//* Models
import '../../Model/device_models.dart';
import '../../Model/colors_model.dart';

const double baseHeight = 790;
const double baseWidth = 1440;

List<DeviceModel> devices = [
  DeviceModel(
    device: Devices.android.onePlus8Pro,
    data: Icons.android,
  ),
  DeviceModel(
    device: Devices.ios.iPhone13,
    data: Icons.apple,
  ),
  DeviceModel(
    device: Devices.ios.iPad,
    data: Icons.tablet_mac,
  ),
];

List<ColorModel> colorPalette = [
  ColorModel(
    svgPath: "assets/images/cloudRed.svg",
    gradient: const LinearGradient(
      colors: [
        Colors.yellowAccent,
        Colors.deepOrange,
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    color: Colors.yellowAccent,
  ),
  ColorModel(
    svgPath: "assets/images/CloudyBlue.svg",
    gradient: const LinearGradient(
      colors: [
        Colors.blue,
        Colors.black45,
      ],
      begin: Alignment.topLeft,
    ),
    color: Colors.blue,
  ),
  ColorModel(
    svgPath: "assets/images/CloudyBlue.svg",
    gradient: const LinearGradient(
      colors: [
        Color(0xff00ebd5),
        Color(0xff293474),
      ],
      stops: [0, 1],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ),
    color: const Color(0xff00d6ca),
  ),
  ColorModel(
    svgPath: "assets/images/CloudyBlue.svg",
    gradient: const LinearGradient(
      colors: [
        Color(0xFF1042F4),
        Color(0x00203EA6),
      ],
      begin: Alignment.topLeft,
      end:  Alignment(-0.31, 0.95),
    ),
    color: const Color(0xff123cd1),
  ),
  ColorModel(
    svgPath: "assets/images/CloudyBlue.svg",
    gradient: const LinearGradient(
      [
        Color(0xffc95edb),
        Colors.black12,
      ],
      stops: [0, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    color: Colors.purple,
  ),
  ColorModel(
    svgPath: "assets/images/CloudyBlue.svg",
    gradient: const LinearGradient(
      [
        Colors.indigo,
        Colors.deepOrange,
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    color: const Color(0xfff35a32),
  ),
];
