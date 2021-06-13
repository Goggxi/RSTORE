import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rstore/model/product_model.dart';
import 'package:rstore/values/colors.dart';

class ContainerListfurniture extends StatelessWidget {
  final Product _product;
  const ContainerListfurniture(this._product);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 180,
          child: Card(
            shadowColor: Colors.black26,
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                  child: CachedNetworkImage(
                    imageUrl: '${_product.imageProduct}',
                    fit: BoxFit.contain,
                    width: 180,
                    height: 180,
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
                Container(
                    padding: EdgeInsets.all(8).copyWith(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${_product.nameProduct}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: 5),
                        Text('${_product.priceProduct}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: accent))
                      ],
                    )),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(100)),
            child: IconButton(
              icon: Icon(
                CupertinoIcons.cart_fill_badge_plus,
                color: accent,
                size: 20,
              ),
              padding: EdgeInsets.all(2),
              constraints: BoxConstraints(),
              onPressed: () {},
              splashRadius: 20,
              visualDensity: VisualDensity.compact,
            ),
          ),
        ),
      ],
    );
  }
}
