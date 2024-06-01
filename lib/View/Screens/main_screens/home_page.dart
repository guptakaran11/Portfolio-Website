//* Packages
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

//* Utility
import 'package:portfolio/View/Utilities/data_list.dart';

//* Providers
import '../../../Controller/Provider/current_state_provider.dart';
import '../../../Controller/Provider/theme_provider.dart';

//* Widgets
import '../../Widgets/frosted_container.dart';
import '../../Widgets/rain_cloud.dart';

//* Screens
import '../main_screens/phone_screen_wrapper.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     CurrentStateProvider currentState =
//         Provider.of<CurrentStateProvider>(context, listen: false);
//     return Scaffold(
//       body: Stack(
//         children: [
//           Selector<CurrentStateProvider, int>(
//             selector: (context, provider) => provider.knobSelected,
//             builder: (context, _, __) {
//               return Container(
//                 decoration: BoxDecoration(
//                   gradient: colorPalette[currentState.knobSelected].gradient,
//                 ),
//               );
//             },
//           ),
//           const Rain(
//             top: 20,
//             oposite: false,
//           ),
//           const Rain(
//             top: 275,
//             oposite: true,
//           ),
//           Selector<CurrentStateProvider, int>(
//             selector: (context, provider) => provider.knobSelected,
//             builder: (context, _, __) {
//               return SvgPicture.asset(
//                 colorPalette[currentState.knobSelected].svgPath,
//                 height: size.height,
//                 fit: BoxFit.cover,
//               );
//             },
//           ),

