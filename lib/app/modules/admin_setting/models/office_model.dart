class OfficeModel {
  String? unitId;
  String? unitKodeReferal;
  String? unitNama;
  String? unitAlamat;
  String? unitPembuat;
  String? unitJangkauan;
  String? unitLatitude;
  String? unitLongiitude;
  String? unitStatus;

  OfficeModel(
      {this.unitId,
      this.unitKodeReferal,
      this.unitNama,
      this.unitAlamat,
      this.unitPembuat,
      this.unitJangkauan,
      this.unitLatitude,
      this.unitLongiitude,
      this.unitStatus});

  OfficeModel.fromJson(Map<String, dynamic> json) {
    unitId = json['unit_id'];
    unitKodeReferal = json['unit_kode_referal'];
    unitNama = json['unit_nama'];
    unitAlamat = json['unit_alamat'];
    unitPembuat = json['unit_pembuat'];
    unitJangkauan = json['unit_jangkauan'];
    unitLatitude = json['unit_latitude'];
    unitLongiitude = json['unit_longitude'];
    unitStatus = json['unit_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit_id'] = this.unitId;
    data['unit_kode_referal'] = this.unitKodeReferal;
    data['unit_nama'] = this.unitNama;
    data['unit_alamat'] = this.unitAlamat;
    data['unit_pembuat'] = this.unitPembuat;
    data['unit_jangkauan'] = this.unitJangkauan;
    data['unit_latitude'] = this.unitLatitude;
    data['unit_longitude'] = this.unitLongiitude;
    data['unit_status'] = this.unitStatus;
    return data;
  }
}
