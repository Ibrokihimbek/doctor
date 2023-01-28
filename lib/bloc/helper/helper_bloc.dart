
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'helper_event.dart';
part 'helper_state.dart';

class HelperBloc extends Bloc<HelperEvent, HelperState> {
  HelperBloc() : super(HelperInitial()) {
    on<HelperEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
