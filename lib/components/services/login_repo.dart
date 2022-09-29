import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bluetick/components/services/api_models/error_model.dart';
import 'package:bluetick/components/services/api_models/login.dart';
import 'package:bluetick/components/states/login_state.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'api_models/login_response.dart';
import 'constant.dart';

class LoginRepo extends StateNotifier<LoginState> {
  Reader reader;
  LoginRepo(this.reader) : super(LoginState());

  ///To use later
  void checkingIsLoading() {
    state = state.update(!state.isLoading);
  }

  Future<Either<ErrorModel, LoginResponse>> loginRequest(Login login) async {
    state = state.update(true);

    try {
      log('Attempting to signin');
      var response = await http.post(
        Uri.parse('$BASE_URL/login'),
        body: jsonEncode(login.toLogin()),
        headers: {'Content-Type': 'application/json'},
      );

      var decodeResponse = jsonDecode(response.body);
      var responseGotten = LoginResponse.fromLoginResponse(decodeResponse);
      log('WorkSpaceName: ' + responseGotten.workspacename!);

      return Right(responseGotten);
    } 
    on SocketException {
      return Left(ErrorModel(
          message: {'message': 'Sorry, you don\'t have an internet connection'},
          code: 400));
    } on FormatException {
      return Left(ErrorModel(
          message: {'message': 'Please enter a correct email or password'},
          code: 400));
    } catch (e) {
      log('Error message from catch: ${e.toString()}');
      return Left(
          ErrorModel(message: {'message': 'Please try again'}, code: 400));
    } finally {
      state = state.update(false);
    }
  }
}
