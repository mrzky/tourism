import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/trip_model.dart';
import 'widgets/trip_agenda.dart';
import 'widgets/trip_carousel.dart';
import 'widgets/trip_reviews.dart';

class TripDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Trip trip = Get.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
        ),
        child: ElevatedButton(
          onPressed: () {
            Get.snackbar("Booking", "You have booked ${trip.title}!", backgroundColor: Colors.greenAccent, colorText: Colors.black);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          child: Text("Book Now", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            backgroundColor: Colors.blueAccent,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: trip.id,
                child: Image.network(trip.imageUrl!, fit: BoxFit.cover),
              ),
              title: Text(trip.title ?? "Trip Details", style: TextStyle(fontWeight: FontWeight.bold)),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(trip.title ?? "Unknown", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.blueAccent),
                        SizedBox(width: 5),
                        Text(trip.location ?? "Unknown", style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 4),
                            Text(trip.rating?.toString() ?? "0.0", style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.favorite, color: Colors.redAccent),
                            SizedBox(width: 4),
                            Text(trip.favoriteCount?.toString() ?? "0", style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.thumb_up, color: Colors.green),
                            SizedBox(width: 4),
                            Text(trip.likeCount?.toString() ?? "0", style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(trip.summary ?? "No summary available.", style: TextStyle(fontSize: 16, color: Colors.grey[800])),
                    SizedBox(height: 15),

                    /// **Photo Carousel**
                    if (trip.photoGallery != null && trip.photoGallery!.isNotEmpty) ...[
                      TripCarousel(photos: trip.photoGallery!),
                      SizedBox(height: 15),
                    ],

                    /// **Price & Total Pax**
                    Text("Price: \$${trip.price ?? 0.0}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                    SizedBox(height: 5),
                    Text("Total Pax: ${trip.totalPax ?? 'N/A'}", style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                    SizedBox(height: 20),

                    /// **Agenda Timeline**
                    if (trip.agenda != null) ...[
                      Text("📅 Trip Agenda", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      TripAgenda(agenda: trip.agenda!),
                      SizedBox(height: 20),
                    ],

                    /// **Includes & Excludes**
                    if (trip.includes != null) ...[
                      Text("✅ Includes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(trip.includes!, style: TextStyle(fontSize: 16, color: Colors.grey[800])),
                      SizedBox(height: 10),
                    ],
                    if (trip.excludes != null) ...[
                      Text("❌ Excludes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(trip.excludes!, style: TextStyle(fontSize: 16, color: Colors.grey[800])),
                      SizedBox(height: 10),
                    ],

                    /// **User Reviews**
                    if (trip.reviews != null) ...[
                      Text("📝 User Reviews", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      TripReviews(reviews: trip.reviews!),
                      SizedBox(height: 20),
                    ],

                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
