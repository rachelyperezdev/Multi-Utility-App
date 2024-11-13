class University {
  final String name;
  final String domain;
  final String webPage;

  University({required this.name, required this.domain, required this.webPage});

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
        name: json['name'] as String,
        domain: json['domains'].isNotEmpty ? json['domains'][0] as String : '',
        webPage:
            json['domains'].isNotEmpty ? json['domains'][0] as String : '');
  }
}