//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Column(
//                     children: [
//                       FrostedContainer(
//                         height: 395,
//                         width: 247.5,
//                       ),
//                       SizedBox(height: 20),
//                       FrostedContainer(
//                         height: 175.5,
//                         width: 245,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(width: 8),
//                   SizedBox(
//                     height: size.height - 100,
//                     child: Consumer<CurrentStateProvider>(
//                         builder: (context, _, __) {
//                       return DeviceFrame(
//                         device: currentState.currentDevice,
//                         screen: Container(
//                           decoration: BoxDecoration(
//                             gradient: colorPalette[currentState.knobSelected]
//                                 .gradient,
//                           ),
//                           child: ScreenWrapper(
//                             childG: currentState.currentScreen,
//                           ),
//                         ),
//                       );
//                     }),
//                   ),
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   Column(
//                     children: [
//                       FrostedContainer(
//                         height: 395,
//                         width: 247.5,
//                         childG: Center(
//                           child: Wrap(
//                             children: [
//                               ...List.generate(
//                                 colorPalette.length,
//                                 (index) => Consumer<CurrentStateProvider>(
//                                     builder: (context, _, __) {
//                                   return CustomButton(
//                                     margin: const EdgeInsets.all(10),
//                                     onPressed: () {
//                                       currentState.changeGradient(index);
//                                     },
//                                     pressed: currentState.knobSelected == index
//                                         ? Pressed.pressed
//                                         : Pressed.notPressed,
//                                     animate: true,
//                                     isThreeD: true,
//                                     borderRadius: 100,
//                                     height: 52,
//                                     width: 52,
//                                     shadowColor: Colors.white,
//                                     backgroundColor: colorPalette[index].color,
//                                   );
//                                 }),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const FrostedContainer(
//                         height: 175.5,
//                         width: 247.5,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   ...List.generate(
//                     devices.length,
//                     (index) => Selector<CurrentStateProvider, DeviceInfo>(
//                         selector: (context, provider) => provider.currentDevice,
//                         builder: (context, _, __) {
//                           return CustomButton(
//                             height: 38,
//                             width: 38,
//                             backgroundColor: Colors.black,
//                             onPressed: () {
//                               currentState
//                                   .changeSelectedDevice(devices[index].device);
//                             },
//                             borderRadius: 100,
//                             animate: true,
//                             pressed: currentState.currentDevice ==
//                                     devices[index].device
//                                 ? Pressed.pressed
//                                 : Pressed.notPressed,
//                             isThreeD: true,
//                             shadowColor: Colors.white60,
//                             child: Center(
//                               child: Icon(
//                                 devices[index].data,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           );
//                         }),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context, listen: false);
    CurrentStateProvider currentState =
        Provider.of<CurrentStateProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    theme.size = MediaQuery.of(context).size;
    theme.widthRatio = theme.size.width / baseWidth;
    theme.heightRatio = theme.size.height / baseHeight;
    bool phone = false;
    if (size.width < 800) {
      phone = true;
    }

    return Scaffold(
      body: Stack(
        children: [
          Selector<CurrentStateProvider, Gradient>(
            selector: (context, provider) => provider.bgGradient,
            builder: (context, _, __) {
              return Container(
                decoration: BoxDecoration(gradient: currentState.bgGradient),
              );
            },
          ),
          size.height > 600
              ? const Rain(
                  oposite: false,
                  top: 300,
                )
              : Container(),
          Selector<CurrentStateProvider, String>(
            selector: (context, provider) => provider.selectedCloud,
            builder: (context, _, __) {
              return SvgPicture.asset(
                currentState.selectedCloud,
                // width: double.infinity,
                height: size.height,
                fit: BoxFit.cover,
              );
            },
          ),
          size.height > 600
              ? const Rain(
                  oposite: true,
                  top: 50,
                )
              : Container(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Left side frosted Containers

                  phone
                      ? Container()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform(
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.01)
                                ..rotateY(-0.06),
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                margin: EdgeInsets.only(
                                    top: 0, bottom: 10 * theme.heightRatio),
                                child: FrostedContainer(
                                  childG: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Transform(
                                      transform: Matrix4.identity()
                                        ..setEntry(3, 2, 0.01)
                                        ..rotateY(-0.06),
                                      alignment: FractionalOffset.center,
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: AutoSizeText(
                                                  'Karan',
                                                  style: GoogleFonts.exo(
                                                      fontSize: 35,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  maxFontSize: 35,
                                                  minFontSize: 15,
                                                  maxLines: 1,
                                                ).animate().fadeIn(
                                                    delay: .8.seconds,
                                                    duration: .7.seconds),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  height: 395 * theme.heightRatio,
                                  width: 247.5 * theme.widthRatio,
                                ),
                              ),
                            ),
                            Transform(
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.009999)
                                ..rotateY(-0.07),
                              alignment: Alignment.topCenter,
                              child: FrostedContainer(
                                onPressed: () {
                                  currentState.launchInBrowser(hashnode);
                                },
                                childG: Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/icons/hashnode.png",
                                          width: 50 *
                                              theme.widthRatio *
                                              theme.heightRatio,
                                          height: 50 *
                                              theme.widthRatio *
                                              theme.heightRatio,
                                        ),
                                        SizedBox(
                                          height: 10 * theme.heightRatio,
                                        ),
                                        Flexible(
                                            child: AutoSizeText(
                                          "Let's connect !",
                                          style: GoogleFonts.exo(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 28 *
                                                theme.widthRatio *
                                                theme.heightRatio,
                                          ),
                                          textAlign: TextAlign.center,
                                          maxFontSize: 28,
                                          minFontSize: 15,
                                        )),
                                      ],
                                    ).animate().fadeIn(
                                        delay: 1.seconds, duration: .7.seconds),
                                  ),
                                ),
                                height: 175.5 * theme.heightRatio,
                                width: 245 * theme.widthRatio,
                              ),
                            ),
                          ],
                        ),

                  // main mobile screen
                  SizedBox(
                    height: size.height - 100,
                    child: Consumer<CurrentStateProvider>(
                      // selector: (context, provider) => provider.currentDevice,
                      builder: (context, _, __) {
                        return DeviceFrame(
                          device: currentState.currentDevice,
                          screen: Container(
                              decoration: BoxDecoration(
                                  gradient: currentState.bgGradient),
                              child: ScreenWrapper(
                                  childG: currentState.currentScreen)),
                        );
                      },
                    ),
                  ),

                  /// Right side frosted containers
                  phone
                      ? Container()
                      : Column(
                          children: [
                            Transform(
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.01)
                                ..rotateY(0.06),
                              alignment: Alignment.bottomCenter,
                              child: FrostedContainer(
                                height: 395 * theme.heightRatio,
                                width: 247.5 * theme.widthRatio,
                                childG: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Wrap(
                                      children: [
                                        ...List.generate(
                                          colorPalette.length,
                                          (index) =>
                                              Consumer<CurrentStateProvider>(
                                                  builder: (context, _, __) {
                                            return CustomButton(
                                              margin: const EdgeInsets.all(10),
                                              pressed:
                                                  currentState.selectedColor ==
                                                          index
                                                      ? Pressed.pressed
                                                      : Pressed.notPressed,
                                              animate: true,
                                              borderRadius: 100,
                                              shadowColor: Colors.blueGrey[50],
                                              isThreeD: true,
                                              backgroundColor:
                                                  colorPalette[index].color,
                                              width: 50 * theme.widthRatio,
                                              height: 50 * theme.widthRatio,
                                              onPressed: () {
                                                currentState
                                                    .changeGradient(index);
                                              },
                                            );
                                          }),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Transform(
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.00999)
                                ..rotateY(0.06),
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin:
                                    const EdgeInsets.only(top: 0, bottom: 10),
                                child: FrostedContainer(
                                  childG: Center(
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      padding:
                                          EdgeInsets.all(10 * theme.widthRatio),
                                      child: Center(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AutoSizeText(
                                            '"Don\'t run after success run after perfection success will follow."',
                                            style: GoogleFonts.inter(
                                                // fontSize: 30,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                            maxFontSize: 25,
                                            minFontSize: 10,
                                            maxLines: 3,
                                          ),
                                          Align(
                                              alignment: Alignment.bottomRight,
                                              child: AutoSizeText(
                                                '-Baba Ranchhoddas',
                                                style: GoogleFonts.inter(
                                                    // fontSize: 12,
                                                    color: Colors.white
                                                        .withOpacity(0.6),
                                                    fontWeight:
                                                        FontWeight.w400),
                                                maxFontSize: 12,
                                                minFontSize: 6,
                                                maxLines: 1,
                                              )),
                                        ],
                                      )),
                                    ),
                                  ).animate().fadeIn(
                                      delay: 1.seconds, duration: .7.seconds),
                                  height: 175.5 * theme.heightRatio,
                                  width: 245 * theme.widthRatio,
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
              SizedBox(
                height: 10 * theme.heightRatio,
              ),

              /// bottom button for device selection
              Selector<CurrentStateProvider, DeviceInfo>(
                  selector: (context, p1) => p1.currentDevice,
                  builder: (context, _, __) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...List.generate(devices.length, (index) {
                          return CustomButton(
                            pressed: currentState.currentDevice ==
                                    devices[index].device
                                ? Pressed.pressed
                                : Pressed.notPressed,
                            animate: true,
                            borderRadius: 100,
                            isThreeD: true,
                            backgroundColor: Colors.black,
                            width: 37.5,
                            height: 37.5,
                            onPressed: () {
                              currentState.changeSelectedDevice(
                                devices[index].device,
                              );
                            },
                            child: Center(
                              child: Icon(
                                devices[index].data,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          );
                        })
                      ],
                    );
                  })
            ],
          ),
        ],
      ),
    );
  }
}
