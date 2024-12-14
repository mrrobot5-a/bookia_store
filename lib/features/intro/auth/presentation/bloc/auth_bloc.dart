import 'package:bookia_store/core/services/local/app_local_storage.dart';
import 'package:bookia_store/features/intro/auth/data/repoApi/auth_repoApi.dart';
import 'package:bookia_store/features/intro/auth/presentation/bloc/auth_event.dart';
import 'package:bookia_store/features/intro/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<RegisterEvent>(register);
    on<LoginEvent>(login);
  }

  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLodaingState());

    try {
      await AuthRepoapi.register(event.params).then((value) {
        if (value != null) {
          AppLocalStorage.cacheData(AppLocalStorage.token, value.data?.token);

          emit(RegisterSuccessState());
        } else {
          emit(AuthErrorState(message: "Unexpected error"));
        }
      });
    } on Exception catch (e) {
      emit(AuthErrorState(message: "Unexpected error"));
    }
  }

  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());

    try {
      await AuthRepoapi.login(event.params).then((value) {
        if (value != null) {
          AppLocalStorage.cacheData(AppLocalStorage.token, value.data?.token);
          emit(LoginSuccessState());
        } else {
          emit(AuthErrorState(message: "Unexpected error"));
        }
      });
    } on Exception catch (e) {
      emit(AuthErrorState(message: "Unexpected error"));
    }
  }
}
