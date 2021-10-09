class Chuck {
  final String iconUrl;
  final String id;
  final String url;
  final String value;
  final List categories;
  final String createdAt;
  final String updatedAt;
  final String errorMessage;

  Chuck({
    required this.iconUrl,
    required this.id,
    required this.url,
    required this.value,
    required this.categories,
    required this.createdAt,
    required this.updatedAt,
    required this.errorMessage,
  });

  factory Chuck.fromJson(Map<String, dynamic> parsedJson) {
    return Chuck(
      iconUrl: parsedJson['icon_url'],
      id: parsedJson['id'],
      url: parsedJson['url'],
      value: parsedJson['value'],
      categories: parsedJson['categories'],
      createdAt: parsedJson['created_at'],
      updatedAt: parsedJson['updated_at'],
      errorMessage: 'No error',
    );
  }
  factory Chuck.withError(String errorMessage) {
    return Chuck(
      iconUrl: 'icon_url',
      id: 'id',
      url: 'url',
      value: 'value',
      categories: [],
      createdAt: 'created_at',
      updatedAt: 'updated_at',
      errorMessage: errorMessage,
    );
  }
}
