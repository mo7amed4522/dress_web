class DataCoColuationModel {
  String? status;
  String? msg;
  List<DataConcolutonModel>? data;

  DataCoColuationModel({this.status, this.msg, this.data});

  DataCoColuationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <DataConcolutonModel>[];
      json['data'].forEach((v) {
        data!.add(DataConcolutonModel.fromJson(v));
      });
    }
  }
}

class DataConcolutonModel {
  int? numDep;
  int? numProd;

  DataConcolutonModel({this.numDep, this.numProd});

  DataConcolutonModel.fromJson(Map<String, dynamic> json) {
    numDep = json['numDep'];
    numProd = json['numProd'];
  }
}
