import "dart:convert";

import "package:dart_application_1/models/product_models.dart";
import "package:http/http.dart" as http;

class ApiServices {
  Future<ProductModels> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://wantapi.com/products.php"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return ProductModels.fromJson(data);
      
    } else {
      throw Exception("Failed to load products");
    }
  }
}
