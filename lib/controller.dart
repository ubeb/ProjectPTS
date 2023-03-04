import 'package:get/get.dart';

class Controller extends GetxController {
  var tomato = 0.obs;
  var cabbage = 0.obs;
  addTomato() {
    return tomato.value++;
  }

  removeTomato() {
    if (tomato.value > 0) {
      return tomato.value--;
    }
  }

  addCabbage() {
    return cabbage.value++;
  }

  removeCabbage() {
    if (cabbage.value > 0) {
      return cabbage.value--;
    }
  }

  sumTotal() {
    return tomato.value + cabbage.value;
  }
}
