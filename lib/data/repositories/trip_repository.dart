import '../models/trip_model.dart';
import '../providers/trip_api_provider.dart';

class TripRepository {
  final TripApiProvider apiProvider = TripApiProvider();

  Future<List<Trip>> getTrips() => apiProvider.fetchTrips();
}