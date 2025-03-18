import 'package:get/get.dart';

import '../../../data/models/trip_model.dart';
import '../../../data/repositories/trip_repository.dart';

class TripListController extends GetxController {
  final TripRepository repository;
  var isLoading = true.obs;
  var tripList = <Trip>[].obs;

  TripListController(this.repository);

  @override
  void onInit() {
    fetchTrips();
    super.onInit();
  }

  Future<void> fetchTrips() async {
    try {
      isLoading(true);
      var trips = await repository.getTrips();
      print("tripss");
      print("tripss ${trips.length}");
      tripList.assignAll(trips);
    } finally {
      isLoading(false);
    }
  }
}