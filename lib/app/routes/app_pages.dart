import 'package:get/get.dart';

import '../modules/absensi/bindings/absensi_binding.dart';
import '../modules/absensi/views/absensi_view.dart';
import '../modules/admin_absensi/bindings/admin_absensi_binding.dart';
import '../modules/admin_absensi/views/admin_absensi_view.dart';
import '../modules/admin_add_member/bindings/admin_add_member_binding.dart';
import '../modules/admin_add_member/views/admin_add_member_view.dart';
import '../modules/admin_member/bindings/admin_member_binding.dart';
import '../modules/admin_member/views/admin_member_view.dart';
import '../modules/admin_request_member/bindings/admin_request_member_binding.dart';
import '../modules/admin_request_member/views/admin_request_member_view.dart';
import '../modules/admin_setting/bindings/admin_setting_binding.dart';
import '../modules/admin_setting/views/admin_setting_view.dart';
import '../modules/bottom_bar/bindings/bottom_bar_binding.dart';
import '../modules/bottom_bar/views/bottom_bar_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/forgot_pass/bindings/forgot_pass_binding.dart';
import '../modules/forgot_pass/views/forgot_pass_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pass_verif/bindings/pass_verif_binding.dart';
import '../modules/pass_verif/views/pass_verif_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/register_company/bindings/register_company_binding.dart';
import '../modules/register_company/views/register_company_view.dart';
import '../modules/reset_pass/bindings/reset_pass_binding.dart';
import '../modules/reset_pass/views/reset_pass_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/upload/bindings/upload_binding.dart';
import '../modules/upload/views/upload_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      transition: Transition.fadeIn,
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: _Paths.FORGOT_PASS,
      page: () => ForgotPassView(),
      binding: ForgotPassBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: _Paths.PASS_VERIF,
      page: () => PassVerifView(),
      binding: PassVerifBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: _Paths.RESET_PASS,
      page: () => ResetPassView(),
      binding: ResetPassBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD,
      page: () => UploadView(),
      binding: UploadBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(name: _Paths.BOTTOM_BAR, page: () => BottomBarView(),
        // binding: BottomBarBinding(),
        bindings: [
          BottomBarBinding(),
          HomeBinding(),
          ProfileBinding(),
          AdminAbsensiBinding(),
          AdminMemberBinding(),
          AdminSettingBinding(),
          AbsensiBinding(),
        ]),
    GetPage(
      name: _Paths.ABSENSI,
      page: () => AbsensiView(),
      binding: AbsensiBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_COMPANY,
      page: () => RegisterCompanyView(),
      binding: RegisterCompanyBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_ABSENSI,
      page: () => AdminAbsensiView(),
      binding: AdminAbsensiBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_MEMBER,
      page: () => AdminMemberView(),
      binding: AdminMemberBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_SETTING,
      page: () => AdminSettingView(),
      binding: AdminSettingBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_ADD_MEMBER,
      page: () => AdminAddMemberView(),
      binding: AdminAddMemberBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_REQUEST_MEMBER,
      page: () => AdminRequestMemberView(),
      binding: AdminRequestMemberBinding(),
    ),
  ];
}
