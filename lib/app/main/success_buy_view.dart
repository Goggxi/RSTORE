import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rstore/app/main/main_view.dart';
import 'package:rstore/values/colors.dart';

class SuccessBuy extends StatelessWidget {
  const SuccessBuy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/images/rstore_success.json',
              height: 200, width: 200),
          Text('Your Order \nHas Been Accepted',
              textAlign: TextAlign.center,
              style: GoogleFonts.fjallaOne(
                  fontSize: 28,
                  fontWeight: FontWeight.w100,
                  letterSpacing: 0.1)),
          ElevatedButton(
              onPressed: () => Get.offAll(() => MainView()),
              style: ElevatedButton.styleFrom(
                primary: primary,
                onPrimary: white,
                shape: StadiumBorder(),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text('Back Home',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.fjallaOne(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1)),
              )),
        ],
      ),
    ));
  }
}
