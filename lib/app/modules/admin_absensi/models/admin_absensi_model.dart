class AdminAbsensiModel {
  String? nama;
  String? avatar;
  String? masuk;
  String? keluar;

  AdminAbsensiModel({this.nama, this.avatar, this.masuk, this.keluar});

  AdminAbsensiModel.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    avatar = json['avatar'];
    masuk = json['masuk'];
    keluar = json['keluar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = this.nama;
    data['avatar'] = this.avatar;
    data['masuk'] = this.masuk;
    data['keluar'] = this.keluar;
    return data;
  }
}
