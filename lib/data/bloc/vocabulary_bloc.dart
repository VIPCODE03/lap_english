import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/a_data_test/datatest.dart';
import '../model/vocabulary.dart';

/*  Event   */
abstract class VocabularyEvent {}

class LoadVocabulary extends VocabularyEvent {}

/*  State   */
abstract class VocabularyState {}

class VocabularyInitial extends VocabularyState {}

class VocabularyLoading extends VocabularyState {}

class VocabularyLoaded extends VocabularyState {
  final List<MainVocabularyTopic> topics;

  VocabularyLoaded(this.topics);
}

class VocabularyError extends VocabularyState {
  final String message;

  VocabularyError(this.message);
}

/*  Bloc  */
class VocabularyBloc extends Bloc<VocabularyEvent, VocabularyState> {
  VocabularyBloc() : super(VocabularyInitial()) {

    //---   Load dữ liệu  ---
    on<LoadVocabulary>((event, emit) async {
      emit(VocabularyLoading());
      try {
        await Future.delayed(const Duration(milliseconds: 1500));
        // Dữ liệu JSON chuỗi mẫu
        const String jsonString = MockData.jsonString;

        //---   Chuyển json -> đối tượng  ---
        List<dynamic> jsonData = jsonDecode(jsonString);
        List<MainVocabularyTopic> topics = jsonData
            .map((item) => MainVocabularyTopic.fromJson(item))
            .toList();

        emit(VocabularyLoaded(topics));
      } catch (e) {
        emit(VocabularyError('Failed to load vocabulary: $e'));
      }
    });

  }
}
