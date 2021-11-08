class QueryData {
  String? name;

  QueryData({required this.name});

  factory QueryData.fromJson(Map<String, dynamic> json) {
    return QueryData(name: json['name']);
  }
}