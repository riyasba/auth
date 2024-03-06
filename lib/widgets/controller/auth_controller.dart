import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthController extends GetxController {
  
  String selectedDate = "";



  
  final _isHidden = true.obs;

  bool get isHidden => _isHidden.value;

  void togglePasswordView() {
    _isHidden.value = !_isHidden.value;
  }

RxBool isLoading = false.obs;

}