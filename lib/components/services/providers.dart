import 'package:bluetick/components/services/adminSignup_repo.dart';
import 'package:bluetick/components/states/login_state.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'login_repo.dart';

///SIGN IN
final logInProvider =
    StateNotifierProvider<LoginRepo, LoginState>((ref) => LoginRepo(ref.read));

final emailProvider = StateProvider((ref) => '');
final passwordProvider = StateProvider((ref) => '');

final adminSignupProvider = StateNotifierProvider<adminSignupRepo, LoginState>(
    (ref) => adminSignupRepo(ref.read));
