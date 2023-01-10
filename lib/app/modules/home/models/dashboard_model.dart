class DashboardModel {
  int? jumlahAnggotaPresensi;
  int? jumlahAnggota;

  DashboardModel({this.jumlahAnggotaPresensi, this.jumlahAnggota});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    jumlahAnggotaPresensi = json['jumlah_anggota_presensi'];
    jumlahAnggota = json['jumlah_anggota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jumlah_anggota_presensi'] = this.jumlahAnggotaPresensi;
    data['jumlah_anggota'] = this.jumlahAnggota;
    return data;
  }
}
