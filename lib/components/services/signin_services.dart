import 'dart:convert';

import 'package:bluetick/components/services/api_models/signin_model.dart';
import 'package:bluetick/components/services/api_models/signup_api_model.dart';
import 'package:http/http.dart' as http;

import 'constant.dart';

class SignInServices {
  Future<List<Welcome>> signIn(
      {required String email, required String password}) async {
    print('This is the sign in method');
    //try {
    var endpoint = Uri.parse(
      BASE_URL + '/login',
    );

    var model = SignInModel(email: email, password: password);
    var response = await http.post(endpoint,
        headers: {'Content-Type': 'application/json'},
        body: signInModelToJson(model));

    print(response.body);
    if (response.statusCode == 200) {
      print('success');
      print(response.body + 'This is from 200 statuscode');

      final List responseData = jsonDecode(response.body);

      return responseData.map((e) => Welcome.fromJson(e)).toList();
    } else if (response.statusCode == 401) {
      print('body 401: ' + response.body);
      //showSnackBar(context, 'Please check your network');
      //throw http.ClientException('Unauthorized');
      ///This line of code is so wrong
      return Welcome(message: {'message': response.body}, token: 'token')
          as List<Welcome>;
    } else if (response.statusCode == 404) {
      ///testing
      var responseBody = jsonDecode(response.body);
      print(responseBody + 'This is the decoded response body');

      ///testing
      print(response.body +
          'is for statusCode ' +
          response.statusCode.toString());
      final List responseData = jsonDecode(response.body);
      return responseData.map((e) => Welcome.fromJson(e)).toList();
    } else {
      print('failed with statusCode: ${response.statusCode}');

      final List responseData = jsonDecode(response.body);
      return responseData.map((e) => Welcome.fromJson(e)).toList();
    }
  }
}
