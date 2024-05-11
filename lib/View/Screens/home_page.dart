//* Packages
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

//* Utility
import 'package:portfolio/View/Utilities/data_list.dart';

//* Providers
import '../../Controller/Provider/current_state_provider.dart';

//* Widgets
import '../Widgets/frosted_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CurrentStateProvider currentState =
        Provider.of<CurrentStateProvider>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: [
          Selector<CurrentStateProvider, int>(
            selector: (context, provider) => provider.knobSelected,
            builder: (context, _, __) {
              return Container(
                decoration: BoxDecoration(
                    gradient: colorPalette[currentState.knobSelected].gradient),
              );
            },
          ),
          Selector<CurrentStateProvider, int>(
            selector: (context, provider) => provider.knobSelected,
            builder: (context, _, __) {
              return SvgPicture.asset(
                colorPalette[currentState.knobSelected].svgPath,
                height: size.height,
                fit: BoxFit.cover,
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Column(
                    children: [
                      FrostedContainer(
                        height: 395,
                        width: 247.5,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FrostedContainer(
                        height: 175.5,
                        width: 245,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    height: size.height - 100,
                    child: Selector<CurrentStateProvider, DeviceInfo>(
                        selector: (context, provider) => provider.currentDevice,
                        builder: (context, _, __) {
                          return DeviceFrame(
                            device: currentState.currentDevice,
                            screen: const Center(
                              child: Text(
                                'Hello World',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    children: [
                      FrostedContainer(
                        height: 395,
                        width: 247.5,
                        childG: Center(
                          child: Wrap(
                            children: [
                              ...List.generate(
                                colorPalette.length,
                                (index) => Consumer<CurrentStateProvider>(
                                    builder: (context, _, __) {
                                  return CustomButton(
                                    margin: const EdgeInsets.all(10),
                                    onPressed: () {
                                      currentState.changeGradient(index);
                                    },
                                    pressed: currentState.knobSelected == index
                                        ? Pressed.pressed
                                        : Pressed.notPressed,
                                    animate: true,
                                    isThreeD: true,
                                    borderRadius: 100,
                                    height: 52,
                                    width: 52,
                                    shadowColor: Colors.white,
                                    backgroundColor: colorPalette[index].color,
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const FrostedContainer(
                        height: 175.5,
                        width: 247.5,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                    devices.length,
                    (index) => Selector<CurrentStateProvider, DeviceInfo>(
                        selector: (context, provider) => provider.currentDevice,
                        builder: (context, _, __) {
                          return CustomButton(
                            height: 38,
                            width: 38,
                            backgroundColor: Colors.black,
                            onPressed: () {
                              currentState
                                  .changeSelectedDevice(devices[index].device);
                            },
                            borderRadius: 100,
                            animate: true,
                            pressed: currentState.currentDevice ==
                                    devices[index].device
                                ? Pressed.pressed
                                : Pressed.notPressed,
                            isThreeD: true,
                            shadowColor: Colors.white60,
                            child: Center(
                              child: Icon(
                                devices[index].data,
                                color: Colors.white,
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
