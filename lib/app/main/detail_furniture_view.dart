import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rstore/app/main/success_buy_view.dart';
import 'package:rstore/model/product_model.dart';
import 'package:rstore/values/colors.dart';

class DetailFurniture extends GetView {
  final Product product;

  DetailFurniture({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                padding: EdgeInsets.all(16).copyWith(top: 32),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                child: CachedNetworkImage(
                  imageUrl: '${product.imageProduct}',
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  progressIndicatorBuilder: (context, url, progress) =>
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/load.gif"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 32,
                left: 16,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                    icon: Icon(
                      CupertinoIcons.back,
                      color: accent,
                      size: 20,
                    ),
                    padding: EdgeInsets.all(2),
                    constraints: BoxConstraints(),
                    onPressed: () => Get.back(),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ),
            ]),
            Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${product.nameProduct}',
                        style: GoogleFonts.fjallaOne(
                            fontSize: 18,
                            fontWeight: FontWeight.w100,
                            letterSpacing: 0.1)),
                    SizedBox(height: 5),
                    Divider(),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.star_lefthalf_fill,
                              color: accent,
                              size: 22,
                            ),
                            SizedBox(width: 5),
                            Text('${product.rateProduct}',
                                style: GoogleFonts.notoSans(
                                    fontWeight: FontWeight.w500, fontSize: 18)),
                          ],
                        ),
                        Text('${product.priceProduct}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: accent)),
                      ],
                    ),
                    SizedBox(height: 5),
                    Divider(),
                    SizedBox(height: 5),
                    Text('Description',
                        style: GoogleFonts.fjallaOne(fontSize: 16)),
                    SizedBox(height: 10),
                    Text('${product.descriptionProduct}',
                        style:
                            GoogleFonts.notoSans(fontWeight: FontWeight.w500)),
                    SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () => Get.to(() => SuccessBuy()),
                        style: ElevatedButton.styleFrom(
                          primary: primary,
                          onPrimary: white,
                          shape: StadiumBorder(),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: Text('Buy Now',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.fjallaOne(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1)),
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
