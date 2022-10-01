import 'package:bluetick/components/services/adminSignup_repo.dart';
import 'package:bluetick/components/services/api_models/error_model.dart';
import 'package:bluetick/components/services/api_models/get_staff_body.dart';
import 'package:bluetick/components/services/api_models/get_staff_response/get_staff_response.dart';
import 'package:bluetick/components/services/forgot_password_repo.dart';
import 'package:bluetick/components/services/get_staff_repo.dart';
import 'package:bluetick/components/services/reset_password_repo.dart';
import 'package:bluetick/components/services/verify_password_repo.dart';

import 'package:bluetick/components/states/login_state.dart';
import 'package:either_dart/either.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'login_repo.dart';
import 'verifyWorkspace_repo.dart';

///SIGN IN
final logInProvider =
    StateNotifierProvider<LoginRepo, LoginState>((ref) => LoginRepo(ref.read));

final emailProvider = StateProvider((ref) => '');
final passwordProvider = StateProvider((ref) => '');

final adminSignupProvider = StateNotifierProvider<adminSignupRepo, LoginState>(
    (ref) => adminSignupRepo(ref.read));

final verifyWorkspaceProvider =
    StateNotifierProvider<verifyWorkspace, LoginState>(
        (ref) => verifyWorkspace(ref.read));

///HOME
final workspaceProvider = StateProvider((ref) => '');

final verifyPasswordProvider =
    StateNotifierProvider<verifyPassword, LoginState>(
        (ref) => verifyPassword(ref.read));

final forgotPasswordProvider =
    StateNotifierProvider<forgotPasswordRepo, LoginState>(
        (ref) => forgotPasswordRepo(ref.read));

final resetPasswordProvider = StateNotifierProvider<resetPassword, LoginState>(
    (ref) => resetPassword(ref.read));

final getStaffProvider = FutureProvider<Either<ErrorModel, GetStaffResponse>>((ref) => getStaffrequest(ref.read(getstaffbodyProvider)));

final getstaffbodyProvider = StateProvider<GetStaffBody>((ref) => GetStaffBody(workspacename: ref.read(workspaceProvider)));
