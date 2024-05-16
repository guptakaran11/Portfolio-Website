//* Packages
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

//* Utility
import 'package:portfolio/View/Utilities/data_list.dart';

//* Providers
import '../../../Controller/Provider/current_state_provider.dart';

class PhoneHomeScreen extends StatelessWidget {
  const PhoneHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CurrentStateProvider currentState =
        Provider.of<CurrentStateProvider>(context, listen: false);
    return Container(
      padding: const EdgeInsets.only(
        top: 70,
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.start,
            children: [
              ...List.generate(
                apps.length,
                (index) => Container(
                  margin: const EdgeInsets.only(
                    right: 10,
                    left: 10,
                    top: 10,
                    bottom: 20,
                  ),
                  child: Column(
                    children: [
                      CustomButton(
                        margin: const EdgeInsets.only(
                          bottom: 5,
                        ),
                        borderRadius:
                            currentState.currentDevice == Devices.ios.iPhone13
                                ? 8
                                : 100,
                        onPressed: () {
                          if (apps[index].link != null) {
                            // Launch the function
                            currentState.launchInBrowser(
                              apps[index].link!,
                            );
                          } else if (apps[index].screen != null) {
                            currentState.changePhoneScreen(
                              apps[index].screen!,
                              false,
                              titleL: apps[index].title,
                            );
                          }
                        },
                        height: 45,
                        width: 45,
                        asset: apps[index].assetPath != null
                            ? ButtonAsset(
                                apps[index].assetPath!,
                                width: 25,
                                height: 25,
                              )
                            : null,
                        backgroundColor: apps[index].color,
                        child: apps[index].assetPath == null
                            ? Center(
                                child: Icon(
                                  apps[index].icon,
                                  size: 25,
                                  color: Colors.black,
                                ),
                              )
                            : null,
                      ),
                      SizedBox(
                        width: 60,
                        child: Center(
                          child: Text(
                            apps[index].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.openSans(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}