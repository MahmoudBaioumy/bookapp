class LogoutUserModel {
  List<Null>? data;
  String? message;
  List<Null>? error;
  int? status;

  LogoutUserModel({this.data, this.message, this.error, this.status});

  LogoutUserModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Null>[];
      json['data'].forEach((v) {
        data!.add((v));
      });
    }
    message = json['message'];
    if (json['error'] != null) {
      error = <Null>[];
      json['error'].forEach((v) {
        error!.add((v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v).toList();
    }
    data['message'] = this.message;
    if (this.error != null) {
      data['error'] = this.error!.map((v) => v).toList();
    }
    data['status'] = this.status;
    return data;
  }
}