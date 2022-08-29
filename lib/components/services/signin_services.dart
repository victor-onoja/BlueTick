import 'dart:convert';

import 'package:bluetick/components/services/api_models/signin_model.dart';
import 'package:bluetick/components/services/api_models/signup_api_model.dart';
import 'package:bluetick/components/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../widgets/dialogs.dart';
import 'constant.dart';

class SignInServices {
  //
  // Future signIn() async {
  //   final res = await ApiServices().postRequest(
  //     '/login',
  //   );
  // }

  Future<List<Welcome>> signIn(
      {required String email, required String password}) async {
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
      print(response.body);
      print('success');
      final List responseData = jsonDecode(response.body);
      // var responseMain = Welcome.fromJson(responseData);
      //print('this is responses main ' + responseMain.message);
      //
      // return responseMain;
      return responseData.map((e) => Welcome.fromJson(e)).toList();
    } else if (response.statusCode == 401) {
      print('body 401: ' + response.body);
      //showSnackBar(context, 'Please check your network');
      //throw http.ClientException('Unauthorized');
      ///This line of code is so wrong
      return Welcome(message: 'message', token: 'token') as List<Welcome>;
    } else {
      print('failed with statusCode: ${response.statusCode}');
      // showSnackBar(context, 'Something went wrong, Please try again');
      return [];
    }

    // } catch (ex, stackTace) {
    //   //throw Exception(ex);
    //   print(ex);
    //   showSnackBar(context, '${ex.toString()}');
    //   print(stackTace);
    // }
  }
}
