import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/trip_model.dart';
import '../../trip_detail/trip_detail_binding.dart';
import '../../trip_detail/trip_detail_page.dart';

class TripCard extends StatelessWidget {
  final Trip trip;

  TripCard({required this.trip});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => TripDetailPage(), binding: TripDetailBinding(), arguments: trip);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Image.network(trip.imageUrl!, height: 220, width: double.infinity, fit: BoxFit.cover),
              Container(
                height: 220,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  ),
                ),
              ),
              Positioned(
                left: 16,
                bottom: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(trip.title ?? "Title", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.white, size: 18),
                        SizedBox(width: 4),
                        Text(trip.location ?? "Location", style: TextStyle(fontSize: 14, color: Colors.white70)),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$${trip.price}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 18),
                            SizedBox(width: 4),
                            Text(trip.rating.toString(), style: TextStyle(fontSize: 16, color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
