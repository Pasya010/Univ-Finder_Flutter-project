class University {
  final String name;
  final String alphaTwoCode;
  final List<String> webPages;
  final String country;

  University({
    required this.name,
    required this.alphaTwoCode,
    required this.webPages,
    required this.country,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    var webPagesFromJson = json['web_pages'] as List<dynamic>;
    List<String> webPagesList =
        webPagesFromJson.map((webPage) => webPage.toString()).toList();

    return University(
      name: json['name'],
      alphaTwoCode: json['alpha_two_code'],
      webPages: webPagesList,
      country: json['country'],
    );
  }
}
