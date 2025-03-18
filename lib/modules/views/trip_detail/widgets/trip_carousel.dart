import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TripCarousel extends StatelessWidget {
  final List<String> photos;

  TripCarousel({required this.photos});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 250, enlargeCenterPage: true, autoPlay: true),
      items: photos.map((photo) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(photo, width: double.infinity, fit: BoxFit.cover),
        );
      }).toList(),
    );
  }
}
