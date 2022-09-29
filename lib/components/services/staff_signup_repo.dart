import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bluetick/components/services/api_models/error_model.dart';
import 'package:bluetick/components/services/api_models/staff_sign_up_body.dart';
import 'package:bluetick/components/services/api_models/staff_sign_up_response.dart';
import 'package:bluetick/components/services/constant.dart';
import 'package:bluetick/components/states/login_state.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class StaffSignUpRepo extends StateNotifier<LoginState> {
  final Reader _read;
  StaffSignUpRepo(this._read) : super(LoginState());

  Future<Either<ErrorModel, StaffSignUpResponse>> staffSignUp(
      StaffSignUpBody staffSignUpBody) async {
    try {
      state = state.update(true);
      log('Attempting to sign up staff');
      var response = await http.post(
        Uri.parse('$BASE_URL/signemail'),
        body: staffSignUpBody.toJson(),
        headers: {'Content-Type': 'application/json'},
      );

      var decodeResponse = jsonDecode(response.body);
      var responseGotten = StaffSignUpResponse.fromMap(decodeResponse);
      log('The gotten response is ${responseGotten.message}');
      return Right(responseGotten);
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

final staffSignUpProvider = StateNotifierProvider<StaffSignUpRepo, LoginState>(
    (ref) => StaffSignUpRepo(ref.read));
