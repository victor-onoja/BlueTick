import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:bluetick/components/services/api_models/error_model.dart';
import 'package:bluetick/components/services/api_models/invite_member_body.dart';
import 'package:bluetick/components/services/api_models/invite_member_response.dart';
import 'package:bluetick/components/states/login_state.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constant.dart';
import 'mail.dart';

class InviteMemberRepo extends StateNotifier<LoginState> {
  Reader reader;
  InviteMemberRepo(this.reader) : super(LoginState());

  Future<Either<ErrorModel, InviteMemberResponse>> InviteMember(
      InviteMemberBody inviteMemberBody) async {
    state = state.update(true);
    try {
      log('Attempting to send invite');

      http.Response response = await http.post(Uri.parse('$BASE_URL/addmem'),
          body: inviteMemberBody.toJson(),
          headers: {'Content-Type': 'application/json'});

      var decodeResponse = jsonDecode(response.body);
      log('Decoded Response: ${decodeResponse.toString()}');
      var responseGotten = InviteMemberResponse.fromMap(decodeResponse);

      // List inviteLinks = responseGotten.link ?? [];
      //
      // for (int index = 0;
      // inviteLinks.length > index;
      // index++) {
      //   log('In the inviteLink loop');
      //   await sendEmail(email: emailList[index], message: '''
      //                        You just got invited to join $myWorkspaceName,
      //                        click on the link below to get started
      //                        ${inviteLinks[index]}
      //                       ''');
      //   log('${inviteLinks[index]} sent to ${emailList[index]} successfully');

      return Right(responseGotten);
    } on SocketException {
      return Left(ErrorModel(
          message: {'message': 'Sorry, you don\'t have an internet connection'},
          code: 400));
    } on FormatException {
      log('This is a socket exception');
      return Left(ErrorModel(
          message: {'message': 'Please enter a correct email or password'},
          code: 400));
    } catch (ex, stackTrace) {
      log('Attempting to send invite Error caught as: $ex \nWith stacktrace: $stackTrace \n Thank you');

      ///
      return Left(ErrorModel(
          message: {'message': 'An Error occured, Please try again'},
          code: 400));
    } finally {
      state = state.update(false);
    }
  }
}

final InviteMemberRepoProvider =
    StateNotifierProvider<InviteMemberRepo, LoginState>(
        (ref) => InviteMemberRepo(ref.read));
