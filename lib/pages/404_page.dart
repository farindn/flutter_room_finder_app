import 'package:flutter/material.dart';
import 'package:flutter_room_finder_app/theme.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/error_404.png',
                width: 300,
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                "Where are you going?",
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                "Seems like the page that you were\nrequested is already gone",
                style: darkGreyTextStyle.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 210,
                height: 50,
                child: ElevatedButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  child: Text(
                    "Back to Home",
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(purpleColor),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
