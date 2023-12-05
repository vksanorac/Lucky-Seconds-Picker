import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kjbn_test/repository/data_repository.dart';
import 'package:kjbn_test/views/home/cubit/home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenState());

  int randomNumber = 0;
  init() async {
    print("init called");
    emit(state.copyWith(
        randomNumber: randomNumber,
        homeScreenStateProgress: HomeScreenStateProgress.Loaded,
        message: "Try Again"));
  }

  getRandomNumber() async {
    Random random = Random();
    randomNumber = random.nextInt(59);
    DateTime dateTime = DateTime.now();
    if (randomNumber == dateTime.second) {
      await DataRepository.storeSuccessCount(1);
      int? successCount = await DataRepository.getSuccessCount();
      emit(state.copyWith(
          randomNumber: randomNumber,
          homeScreenStateProgress: HomeScreenStateProgress.Success,
          message: "Your Lucky Second Is:",
          successCount: successCount));
    } else
      emit(state.copyWith(
          randomNumber: randomNumber,
          homeScreenStateProgress: HomeScreenStateProgress.Loaded,
          message: "Try Again"));
  }
}
