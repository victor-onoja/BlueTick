import 'package:bluetick/components/models/signin_model.dart';
import 'package:bluetick/components/services/api_services.dart';

class SignInServices {
  //
  Future signin() async {
    final res = await ApiServices()
        .postRequest('/login', SignInModel(email: '', password: '').toJson());
  }
}
