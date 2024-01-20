import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_navigation_event.dart';
import 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc(super.initialState) {
    on<BottomNavigationChangeValue>(_onBottomNavigationChangeValue);
  }

  void _onBottomNavigationChangeValue(
    BottomNavigationChangeValue event,
    Emitter<BottomNavigationState> emit,
  ) {
    emit(BottomNavigationState(value: event.newValue));
  }
}
