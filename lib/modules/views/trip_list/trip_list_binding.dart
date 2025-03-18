import 'package:get/get.dart';
import '../../../data/repositories/trip_repository.dart';
import 'trip_list_controller.dart';

class TripListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TripRepository());
    Get.lazyPut(() => TripListController(Get.find()));
  }
}