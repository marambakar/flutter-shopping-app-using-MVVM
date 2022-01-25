import 'dart:convert';

import 'package:alayniah/models/product.dart';
import 'package:alayniah/models/products.dart';
import 'package:http/http.dart';
import 'network_client.dart';
import 'package:alayniah/util/request_type.dart';

class AppRequests{
  static network_client client = network_client(Client());

  static Future<List<Product>> fetchSearchProducts(String text) async {
    final response = await client.request(requestType: RequestType.GET, path: "api/client/products?q=$text");

    if (response.statusCode == 200) {
      // If the server returns an OK response, then parse the JSON.
      return Products.fromJson(json.decode(response.body)['data']['data']).products;
    } else {
      // If the response was umexpected, throw an error.
      throw Exception('Failed to load post');
    }
  }
}