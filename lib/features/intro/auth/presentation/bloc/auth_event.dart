import 'package:bookia_store/features/intro/auth/data/model/request/user_model_params.dart';

class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final UserModelParams params;

  RegisterEvent(this.params);
}

class LoginEvent extends AuthEvent {
  final UserModelParams params;

  LoginEvent(this.params);
}
