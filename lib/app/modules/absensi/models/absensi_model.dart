class AbsensiModel {
  String? pegPresensiMasuk;
  String? pegPresensiKeluar;
  String? pegPresensiPegawaiId;

  AbsensiModel(
      {this.pegPresensiMasuk,
      this.pegPresensiKeluar,
      this.pegPresensiPegawaiId});

  AbsensiModel.fromJson(Map<String, dynamic> json) {
    pegPresensiMasuk = json['peg_presensi_masuk'];
    pegPresensiKeluar = json['peg_presensi_keluar'];
    pegPresensiPegawaiId = json['peg_presensi_pegawaiId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['peg_presensi_masuk'] = this.pegPresensiMasuk;
    data['peg_presensi_keluar'] = this.pegPresensiKeluar;
    data['peg_presensi_pegawaiId'] = this.pegPresensiPegawaiId;
    return data;
  }
}
