import 'package:bluetick/components/services/api_models/signup_api_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'signin_services.dart';

///SIGN IN
final signInProvider = Provider<SignInServices>((ref) => SignInServices());
