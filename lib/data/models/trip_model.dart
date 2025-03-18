class Trip {
  final String id;
  final String? title;
  final String? imageUrl;
  final String? location;
  final double? price;
  final double? rating;
  final int? favoriteCount;
  final int? likeCount;
  final int? totalPax;
  final String? summary;
  final String? includes;
  final String? excludes;
  final String? terms;
  final List<String>? photoGallery;
  final double? latitude;
  final double? longitude;
  final List<String>? agenda;  // 🆕 Trip Agenda
  final List<Map<String, dynamic>>? reviews; // 🆕 User Reviews

  Trip({
    required this.id,
    this.title,
    this.imageUrl,
    this.location,
    this.price,
    this.rating,
    this.favoriteCount,
    this.likeCount,
    this.totalPax,
    this.summary,
    this.includes,
    this.excludes,
    this.terms,
    this.photoGallery,
    this.latitude,
    this.longitude,
    this.agenda,
    this.reviews,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      location: json['location'],
      price: (json['price'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      favoriteCount: json['favoriteCount'],
      likeCount: json['likeCount'],
      totalPax: json['totalPax'],
      summary: json['summary'],
      includes: json['includes'],
      excludes: json['excludes'],
      terms: json['terms'],
      photoGallery: (json['photoGallery'] as List?)?.map((e) => e.toString()).toList(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      agenda: (json['agenda'] as List?)?.map((e) => e.toString()).toList(),
      reviews: (json['reviews'] as List?)?.map((e) => Map<String, dynamic>.from(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'location': location,
      'price': price,
      'rating': rating,
      'favoriteCount': favoriteCount,
      'likeCount': likeCount,
      'totalPax': totalPax,
      'summary': summary,
      'includes': includes,
      'excludes': excludes,
      'terms': terms,
      'photoGallery': photoGallery,
      'latitude': latitude,
      'longitude': longitude,
      'agenda': agenda,
      'reviews': reviews,
    };
  }
}
