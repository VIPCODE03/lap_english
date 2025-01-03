import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/bloc/data_bloc/update_data.dart';

import 'load_data.dart';

abstract class DataEvent {}

class DataEventLoad<T> extends DataEvent {
  dynamic args;
  DataEventLoad({this.args});
}

class DataEventUpdate<T> extends DataEvent {
  final T data;
  final Map<String, dynamic>? headers;
  DataEventUpdate({required this.data, this.headers});
}

abstract class DataState {}

class DataStateInitial<T> extends DataState {}

class DataStateLoading<T> extends DataState {}

class DataStateLoaded<T> extends DataState {
  final List<T> data;
  DataStateLoaded(this.data);
}

class DataStateUpdateResult extends DataState {
  final dynamic result;
  DataStateUpdateResult(this.result);
}

class DataStateError<T> extends DataState {
  final String message;
  DataStateError(this.message);
}

class DataBloc<T> extends Bloc<DataEvent, DataState> with UpdateDatas, LoadDatas {

  DataBloc() : super(DataStateInitial<T>()) {

    //--- Load dữ liệu ---
    on<DataEventLoad<T>>((event, emit) async {
      emit(DataStateLoading<T>());
      try {
        final data = await (load[T]!(event.args) as Future<List<T>>);
        await Future.delayed(const Duration(milliseconds: 666));
        emit(DataStateLoaded<T>(data));
      } catch (e) {
        emit(DataStateError<T>('Lỗi tải dữ liệu'));
        debugPrint('Error load: $e');
        rethrow;
      }
    });

    //--- Update dữ liệu ---
    on<DataEventUpdate<T>>((event, emit) async {
      try {
        await Future.delayed(Duration(milliseconds: Random().nextInt(150)));
        var result = await update[T]!(event.data, event.headers ?? {});
        emit(DataStateUpdateResult(result));
      } catch (e) {
        emit(DataStateError<T>('Lỗi cập nhật dữ liệu'));
        debugPrint('Error update: $e');
        rethrow;
      }
    });
  }
}
