import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/bot.dart';
import '../model/learn/sentence.dart';

/*  Event   */
abstract class SentenceEvent {}

class LoadSentence extends SentenceEvent {}

/*  State   */
abstract class SentenceState {}

class SentenceInitial extends SentenceState {}

class SentenceLoading extends SentenceState {}

class SentenceLoaded extends SentenceState {
  final List<MainSentenceTopic> topics;

  SentenceLoaded(this.topics);
}

class SentenceError extends SentenceState {
  final String message;

  SentenceError(this.message);
}

/*  Bloc  */
class SentenceBloc extends Bloc<SentenceEvent, SentenceState> {
  GeminiAI gemini = GeminiAI(model: GeminiAI.flash);
  SentenceBloc() : super(SentenceInitial()) {

    //---   Load dữ liệu  ---
    on<LoadSentence>((event, emit) async {
      emit(SentenceLoading());
      try {
        // Dữ liệu JSON chuỗi mẫu
        //  String jsonString = DataSentence.sentenceJsonString;
        String jsonString = await gemini.ask(createW()) ?? '';

        //---   Chuyển json -> đối tượng  ---
        List<dynamic> jsonData = jsonDecode(jsonString);
        List<MainSentenceTopic> topics = jsonData
            .map((item) => MainSentenceTopic.fromJson(item))
            .toList();

        emit(SentenceLoaded(topics));
      } catch (e) {
        emit(SentenceError('Failed to load sentences: $e'));
      }
    });
  }
}
