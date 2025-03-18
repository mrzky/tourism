import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'trip_detail_controller.dart';

class TripDetailPage extends StatelessWidget {
  final TripDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(controller.trip.imageUrl!, height: 300, width: double.infinity, fit: BoxFit.cover),
          Container(
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(0.7), Colors.transparent],
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.65,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                ),
                padding: EdgeInsets.all(16),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Text(controller.trip.title ?? "Title", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.blue, size: 20),
                        SizedBox(width: 5),
                        Text(controller.trip.location ?? "Location", style: TextStyle(fontSize: 16, color: Colors.black54)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        SizedBox(width: 5),
                        Text(controller.trip.rating.toString(), style: TextStyle(fontSize: 16)),
                        SizedBox(width: 15),
                        Icon(Icons.schedule, color: Colors.blue, size: 20),
                        SizedBox(width: 5),
                        Text(controller.trip.duration ?? "Duration", style: TextStyle(fontSize: 16, color: Colors.black54)),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(controller.trip.summary ?? "Summary", style: TextStyle(fontSize: 16, color: Colors.black87)),
                    SizedBox(height: 10),
                    Divider(),
                    Text("Includes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(controller.trip.includes ?? "Includes", style: TextStyle(fontSize: 16, color: Colors.black54)),
                    SizedBox(height: 5),
                    Text("Excludes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(controller.trip.excludes ?? "Excludes", style: TextStyle(fontSize: 16, color: Colors.black54)),
                    SizedBox(height: 10),
                    Divider(),
                    Text("Terms & Conditions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(controller.trip.terms ?? "Terms", style: TextStyle(fontSize: 14, color: Colors.black54)),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text("Book Now", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            top: 40,
            left: 16,
            child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Get.back(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
