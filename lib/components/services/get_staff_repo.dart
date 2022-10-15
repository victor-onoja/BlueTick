import 'dart:convert';
import 'dart:io';
import 'package:bluetick/components/services/api_models/error_model.dart';
import 'package:bluetick/components/services/api_models/get_staff_body.dart';
import 'package:bluetick/components/services/api_models/get_staff_response/get_staff_response.dart';
import 'package:bluetick/components/services/constant.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

Future<Either<ErrorModel, GetStaffResponse>> getStaffRequest(
    GetStaffBody getStaffBody) async {
  try {
    var response = await http.post(
      Uri.parse('$BASE_URL/getstaffs'),
      body: jsonEncode(getStaffBody.toBody()),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == HttpStatus.ok) {
      var decodedResponse = jsonDecode(response.body);
      var responseGotten = GetStaffResponse.fromResponse(decodedResponse);
      return Right(responseGotten);
    } else {
      return Left(
        ErrorModel(
            message: {'message': '${jsonDecode(response.body)['message']}'},
            code: response.statusCode),
      );
    }
  } on SocketException {
    return Left(ErrorModel(
        message: {'message': 'Sorry, you don\'t have an internet connection'},
        code: null));
  } catch (e) {
    return Left(ErrorModel(message: {'message': e.toString()}, code: 400));
  }
}
