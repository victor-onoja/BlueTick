class LoginState {
  final bool isLoading;

  LoginState({this.isLoading = false});

  LoginState update(bool? isLoading) {
    return LoginState(isLoading: isLoading ?? this.isLoading);
  }
}
