import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tab_state.dart';

class TabCubit extends Cubit<TabsState> {
  TabCubit() : super(TabsState(currentPage: 0));

  void changeTabState(int changedIndex) {
    emit(state.copyWith(currentPage: changedIndex));
  }
}
