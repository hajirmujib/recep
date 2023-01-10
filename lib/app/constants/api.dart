class ApiConstants {
  static const apiKey = '0024554E57343B6F0845AE89514A5A5E';

  static const baseUrl = 'https://presensi.poposerver.my.id';

  //login
  static const auth = '${baseUrl}/v1/Login';
  static const register = '${baseUrl}/v1/Register';

  // profile
  static const updateProfile = '${baseUrl}/v1/UpdateProfile';
  static const profile = '${baseUrl}/v1/profile';

  //admin
  static const baseAdmin = '${baseUrl}/v1/adminunit/';
  static const adminDashboard = '${baseAdmin}Dashboard';
  static const adminHistoryAttendance = '${baseAdmin}RiwayatAbsen';
  static const adminListMember = '${baseAdmin}DaftarAnggota';
  static const adminDataOffice = '${baseAdmin}DataKantor';
  static const adminAddMember = '${baseAdmin}TambahAnggota';
  static const adminListRequestMember = '${baseAdmin}PermintaanAnggota';
  static const adminAcceptMember = '${baseAdmin}Terima';
  static const adminRejectMember = '${baseAdmin}Tolak';
  static const adminGetDataOffice = '${baseAdmin}GetDataKantor';

  //member
  static const baseMember = '${baseUrl}/v1/anggota/';
  static const attendanceIn = '${baseMember}Masuk';
  static const attendanceOut = '${baseMember}Pulang';
  static const historyAttendance = '${baseMember}RiwayatAbsen';
  static const sendKode = '${baseMember}KirimUndangan';
}
