part of 'tab_cubit.dart';

class TabsState extends Equatable {
  late final int currentPage;

  TabsState({
    required this.currentPage,
  });

  TabsState copyWith({
    int? currentPage,
  }) =>
      TabsState(
        currentPage: currentPage ?? this.currentPage,
      );

  @override
  List<Object?> get props => [
        currentPage,
      ];
}
