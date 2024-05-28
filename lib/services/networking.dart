import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '0fdce3e266e20eaabbfbcb73e0107e4f';

class NetworkHelper {
  NetworkHelper({required this.url});

  late String url;

  Future<dynamic> getData() async {
    http.Response response;
    response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return null;
    }
  }
}
