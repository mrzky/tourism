import 'package:get/get.dart';

import '../../../data/models/trip_model.dart';

class TripDetailController extends GetxController {
  late Trip trip;

  @override
  void onInit() {
    trip = Get.arguments;
    super.onInit();
  }
}
