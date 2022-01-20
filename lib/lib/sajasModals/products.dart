import 'dart:convert';

StoreSetup storeSetupFromJson(String str) =>
    StoreSetup.fromJson(json.decode(str));

String storeSetupToJson(StoreSetup data) => json.encode(data.toJson());

class StoreSetup {
  StoreSetup({
    this.productName,
    this.prodcutCategory,
    this.productDescription,
    this.brand,
    this.alertQty,
    this.barcode,
    this.units,
    this.expDate,
    this.mdfDate,
    this.productImg,
  });

  String productName;
  String prodcutCategory;
  String productDescription;
  String brand;
  int alertQty;
  String barcode;
  String units;
  String expDate;
  String mdfDate;
  String productImg;

  factory StoreSetup.fromJson(Map<String, dynamic> json) => StoreSetup(
        productName: json["productName"],
        prodcutCategory: json["prodcutCategory"],
        productDescription: json["productDescription"],
        brand: json["brand"],
        alertQty: json["alertQty"],
        barcode: json["barcode"],
        units: json["units"],
        expDate: json["expDate"],
        mdfDate: json["mdfDate"],
        productImg: json["productImg"],
      );

  Map<String, dynamic> toJson() => {
        "productName": productName,
        "prodcutCategory": prodcutCategory,
        "productDescription": productDescription,
        "brand": brand,
        "alertQty": alertQty,
        "barcode": barcode,
        "units": units,
        "expDate": expDate,
        "mdfDate": mdfDate,
        "productImg": productImg,
      };
}
