// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'trip_list_controller.dart';
// import 'widgets/trip_card.dart';
// import 'widgets/trip_card_shimmer.dart';
//
// class TripListPage extends StatelessWidget {
//   final TripListController controller = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Explore Trips', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),), backgroundColor: Colors.blueAccent),
//       body: Obx(() {
//         return RefreshIndicator(
//           onRefresh: () async {
//             await controller.fetchTrips(); // Refresh data
//           },
//           child: controller.isLoading.value
//               ? ListView.builder(
//             itemCount: 5,
//             itemBuilder: (_, __) => TripCardShimmer(),
//           )
//               : ListView.builder(
//             itemCount: controller.tripList.length,
//             padding: EdgeInsets.all(10),
//             itemBuilder: (context, index) {
//               return TripCard(trip: controller.tripList[index]);
//             },
//           ),
//         );
//       }),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizhtourism/modules/views/trip_list/trip_list_controller.dart';
import 'package:wizhtourism/modules/views/trip_list/widgets/trip_card.dart';
import 'package:wizhtourism/modules/views/trip_list/widgets/trip_card_shimmer.dart';

class TripListPage extends StatelessWidget {
  final TripListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Discover Trips", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // 🔍 Search Bar
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              onChanged: controller.searchTrips,
              decoration: InputDecoration(
                hintText: "Search trips...",
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),

          // 🏷️ Filter Chips & Sort Dropdown
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Wrap(
                    spacing: 10,
                    children: [
                      ChoiceChip(
                        label: Text("All"),
                        selected: controller.selectedFilter.value == "All",
                        onSelected: (val) => controller.filterTrips("All"),
                      ),
                      ChoiceChip(
                        label: Text("Open Trips"),
                        selected: controller.selectedFilter.value == "Open",
                        onSelected: (val) => controller.filterTrips("Open"),
                      ),
                      ChoiceChip(
                        label: Text("Private Trips"),
                        selected: controller.selectedFilter.value == "Private",
                        onSelected: (val) => controller.filterTrips("Private"),
                      ),
                    ],
                  )),
                  SizedBox(width: 20,),
                  Obx(() => DropdownButton<String>(
                    value: controller.selectedSort.value,
                    items: [
                      DropdownMenuItem(value: "None", child: Text("Sort By")),
                      DropdownMenuItem(value: "Price", child: Text("Price")),
                      DropdownMenuItem(value: "Rating", child: Text("Rating")),
                      DropdownMenuItem(value: "Likes", child: Text("Likes")),
                    ],
                    onChanged: controller.sortTrips,
                  )),
                ],
              ),
            ),
          ),

          // 📜 List of Trips with Refresh Indicator
          Expanded(
            child: Obx(() => RefreshIndicator(
              onRefresh: controller.fetchTrips,
              child: controller.isLoading.value
                  ? ListView.builder(
                itemCount: 5,
                itemBuilder: (_, __) => TripCardShimmer(),
              )
                  : ListView.builder(
                itemCount: controller.filteredTrips.length,
                padding: EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  return TripCard(trip: controller.filteredTrips[index]);
                },
              ),
            )),
            //   child: ListView.builder(
            //     padding: EdgeInsets.all(10),
            //     itemCount: controller.filteredTrips.length,
            //     itemBuilder: (context, index) {
            //       return TripCard(trip: controller.filteredTrips[index]);
            //     },
            //   ),
            // )),
          ),
        ],
      ),
    );
  }
}
