class AuthState {}

class AuthInitialState extends AuthState {}

//login state
class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

//Register state
class RegisterLodaingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

//Auth Error State for Login and Register
class AuthErrorState extends AuthState {
  String message;
  AuthErrorState({required this.message});
}
