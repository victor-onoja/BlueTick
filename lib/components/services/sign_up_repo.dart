import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bluetick/components/services/api_models/error_model.dart';
import 'package:bluetick/components/services/api_models/sign_up_body.dart';
import 'package:bluetick/components/services/api_models/sign_up_response.dart';
import 'package:bluetick/components/services/constant.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../states/login_state.dart';

class SignUpRepo extends StateNotifier<LoginState> {
  final Reader _reader;
  SignUpRepo(this._reader) : super(LoginState());

  Future<Either<ErrorModel, SignUpResponse>> signUp(
      SignUpBody signUpBody) async {
    try {
      state = state.update(true);
      log('Attemping to send details');
      var response = await http.post(
        Uri.parse('$BASE_URL/signup'),
        body: jsonEncode(signUpBody.toSignUpBody()),
        headers: {'Content-Type': 'application/json'},
      );
      var resonponseData = SignUpResponse.fromJson(response.body);
      log('Expected data $resonponseData');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(resonponseData);
      } else {
        log('Try else block');
        return Left(
          ErrorModel(message: {'message': resonponseData.message}, code: 400),
        );
      }
    } on SocketException {
      return Left(
        ErrorModel(message: {
          'message': 'Sorry, you don\'t have an internet connection'
        }, code: 400),
      );
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

final signUpProvider = StateNotifierProvider<SignUpRepo, LoginState>(
    (ref) => SignUpRepo(ref.read));
