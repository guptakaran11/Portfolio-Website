//* Packages
import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//* Models
import '../../Model/device_models.dart';
import '../../Model/colors_model.dart';
import '../../Model/app_model.dart';

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
    svgPath: "assets/images/cloudydarkBlue.svg",
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
      end: Alignment(-0.31, 0.95),
    ),
    color: const Color(0xff123cd1),
  ),
  ColorModel(
    svgPath: "assets/images/CloudyBlue.svg",
    gradient: const LinearGradient(
      colors: [
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
    svgPath: "assets/images/cloudydarkBlue.svg",
    gradient: const LinearGradient(
      colors: [
        Colors.indigo,
        Colors.deepOrange,
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    color: const Color(0xfff35a32),
  ),
];

List<AppModel> apps = [
  AppModel(
    title: "About",
    color: Colors.white,
    icon: Icons.person,
    // screen: const AboutMe(),
  ),
  AppModel(
    title: "Skills",
    color: Colors.white,
    icon: Icons.ac_unit_rounded,
    // screen: const Skills(),
  ),
  AppModel(
    title: "Youtube",
    assetPath: "assets/icons/youtube.svg",
    color: Colors.white,
    link: youtubeChannel,
  ),
  AppModel(
    title: "LinkedIn",
    assetPath: "assets/icons/linkedin.svg",
    color: Colors.white,
    link: linkedIn,
  ),
  AppModel(
    title: "Twitter/X",
    assetPath: "assets/icons/twitter.svg",
    color: Colors.white,
    link: twitter,
  ),
  AppModel(
    title: "Hashnode",
    assetPath: "assets/icons/hashnode.png",
    color: Colors.white,
    link: hashnode,
  ),
  AppModel(
    title: "Experience",
    color: Colors.white,
    icon: FontAwesomeIcons.idBadge,
    // screen: const Experience(),
  ),
  AppModel(
    title: "Education",
    color: Colors.white,
    icon: FontAwesomeIcons.edge,
    // screen: const Education(),
  ),
  AppModel(
    title: "Github",
    assetPath: "assets/icons/github.svg",
    color: Colors.white,
    link: github,
  ),
  AppModel(
    title: "Play Store",
    assetPath: "assets/icons/playstore.svg",
    color: Colors.white,
    link: playApps,
  ),
];

const String youtubeChannel =
    "https://youtube.com/@karangupta-fl7qo?si=ByNwv8fDIi6mX9X2";
const String linkedIn = "https://www.linkedin.com/in/karan-gupta11/";
const String github = "https://github.com/guptakaran11";
const String twitter = "https://twitter.com/Gupta_Karan11";
const String hashnode = "https://hashnode.com/@KaranGupta";
const String resumeLink =
    "https://drive.google.com/file/d/1hidUO-Gszm7v5qNBEIDoEed6sIPgo2Gb/view";
const String email = "developer.karangupta@gmail.com";
String introduction =
    "Welcome to my portfolio website, this website is highly inspired(almost copied) from Pawan Kumar.\n\nI am a Developer with 1 years of experience in flutter. Worked in many projects most recently worked on aiChat an application that helps prepare students for exams and get solution form the ai and other exams.\n\nWhen i am not developing I am mainly watching some movies or series or just watching fireship";
const String playApps =
    "https://play.google.com/store/apps/developer?id=AppyMonk";
