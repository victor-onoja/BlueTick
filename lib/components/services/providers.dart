import 'package:bluetick/components/services/api_models/error_model.dart';
import 'package:bluetick/components/states/login_state.dart';
import 'package:either_dart/either.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'api_models/login.dart';
import 'api_models/signup_api_model.dart';
import 'login_repo.dart';

///SIGN IN
final logInProvider =
    StateNotifierProvider<LoginRepo, LoginState>((ref) => LoginRepo(ref.read));
// final SignInProviderData =
//     FutureProvider<Either<ErrorModel, Welcome>>((ref) async {
//   return ref.watch(signInProvider).loginRequest(Login(
//       email: ref.read(emailProvider.notifier).state,
//       password: ref.read(passwordProvider.notifier).state));
// });

final emailProvider = StateProvider((ref) => '');
final passwordProvider = StateProvider((ref) => '');

/// To load the api request
final isLoadingProvider = StateProvider<bool>((ref) => false);
