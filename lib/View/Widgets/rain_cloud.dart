//* Packages
import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';

class Rain extends StatefulWidget {
  // final double top;
  // final bool oposite;

  const Rain({
    super.key,
    // required this.top,
    // required this.oposite,
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

    rootBundle.load('assets/rive/rain.riv').then((value) {
      final file = RiveFile.import(value);
      final artBoard = file.mainArtboard;
      var controller =
          StateMachineController.fromArtboard(artBoard, 'State Machine 1');

      if (controller != null) {
        // do something here matey
        artBoard.addController(controller);
        rain = controller.findInput('isPressed');
        hover = controller.findInput('isHover');
        rain?.value = false;
        hover?.value = false;
      }
      setState(() {
        rainArtBoard = file.mainArtboard;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return rainArtBoard != null
        ? TweenAnimationBuilder(
            tween: Tween(
              begin: 0,
              end: size.width - 180,
            ),
            duration: const Duration(seconds: 3),
            builder: (context, value, _) {
              return Positioned(
                left: value.toDouble(),
                child: SizedBox(
                  width: 200,
                  height: 100,
                  child: MouseRegion(
                    onEnter: (_) {
                      hover?.value == true;
                    },
                    onExit: (_) {
                      hover?.value == false;
                    },
                    child: GestureDetector(
                      onTap: () => playRain(),
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
