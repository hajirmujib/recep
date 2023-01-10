class MemberModel {
  String? id;
  String? fullName;
  String? avatar;
  String? nik;

  MemberModel({this.id, this.fullName, this.avatar, this.nik});

  MemberModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    avatar = json['avatar'];
    nik = json['nik'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['avatar'] = this.avatar;
    data['nik'] = this.nik;
    return data;
  }
}
