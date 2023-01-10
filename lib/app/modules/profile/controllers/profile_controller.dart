import 'package:get/get.dart';
import 'package:mysleep/app/modules/home/controllers/home_controller.dart';
import 'package:mysleep/app/modules/profile/adapter/profile_adapter.dart';
import 'package:mysleep/app/routes/app_pages.dart';
import 'package:mysleep/app/widgets/show_tost.dart';

class ProfileController extends GetxController {
  final IProfileRepository iProfileRepository;
  ProfileController({required this.iProfileRepository});

  final homeController = Get.find<HomeController>();
  logout() async {
    final isSuccess = await iProfileRepository.logOut();
    if (isSuccess) {
      homeController.user.close();
      Get.offAndToNamed(Routes.LOGIN);
    } else {
      showToasts(text: 'Gagal Login');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
