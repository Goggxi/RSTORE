class Electronic {
  String? idProduct;
  String? nameProduct;
  String? imageProduct;
  String? priceProduct;
  String? descriptionProduct;
  String? rateProduct;

  Electronic(
      {this.idProduct,
      this.nameProduct,
      this.imageProduct,
      this.priceProduct,
      this.descriptionProduct,
      this.rateProduct});

  Electronic.fromJson(Map<String, dynamic> json) {
    idProduct = json['id_product'];
    nameProduct = json['name_product'];
    imageProduct = json['image_product'];
    priceProduct = json['price_product'];
    descriptionProduct = json['description_product'];
    rateProduct = json['rate_product'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_product'] = idProduct;
    data['name_product'] = nameProduct;
    data['image_product'] = imageProduct;
    data['price_product'] = priceProduct;
    data['description_product'] = descriptionProduct;
    data['rate_product'] = rateProduct;
    return data;
  }
}
