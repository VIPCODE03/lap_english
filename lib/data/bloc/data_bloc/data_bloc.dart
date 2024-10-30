import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/bloc/data_bloc/load_data.dart';
import 'package:lap_english/data/bloc/data_bloc/update_data.dart';

abstract class DataEvent {}

class DataEventLoad<T> extends DataEvent {}

class DataEventUpdate<T> extends DataEvent {
  final List<T> datas;
  DataEventUpdate({required this.datas});
}

abstract class DataState<T> {}

class DataStateInitial<T> extends DataState<T> {}

class DataStateLoading<T> extends DataState<T> {}

class DataStateLoaded<T> extends DataState<T> {
  final List<T> data;
  DataStateLoaded(this.data);
}

class DataStateError<T> extends DataState<T> {
  final String message;
  DataStateError(this.message);
}

class DataBloc<T> extends Bloc<DataEvent, DataState<T>> {

  DataBloc() : super(DataStateInitial<T>()) {
    //--- Load dữ liệu ---
    on<DataEventLoad<T>>((event, emit) async {
      emit(DataStateLoading<T>());
      try {
        final data = await (LoadDatas.load[T]!() as Future<List<T>>);
        emit(DataStateLoaded<T>(data));
      } catch (e) {
        emit(DataStateError<T>('Failed to load data: $e'));
      }
    });

    //--- Update dữ liệu ---
    on<DataEventUpdate<T>>((event, emit) async {
      if (state is DataStateLoaded<T>) {
        await UpdateDatas.update[T]!(event.datas);
        emit(DataStateLoaded<T>(event.datas));
      }
    });
  }
}
