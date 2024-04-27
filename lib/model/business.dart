class Business {
  final String id;
  final String alias;
  final String name;
  final String imageUrl;
  final bool isClosed;
  final String url;
  final int reviewCount;
  final List<Category> categories;
  final double rating;
  final Coordinates coordinates;
  final List<String> transactions;
  final String price;
  final Location location;
  final String phone;
  final String displayPhone;
  final double distance;

  Business({
    required this.id,
    required this.alias,
    required this.name,
    required this.imageUrl,
    required this.isClosed,
    required this.url,
    required this.reviewCount,
    required this.categories,
    required this.rating,
    required this.coordinates,
    required this.transactions,
    required this.price,
    required this.location,
    required this.phone,
    required this.displayPhone,
    required this.distance,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'],
      alias: json['alias'],
      name: json['name'],
      imageUrl: json['image_url'],
      isClosed: json['is_closed'],
      url: json['url'],
      reviewCount: json['review_count'],
      categories: (json['categories'] as List)
          .map((cat) => Category.fromJson(cat))
          .toList(),
      rating: json['rating'].toDouble(),
      coordinates: Coordinates.fromJson(json['coordinates']),
      transactions: List<String>.from(json['transactions']),
      price: json['price']?? '',
      location: Location.fromJson(json['location']),
      phone: json['phone'],
      displayPhone: json['display_phone'],
      distance: json['distance'].toDouble(),
    );
  }
}

class Category {
  final String alias;
  final String title;

  Category({
    required this.alias,
    required this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      alias: json['alias'],
      title: json['title'],
    );
  }
}

class Coordinates {
  final double latitude;
  final double longitude;

  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
    );
  }
}

class Location {
  final String address1;
  final String address2;
  final String address3;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final List<String> displayAddress;

  Location({
    required this.address1,
    required this.address2,
    required this.address3,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    required this.displayAddress,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      address1: json['address1'] ?? '',
      address2: json['address2'] ?? '',
      address3: json['address3'] ?? '',
      city: json['city'],
      state: json['state'],
      zipCode: json['zip_code'],
      country: json['country'],
      displayAddress: List<String>.from(json['display_address']),
    );
  }
}
