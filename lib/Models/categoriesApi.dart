import 'dart:convert';

import 'package:http/http.dart' as http;

class Categories {
  final String name;

  const Categories({
    required this.name,
  });

  static Categories fromJson(Map<String, dynamic> json) => Categories(
        name: json['name'],
      );
}

class CategoriesApi {
  static Future<List<Categories>> getUserSuggestions(String query) async {
    final url = Uri.parse('https://bingo-agency.com/mrworker/API/tags.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List categories = json.decode(response.body);

      return categories
          .map((json) => Categories.fromJson(json))
          .where((categories) {
        final nameLower = categories.name.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
