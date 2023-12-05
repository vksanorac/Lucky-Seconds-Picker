enum HomeScreenStateProgress { Loading, Loaded, Success }

class HomeScreenState {
  final String? message;
  final int? randomNumber;
  final HomeScreenStateProgress? homeScreenStateProgress;
  final int? successCount;

  const HomeScreenState(
      {this.message,
      this.randomNumber = 0,
      this.homeScreenStateProgress = HomeScreenStateProgress.Loading,
      this.successCount});

  HomeScreenState copyWith(
      {final String? message,
      final int? randomNumber,
      final HomeScreenStateProgress? homeScreenStateProgress,
      final int? successCount}) {
    return HomeScreenState(
        message: message ?? this.message,
        homeScreenStateProgress:
            homeScreenStateProgress ?? this.homeScreenStateProgress,
        randomNumber: randomNumber ?? this.randomNumber,
        successCount: successCount ?? this.successCount);
  }
}
