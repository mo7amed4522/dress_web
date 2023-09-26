class DepartmentModel {
  String? status;
  String? msg;
  List<DataDepartmentModel>? data;

  DepartmentModel({this.status, this.msg, this.data});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <DataDepartmentModel>[];
      json['data'].forEach((v) {
        data!.add(DataDepartmentModel.fromJson(v));
      });
    }
  }
}

class DataDepartmentModel {
  int? depId;
  String? depName;
  String? depPhoto;

  DataDepartmentModel({this.depId, this.depName, this.depPhoto});

  DataDepartmentModel.fromJson(Map<String, dynamic> json) {
    depId = json['dep_id'];
    depName = json['dep_name'];
    depPhoto = json['dep_photo'];
  }
}
