class AllProductModle {
  String? status;
  String? msg;
  List<DataAllProductModle>? data;

  AllProductModle({this.status, this.msg, this.data});

  AllProductModle.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <DataAllProductModle>[];
      json['data'].forEach((v) {
        data!.add(DataAllProductModle.fromJson(v));
      });
    }
  }
}

class DataAllProductModle {
  int? prodId;
  String? name;
  String? image;
  int? amount;

  DataAllProductModle({this.prodId, this.name, this.image, required this.amount});

  DataAllProductModle.fromJson(Map<String, dynamic> json) {
    prodId = json['prod_id'];
    name = json['name'];
    image = json['image'];
    amount = json['amount'];
  }
}
