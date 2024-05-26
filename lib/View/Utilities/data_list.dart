//* Packages
import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//* Models
import '../../Model/device_models.dart';
import '../../Model/colors_model.dart';
import '../../Model/app_model.dart';
import '../../Model/experience_model.dart';
import '../../Model/skills_model.dart';

//* Screens
import '../Screens/apps_screens/About/about.dart';
import '../Screens/apps_screens/Education/education.dart';
import '../Screens/apps_screens/Experience/experience.dart';
import '../Screens/apps_screens/Skills/skills.dart';

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
    screen: const AboutMe(),
  ),
  AppModel(
    title: "Skills",
    color: Colors.white,
    icon: Icons.ac_unit_rounded,
    screen: const Skills(),
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
    screen: const Experience(),
  ),
  AppModel(
    title: "Education",
    color: Colors.white,
    icon: FontAwesomeIcons.edge,
    screen: const Education(),
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
    "Welcome to my portfolio website, this website is highly inspired from Pawan Kumar.\n\nI am a Developer with 1 years of experience in flutter. Worked in many projects most recently worked on aiChat an application that helps prepare students for exams and get solution form the ai and other exams.\n\nWhen I'm not developing spending  time watching some movies or series or just watching some standUp comedy and also spend time in spirituality visiting temples and Holy Placesand reads Holy books.";
const String playApps =
    "https://play.google.com/store/apps/developer?id=AppyMonk";

final List<JobExperience> education = [
  JobExperience(
    color: Colors.red,
    location: "Patiala, India",
    title: 'Computer Engineering',
    company: 'Thapar Institure of Engineering',
    startDate: 'June 2021',
    endDate: 'Present',
    bulletPoints: [
      "Currently in the final year of my college!",
    ],
  ),
  JobExperience(
    color: Colors.blue,
    location: "Patiala, India",
    title: 'Diploma in Computer Science',
    company: 'Thapar Polytechnic College',
    startDate: 'June 2018',
    endDate: 'June 2021',
    bulletPoints: [
      'Some of the best years of college life',
    ],
  ),
];

final List<JobExperience> jobExperiences = [
  JobExperience(
    color: Colors.blue,
    location: "Banglore, India",
    title: 'Full Stack Developer',
    company: 'Stimuler',
    startDate: 'Feb 2023',
    endDate: 'Present',
    bulletPoints: [
      "Actively develop and manage push notifications to engage users effectively.",
      "Successfully set up in-app purchase functionality for both iOS and Android platforms.",
      "Utilize the Provider package for streamlined state management and implement real-time data streams.",
      "Employ Amplitude and Firebase Analytics to track and analyze user behavior, informing data-driven decisions.",
      "The Startup has over 3,00,000 lakh active users",
    ],
  ),
  // Add more job experiences here...
  JobExperience(
    color: Colors.redAccent,
    location: "Remote",
    title: 'Flutter Developer',
    company: 'Perpetuum India',
    startDate: 'Oct 2022',
    endDate: 'Jan 2023',
    bulletPoints: [
      "Establish voice calling functionality using Agora SDK to enable real-time communication within the app.",
      "Implement intricate animations using Rive, enhancing the app's visual appeal and engagement.",
      "Collaborate directly with Stanza Living's CTO, gaining insights into industry best practices and cutting-edge technologies.",
      "Acquire proficiency in server-driven UI setup, optimizing app flexibility and scalability through dynamic configuration.",
    ],
  ),
  JobExperience(
    color: Colors.orangeAccent,
    location: "Remote",
    title: 'App Architecture Intern',
    company: 'Habeato',
    startDate: 'Oct 2021',
    endDate: 'Nov 2021',
    bulletPoints: [
      "Collaborated with founders to develop a HealthifyMe clone, demonstrating strong teamwork and app development skills.",
      "Engineered complex animations to enhance user experience and app visual appeal.",
      "Played an active role in system design processes, contributing to efficient and scalable app architecture.",
    ],
  ),
  JobExperience(
    color: Colors.greenAccent,
    location: "Remote",
    title: 'App Developer',
    company: 'Kylo Apps',
    startDate: 'Sep 2021',
    endDate: 'Oct 2021',
    bulletPoints: [
      "Collaborated as a team member in developing a cryptocurrency wallet, akin to Trust Wallet, showcasing strong teamwork and blockchain app development expertise.",
      "Proficiently integrated REST APIs into the application, enhancing its functionality and connectivity with external services."
    ],
  ),
  JobExperience(
    color: Colors.black,
    location: "Remote",
    title: 'Flutter App Intern',
    company: 'Cogent Web Services',
    startDate: 'Dec 2020',
    endDate: 'June 2021',
    bulletPoints: [
      "Independently developed a Life Simulator game using Flutter from scratch, applying state-of-the-art state management practices to ensure a top-tier user experience.",
      "Leveraged Flutter's robust features to craft an immersive and captivating gameplay experience, demonstrating proficiency in app development.",
      "Successfully implemented Google Ads, in-app purchases, and Hive database for efficient user data storage and monetization strategies.",
      "Generated creative ideas for client pitches, fostering creativity and ensuring the game's entertainment value and thought-provoking nature.",
      "Published the game on the Play Store, achieving over 5,000 downloads, showcasing the ability to deliver a popular and engaging mobile application.",
    ],
  ),
];

List<SkillsModel> skills = [
  SkillsModel(skillName: "Flutter", colorS: Colors.blue, iconPath: "random"),
  SkillsModel(
    skillName: "Firebase",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "Github",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "Dart",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "Provider",
    colorS: Colors.orange,
  ),
  SkillsModel(
    skillName: "Riverpod",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "Python",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "Code Magic",
    colorS: Colors.orange,
  ),
  SkillsModel(
    skillName: "Firebase",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "REST API",
    colorS: Colors.yellow,
  ),
];

List<SkillsModel> languages = [
  // SkillsModel(skillName: "Punjabi", colorS: Colors.orange),
  SkillsModel(skillName: "Hindi", colorS: Colors.black),
  SkillsModel(skillName: "English", colorS: Colors.blueGrey),
];
