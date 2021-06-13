import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rstore/app/auth/login_view.dart';
import 'package:rstore/app/widgets/image_sliders.dart';
import 'package:rstore/values/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSliderView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageSliderView();
  }
}

class _ImageSliderView extends State<ImageSliderView> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/images/splash.png', fit: BoxFit.fill),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.map((url) {
                  int index = imgList.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Color(0xffffffff)
                          : Color.fromRGBO(0, 0, 0, 0.6),
                    ),
                  );
                }).toList(),
              ),
            ]),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 80.0, left: 40.0, right: 40.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: white,
                onPrimary: primary,
                shape: StadiumBorder(),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => LoginView()));
              },
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  width: MediaQuery.of(context).size.width,
                  child: Text('Get Started',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.fjallaOne(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1))),
            ),
          )
        ],
      ),
    );
  }
}

// class ImageSliderView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             child: Image.asset('assets/images/splash.png', fit: BoxFit.fill),
//           ),
//           Center(
//             child: CarouselSlider(
//               options: CarouselOptions(
//                 height: 300.0,
//                 aspectRatio: 16 / 9,
//                 viewportFraction: 0.8,
//                 initialPage: 0,
//                 enableInfiniteScroll: true,
//                 reverse: false,
//                 autoPlay: true,
//                 autoPlayInterval: Duration(seconds: 3),
//                 autoPlayAnimationDuration: Duration(milliseconds: 1000),
//                 autoPlayCurve: Curves.fastOutSlowIn,
//                 enlargeCenterPage: true,
//                 scrollDirection: Axis.horizontal,
//               ),
//               items: [
//                 'assets/images/logo.png',
//                 'assets/images/logo.png',
//                 'assets/images/logo.png'
//               ].map((i) {
//                 return Builder(
//                   builder: (BuildContext context) {
//                     return Container(
//                         width: MediaQuery.of(context).size.width,
//                         margin: EdgeInsets.symmetric(horizontal: 5.0),
//                         child: Center(
//                           child: Image.asset(i),
//                         ));
//                   },
//                 );
//               }).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
