import 'package:flutter/material.dart';

class TripReviews extends StatelessWidget {
  final List<Map<String, dynamic>> reviews;

  TripReviews({required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: reviews.map((review) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(review["avatar"] ?? "https://example.com/default-avatar.png"),
          ),
          title: Text(review["name"], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: List.generate(review["rating"], (index) => Icon(Icons.star, color: Colors.amber, size: 16)),
              ),
              SizedBox(height: 5),
              Text(review["comment"], style: TextStyle(color: Colors.grey[700])),
            ],
          ),
        );
      }).toList(),
    );
  }
}
