import 'dart:convert';
import 'dart:io';
import 'package:bluetick/components/services/api_models/error_model.dart';
import 'package:bluetick/components/services/api_models/login.dart';
import 'package:bluetick/components/services/api_models/signup_api_model.dart';
import 'package:bluetick/components/states/login_state.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'constant.dart';

class LoginRepo extends StateNotifier<LoginState> {
  Reader reader;
  LoginRepo(this.reader) : super(LoginState());

  ///To use later
  void checkingIsLoading() {
    state = state.update(!state.isLoading);
  }

  Future<Either<ErrorModel, Welcome>> loginRequest(Login login) async {
    state = state.update(true);

    try {
      var response = await http.post(
        Uri.parse('$BASE_URL/login'),

        ///body:  login.toJson(),
        body: jsonEncode(login.toLogin()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == HttpStatus.ok) {
        var decodeResponse = jsonDecode(response.body);
        var responseGotten = Welcome.fromJson(decodeResponse);

        return Right(responseGotten);
      } else {
        return Left(
          ///Error.fromJson(jsonDecode(response.body))

          ErrorModel(
              message: {'message': '${jsonDecode(response.body)['message']}'},
              code: response.statusCode),
        );
      }
    } on SocketException {
      return Left(ErrorModel(
          message: {'message': 'Sorry, you don\'t have an internet connection'},
          code: 400));
    } catch (e) {
      return Left(ErrorModel(message: {'message': e.toString()}, code: 400));
    } finally {
      state = state.update(false);
    }
  }
}
