import 'dart:convert';
import 'package:http/http.dart' show Client, Response;

class Network {
  Client client = Client();
  late Response response;
  final baseUrl = "https://jsonplaceholder.typicode.com/";

  getHeaders() {
    Map<String, String> headers = {
      'origin': baseUrl,
      'Accept': 'application/json',
      'Content-type': 'application/json',
    };
    return headers;
  }

  fetch(uri) async {
    var fetchUri = Uri.parse("$baseUrl$uri");
    response = await client.get(fetchUri, headers: getHeaders());
    if (response.statusCode != 200) {
      throw jsonDecode(response.body);
    }
    return jsonDecode(response.body);
  }
}
