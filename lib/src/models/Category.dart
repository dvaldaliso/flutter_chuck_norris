class Category {
  final String image;
  final String tipo;
  String? icon;
  String? color;

  Category({
    required this.image,
    required this.tipo,
    this.icon,
    this.color,
  });

  factory Category.fromJson(String parsedJson) {
    return Category(
      image: parsedJson,
      tipo: parsedJson,
    );
  }
}
