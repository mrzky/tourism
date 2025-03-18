import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'trip_list_controller.dart';
import 'widgets/trip_card.dart';
import 'widgets/trip_card_shimmer.dart';

class TripListPage extends StatelessWidget {
  final TripListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Explore Trips')),
      body: Obx(() {
        return RefreshIndicator(
          onRefresh: () async {
            await controller.fetchTrips(); // Refresh data
          },
          child: controller.isLoading.value
              ? ListView.builder(
            itemCount: 5,
            itemBuilder: (_, __) => TripCardShimmer(),
          )
              : ListView.builder(
            itemCount: controller.tripList.length,
            padding: EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return TripCard(trip: controller.tripList[index]);
            },
          ),
        );
      }),
    );
  }
}