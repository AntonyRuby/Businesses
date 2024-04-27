class Business {
  final String id;
  final String name;
  final String imageUrl;
  final bool isClosed;
  final double rating;
  final List<String> categories;
  final String address;
  final String phone;
  final String url;

  Business({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isClosed,
    required this.rating,
    required this.categories,
    required this.address,
    required this.phone,
    required this.url,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
      isClosed: json['is_closed'],
      rating: json['rating'].toDouble(),
      categories: json['categories']
          .map<String>((cat) => cat['title'])
          .toList()
          .cast<String>(),
      address: json['location']['display_address'].join(', '),
      phone: json['display_phone'],
      url: json['url'],
    );
  }
}
