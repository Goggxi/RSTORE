import 'package:get/get.dart';
import 'package:rstore/model/electronic_model.dart';
import 'package:rstore/model/product_model.dart';
import 'package:rstore/utils/json.dart';

class MainController extends GetxController {
  RxList<Product> product = RxList<Product>([]);
  RxList<Electronic> electronic = RxList<Electronic>([]);

  @override
  void onInit() {
    listProduct();
    listElectronic();
    super.onInit();
  }

  void listProduct() async {
    List<dynamic> data = await loadJson(
      "assets/data/product.json",
    );
    product.value = data
        .map<Product>(
          (product) => Product(
              idProduct: product["id_product"],
              nameProduct: product["name_product"],
              priceProduct: product["price_product"],
              imageProduct: product["image_product"],
              rateProduct: product["rate_product"],
              descriptionProduct: product["description_product"]),
        )
        .toList();
  }

  void listElectronic() async {
    List<dynamic> data = await loadJson(
      "assets/data/electronic.json",
    );
    electronic.value = data
        .map<Electronic>(
          (product) => Electronic(
              idProduct: product["id_product"],
              nameProduct: product["name_product"],
              priceProduct: product["price_product"],
              imageProduct: product["image_product"],
              rateProduct: product["rate_product"],
              descriptionProduct: product["description_product"]),
        )
        .toList();
  }
}
