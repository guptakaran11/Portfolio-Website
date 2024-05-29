import 'package:flutter/material.dart';

class Projects {
  final Color color;
  final String title;
  final String startDate;
  final String endDate;
  final List<String> bulletPoints;
  final List<String> skills;
  final String githublink;

  Projects({
    required this.color,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.bulletPoints,
    required this.skills,
    required this.githublink,
  });
}
