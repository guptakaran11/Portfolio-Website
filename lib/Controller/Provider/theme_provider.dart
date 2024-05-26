//* Packages
import 'package:flutter/material.dart';

//* Utilities
import '../../View/Utilities/data_list.dart';

class ThemeProvider extends ChangeNotifier {
  late BuildContext context;
  late Size size;
  late double heightRatio = size.height / baseHeight;
  late double widthRatio = size.width / baseWidth;
}
