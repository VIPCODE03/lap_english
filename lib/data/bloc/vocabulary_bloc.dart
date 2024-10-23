import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/a_data_test/datatest.dart';
import '../../services/bot.dart';
import '../model/learn/vocabulary.dart';

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
  GeminiAI gemini = GeminiAI(model: GeminiAI.flash);
  VocabularyBloc() : super(VocabularyInitial()) {

    //---   Load dữ liệu  ---
    on<LoadVocabulary>((event, emit) async {
      emit(VocabularyLoading());
      List<dynamic> jsonData = [];
      try {
        // Dữ liệu JSON chuỗi mẫu
        const String jsonString = MockData.jsonString;
        jsonData.addAll(jsonDecode(jsonString));

       //  String jsonAI = await gemini.ask(createWord()) ?? '';
       //
       //  //---   Chuyển json -> đối tượng  ---
       // if(jsonAI.isNotEmpty) {
       //   jsonData.addAll(jsonDecode(jsonAI));
       // }
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
