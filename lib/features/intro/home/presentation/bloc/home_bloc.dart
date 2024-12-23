import 'package:bloc/bloc.dart';
import 'package:bookia_store/features/intro/home/data/models/get_new_arrivals_response/get_new_arrivals_response.dart';
import 'package:bookia_store/features/intro/home/data/models/get_slider_response/get_slider_response.dart';
import 'package:bookia_store/features/intro/home/data/repo/home_repo.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>((event, emit) {});
    on<GetNewArrivalsEvent>(getNewArrivals);
    on<GetSliderEvent>(getSlider);
  }
  GetNewArrivalsResponse? newArrivalsBooks;
  GetSliderResponse? newSlider;

//! get New Arrivals funciton
  Future<void> getNewArrivals(
      GetNewArrivalsEvent event, Emitter<HomeState> emit) async {
    emit(NewArrivalsloadingState());

    try {
      await HomeRepo.getNewArrivalsBooks().then((value) {
        if (value != null) {
          newArrivalsBooks = value;
          emit(NewArrivalsSuccessState());
        } else {
          emit(MessageErrorState(message: "Unexpected Error"));
        }
      });
    } catch (error) {
      emit(MessageErrorState(message: "Unexpected Error"));
    }
  }
//! get Slider funciton

  Future<void> getSlider(GetSliderEvent event, Emitter<HomeState> emit) async {
    emit(NewSliderloadingState());

    try {
      await HomeRepo.getSilder().then((value) {
        if (value != null) {
          newSlider = value;
          emit(NewSliderSuccessState());
        } else {
          emit(MessageErrorState(message: "Unexpected Error"));
        }
      });
    } catch (error) {
      emit(MessageErrorState(message: "Unexpected Error"));
    }
  }
}
