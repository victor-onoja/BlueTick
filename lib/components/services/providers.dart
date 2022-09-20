import 'package:bluetick/components/services/adminSignup_repo.dart';
import 'package:bluetick/components/services/verifyWorkspace_repo.dart';
import 'package:bluetick/components/states/login_state.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'login_repo.dart';

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
final workspaceProvider = StateProvider((ref) => 'test');
