import 'package:flutter/material.dart';

class TripAgenda extends StatelessWidget {
  final List<String> agenda;

  TripAgenda({required this.agenda});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: agenda.map((event) {
        return ListTile(
          leading: Icon(Icons.access_time, color: Colors.blueAccent),
          title: Text(event, style: TextStyle(fontSize: 14, color: Colors.grey[800])),
        );
      }).toList(),
    );
  }
}
