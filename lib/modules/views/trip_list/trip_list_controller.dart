import 'package:get/get.dart';

import '../../../data/models/trip_model.dart';
import '../../../data/repositories/trip_repository.dart';

class TripListController extends GetxController {
  final TripRepository repository;
  var isLoading = true.obs;
  var tripList = <Trip>[].obs;
  var filteredTrips = <Trip>[].obs;
  var selectedFilter = "All".obs;
  var selectedSort = "None".obs;

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
      filteredTrips.assignAll(trips);
    } finally {
      isLoading(false);
    }
  }

  void searchTrips(String query) {
    if (query.isEmpty) {
      filteredTrips.assignAll(tripList);
    } else {
      filteredTrips.assignAll(tripList.where((t) => t.title!.toLowerCase().contains(query.toLowerCase())).toList());
    }
  }

  void filterTrips(String filter) {
    selectedFilter.value = filter;
    if (filter == "All") {
      filteredTrips.assignAll(tripList);
    } else {
      filteredTrips.assignAll(tripList.where((t) => t.title!.toLowerCase().contains(filter.toLowerCase())).toList());
    }
  }

  void sortTrips(String? sortBy) {
    selectedSort.value = sortBy ?? "";
    switch (sortBy) {
      case "Price":
        filteredTrips.sort((a, b) => (a.price ?? 0).compareTo(b.price ?? 0));
        break;
      case "Rating":
        filteredTrips.sort((a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0));
        break;
      case "Likes":
        filteredTrips.sort((a, b) => (b.likeCount ?? 0).compareTo(a.likeCount ?? 0));
        break;
      default:
        filteredTrips.assignAll(tripList);
        break;
    }
  }

}