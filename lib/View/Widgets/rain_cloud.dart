//* Dart Packages
import 'dart:developer';

// Packages
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';

class Rain extends StatefulWidget {
  final double top;
  final bool oposite;

  const Rain({
    super.key,
    required this.top,
    required this.oposite,
  });

  @override
  State<Rain> createState() => _RainState();
}

class _RainState extends State<Rain> {
  SMIInput<bool>? rain;
  SMIInput<bool>? hover;
  Artboard? rainArtBoard;

  void playRain() {
    if (rain?.value == false) {
      rain?.value = true;
    } else if (rain?.value == true) {
      rain?.value = false;
    }
  }

  @override
  void initState() {
    super.initState();
    loadRiveFile();
  }

  Future<void> loadRiveFile() async {
    try {
      final data = await rootBundle.load('assets/rive/cloud_icon.riv');
      final file = RiveFile.import(data);
      final artBoard = file.mainArtboard;
      var controller =
          StateMachineController.fromArtboard(artBoard, 'State Machine 1');

      if (controller != null) {
        artBoard.addController(controller);
        rain = controller.findInput<bool>('isPressed');
        hover = controller.findInput<bool>('isHover');
        rain?.value = false;
        hover?.value = false;
        setState(() {
          rainArtBoard = artBoard;
        });
      } else {
        log('Error: Controller is null');
      }
    } catch (e) {
      log('Error loading Rive file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return rainArtBoard != null
        ? TweenAnimationBuilder(
            tween: Tween<double>(
              begin: widget.oposite ? size.width - 180 : 0,
              end: widget.oposite ? 0 : size.width - 180,
            ),
            duration: const Duration(seconds: 600),
            builder: (context, value, child) {
              return Positioned(
                top: widget.top,
                left: value,
                child: SizedBox(
                  width: 200,
                  height: 100,
                  child: MouseRegion(
                    onEnter: (_) {
                      if (hover != null) hover!.value = true;
                    },
                    onExit: (_) {
                      if (hover != null) hover!.value = false;
                    },
                    child: GestureDetector(
                      onTap: playRain,
                      child: Rive(
                        artboard: rainArtBoard!,
                        useArtboardSize: true,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Container();
  }
}
