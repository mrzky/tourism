import 'package:dio/dio.dart';
import '../../config/api_urls.dart';
import '../models/trip_model.dart';

class TripApiProvider {
  final Dio _dio = Dio();

  Future<List<Trip>> fetchTrips() async {
    try {
      Response response = await _dio.get(ApiUrls.getTrips);
      final list = (response.data as List).map((json) => Trip.fromJson(json)).toList();
      print("response trip $list");
      return list;
    } catch (e) {
      print("response error $e");
      return [];
    }
  }
}
