
import 'package:flutter_bloc/flutter_bloc.dart';

/*  Class events  */

abstract class CounterEvent {}
class cong extends CounterEvent{}
class tru extends CounterEvent{}

/*  Class State   */
class CounterState {
  int so1;
  int so2;
  CounterState(this.so1, this.so2);
}

/*  Class Bloc  */
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(super.initialState) {

    //--- Khi sự kiện cong được nhận  ---
    on<cong>((event, emit) {
      emit(CounterState(state.so1 + state.so2, state.so1 * state.so2));
    });

    //--- Khi sự kiện tru được nhận ---
    on<tru>((event, emit) {
      emit(CounterState(state.so1 - state.so2, state.so2 - state.so1));
    });

  }
}
