import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '0fdce3e266e20eaabbfbcb73e0107e4f';
var data =
    'https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}';

class NetworkHelper {
  NetworkHelper({required this.url});

  late String url;

  Future getData() async {
    http.Response response;
    response = await http.get(Uri.parse(url));
    if (response.statusCode == 200){
      String data = response.body;
      return jsonDecode(data);
    }else{
      print(response.statusCode);

    }
  }
}
