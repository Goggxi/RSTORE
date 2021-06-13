import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rstore/app/main/detail_electronic_view.dart';
import 'package:rstore/app/main/detail_furniture_view.dart';
import 'package:rstore/app/main/main_controller.dart';
import 'package:rstore/app/widgets/container_list_electronic.dart';
import 'package:rstore/app/widgets/container_list_furniture.dart';
import 'package:rstore/model/electronic_model.dart';
import 'package:rstore/model/product_model.dart';
import 'package:rstore/values/colors.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('RSTORE',
              style: GoogleFonts.fjallaOne(
                color: primary,
                fontSize: 25,
              )),
          elevation: 1,
          backgroundColor: Colors.white,
          actions: [
            Container(
              padding: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.bell,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                    visualDensity: VisualDensity.compact,
                  ),
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.cart,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
            ),
          ]),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.all(16).copyWith(bottom: 10),
                  sliver: SliverToBoxAdapter(
                      child: Text('Top Furniture',
                          style: GoogleFonts.fjallaOne(fontSize: 18))),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    width: Get.mediaQuery.size.width,
                    height: 260,
                    child: Obx(
                      () => ListView.separated(
                          padding: EdgeInsets.only(left: 12, right: 12),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 2),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.product.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Product furniture = controller.product[index];
                            return InkWell(
                              onTap: () {
                                Get.to(
                                    () => DetailFurniture(product: furniture));
                              },
                              child: ContainerListfurniture(furniture),
                            );
                          }),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(16).copyWith(bottom: 10),
                  sliver: SliverToBoxAdapter(
                      child: Text('Electronic',
                          style: GoogleFonts.fjallaOne(fontSize: 18))),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(16).copyWith(top: 0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final Electronic electronic =
                            controller.electronic[index];
                        return InkWell(
                          onTap: () {
                            Get.to(() => DetailElectronic(product: electronic));
                          },
                          child: ContainerListElectronic(electronic),
                        );
                      },
                      childCount: controller.electronic.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
