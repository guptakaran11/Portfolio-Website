//* Packages
import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';

//* Models
import '../../Model/device_models.dart';

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
