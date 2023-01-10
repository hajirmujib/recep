class ProfileModel {
  String? id;
  String? email;
  String? nik;
  String? jabatan;
  String? oauthUid;
  String? oauthProvider;
  String? pass;
  String? username;
  String? fullName;
  String? kodeReferal;
  String? token;
  String? avatar;
  String? banned;
  String? lastLogin;
  String? lastActivity;
  String? dateCreated;
  String? forgotExp;
  String? rememberTime;
  String? rememberExp;
  String? verificationCode;
  String? topSecret;
  String? ipAddress;
  String? npwp;
  String? jk;
  String? pendidikan;
  String? agama;
  String? kontrakKerja;
  String? akunBank;

  ProfileModel(
      {this.id,
      this.email,
      this.nik,
      this.jabatan,
      this.oauthUid,
      this.oauthProvider,
      this.pass,
      this.username,
      this.fullName,
      this.kodeReferal,
      this.token,
      this.avatar,
      this.banned,
      this.lastLogin,
      this.lastActivity,
      this.dateCreated,
      this.forgotExp,
      this.rememberTime,
      this.rememberExp,
      this.verificationCode,
      this.topSecret,
      this.ipAddress,
      this.npwp,
      this.jk,
      this.pendidikan,
      this.agama,
      this.kontrakKerja,
      this.akunBank});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    nik = json['nik'];
    jabatan = json['jabatan'];
    oauthUid = json['oauth_uid'];
    oauthProvider = json['oauth_provider'];
    pass = json['pass'];
    username = json['username'];
    fullName = json['full_name'];
    kodeReferal = json['kode_referal'];
    token = json['token'];
    avatar = json['avatar'];
    banned = json['banned'];
    lastLogin = json['last_login'];
    lastActivity = json['last_activity'];
    dateCreated = json['date_created'];
    forgotExp = json['forgot_exp'];
    rememberTime = json['remember_time'];
    rememberExp = json['remember_exp'];
    verificationCode = json['verification_code'];
    topSecret = json['top_secret'];
    ipAddress = json['ip_address'];
    npwp = json['npwp'];
    jk = json['jk'];
    pendidikan = json['pendidikan'];
    agama = json['agama'];
    kontrakKerja = json['kontrak_kerja'];
    akunBank = json['akun_bank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['nik'] = this.nik;
    data['jabatan'] = this.jabatan;
    data['oauth_uid'] = this.oauthUid;
    data['oauth_provider'] = this.oauthProvider;
    data['pass'] = this.pass;
    data['username'] = this.username;
    data['full_name'] = this.fullName;
    data['kode_referal'] = this.kodeReferal;
    data['token'] = this.token;
    data['avatar'] = this.avatar;
    data['banned'] = this.banned;
    data['last_login'] = this.lastLogin;
    data['last_activity'] = this.lastActivity;
    data['date_created'] = this.dateCreated;
    data['forgot_exp'] = this.forgotExp;
    data['remember_time'] = this.rememberTime;
    data['remember_exp'] = this.rememberExp;
    data['verification_code'] = this.verificationCode;
    data['top_secret'] = this.topSecret;
    data['ip_address'] = this.ipAddress;
    data['npwp'] = this.npwp;
    data['jk'] = this.jk;
    data['pendidikan'] = this.pendidikan;
    data['agama'] = this.agama;
    data['kontrak_kerja'] = this.kontrakKerja;
    data['akun_bank'] = this.akunBank;
    return data;
  }
}

