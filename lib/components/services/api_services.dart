import 'package:bluetick/components/services/constant.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<String> postRequest(String url, Map<String, dynamic> body) async {
    try {
      var endpoint = Uri.parse(BASE_URL + url);
      var response = await http.post(endpoint, body: body);
      print(response.body);
      if (response.statusCode == 200) {
        print(response.body);
        return response.body;
      } else if (response.statusCode == 401) {
        throw http.ClientException('Unauthorized');
      } else {
        throw Exception('Something went wrong');
      }
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
