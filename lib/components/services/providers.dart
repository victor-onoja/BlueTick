import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'signin_services.dart';

///SIGN IN
final signInProvider = Provider<SignInServices>((ref) => SignInServices());
