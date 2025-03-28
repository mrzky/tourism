import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wizhtourism/routes/app_routes.dart';

void main() {
  runApp(WizhTourismApp());
}

class WizhTourismApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tourism App',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.pages,
    );
  }
}