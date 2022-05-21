import 'package:flutter/material.dart';
import 'package:flutter_room_finder_app/pages/home_page.dart';
import 'package:flutter_room_finder_app/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 425,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.35,
                    color: orangeColor,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 36,
                      maxHeight: MediaQuery.of(context).size.height,
                    ),
                    child: Image.asset(
                      'assets/images/splash_image.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 50,
                        child: Image.asset(
                          'assets/images/logo.png',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text("Find Cozy Places\nto Stay and Happy",
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Stop wasting time on\nplaces that aren't habitable",
                        style: darkGreyTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: 210,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(purpleColor),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  17,
                                ),
                              ),
                            ),
                          ),
                          child: Text(
                            "Explore Now",
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 165,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
