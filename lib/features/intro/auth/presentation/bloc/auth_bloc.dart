import 'package:bookia_store/features/intro/auth/presentation/bloc/auth_event.dart';
import 'package:bookia_store/features/intro/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<RegisterEvent>(register);
  }

  register(RegisterEvent event, Emitter<AuthState> emit) {
    emit(RegisterLodaingState());
  }
}
