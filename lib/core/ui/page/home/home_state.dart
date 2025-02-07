part of 'home_cubit.dart';

class HomeState extends Equatable {
  final LoadStatus loadDataStatus;
  final int count;

  const HomeState({
    this.loadDataStatus = LoadStatus.initial,
    this.count = 0,
  });

  @override
  List<Object?> get props => [loadDataStatus, count];

  HomeState copyWith({
    LoadStatus? loadDataStatus,
    int? count,
  }) {
    return HomeState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
      count: count ?? this.count,
    );
  }
}
