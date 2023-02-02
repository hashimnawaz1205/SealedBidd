import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class Categories {
  final String name;

  const Categories({
    required this.name,
  });

  static Categories fromJson(Map<String, dynamic> json) => Categories(
        name: json['Name'],
      );
}

class CategoriesApi {
  static Future<List<Categories>> getUserSuggestions(String query) async {
    //   final url = Uri.parse('https://bingo-agency.com/mrworker/API/tags.php');
    //   final response = await http.get(url);

    //   if (response.statusCode == 200) {
    //     final List categories = json.decode(response.body);

    //     return categories
    //         .map((json) => Categories.fromJson(json))
    //         .where((categories) {
    //       final nameLower = categories.name.toLowerCase();
    //       final queryLower = query.toLowerCase();

    //       return nameLower.contains(queryLower);
    //     }).toList();
    //   } else {
    //     throw Exception();
    //   }
    // }

    //for category
    CollectionReference _collectionRefCat =
        FirebaseFirestore.instance.collection('Category');
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRefCat.get();

    // Get data from docs and convert map to List
    List categories = querySnapshot.docs.map((doc) => doc.data()).toList();

    return categories
        .map((json) => Categories.fromJson(json))
        .where((categories) {
      final nameLower = categories.name.toLowerCase();
      final queryLower = query.toLowerCase();

      return nameLower.contains(queryLower);
    }).toList();
  }
}
