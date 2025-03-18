import 'package:get/get.dart';
import 'package:wizhtourism/modules/views/trip_detail/trip_detail_binding.dart';
import 'package:wizhtourism/modules/views/trip_detail/trip_detail_page.dart';
import 'package:wizhtourism/modules/views/trip_list/trip_list_binding.dart';
import 'package:wizhtourism/modules/views/trip_list/trip_list_page.dart';
class AppRoutes {
  static const String home = '/';
  static const String tripDetail = '/tripDetail';

  static final pages = [
    GetPage(name: home, page: () => TripListPage(), binding: TripListBinding()),
    GetPage(name: tripDetail, page: () => TripDetailPage(), binding: TripDetailBinding()),
  ];
}