class Trip {
  final String id;
  final String? title;
  final String? imageUrl;
  final String? location;
  final double? price;
  final double? rating;
  final String? duration;
  final String? summary;
  final String? includes;
  final String? excludes;
  final String? terms;

  Trip({
    required this.id,
    this.title,
    this.imageUrl,
    this.location,
    this.price,
    this.rating,
    this.duration,
    this.summary,
    this.includes,
    this.excludes,
    this.terms,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'] ?? '',
      title: json['title'],
      imageUrl: json['imageUrl'],
      location: json['location'],
      price: (json['price'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      duration: json['duration'],
      summary: json['summary'],
      includes: json['includes'],
      excludes: json['excludes'],
      terms: json['terms'],
    );
  }
}
