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
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [
                  Colors.blue,
                  Colors.black45,
                ],
              ),
            ),
          ),
          SvgPicture.asset(
            "assets/images/CloudyBlue.svg",
            height: size.height,
            fit: BoxFit.cover,
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
                        width: 247,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FrostedContainer(
                        height: 175,
                        width: 247,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    height: size.height - 100,
                    child: Consumer<CurrentStateProvider>(
                        builder: (context, _, __) {
                      return DeviceFrame(
                        device: currentState.currentDevice,
                        screen: Container(
                          color: Colors.red,
                          child: const Center(
                            child: Text(
                              'Hello World',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Column(
                    children: [
                      FrostedContainer(
                        height: 395,
                        width: 247,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FrostedContainer(
                        height: 175,
                        width: 247,
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
