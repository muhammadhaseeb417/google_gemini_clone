import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_gemini_clone/models/chat_api_gemini.dart';
import 'package:google_gemini_clone/screens/home/repos/chat_api_repo.dart';
import 'package:meta/meta.dart';

part 'chat_google_api_event.dart';
part 'chat_google_api_state.dart';

class ChatGoogleApiBloc extends Bloc<ChatGoogleApiEvent, ChatGoogleApiState> {
  ChatGoogleApiBloc() : super(ChatGoogleApiInitial()) {
    on<ChatGoogleApiIntialEvent>(chatGoogleApiIntialEvent);
    on<ChatGoogleApiCall>(chatGoogleApiCall);
  }

  List<ChatApiGemini> messages = [];

  FutureOr<void> chatGoogleApiIntialEvent(
      ChatGoogleApiIntialEvent event, Emitter<ChatGoogleApiState> emit) {
    emit(ChatGoogleApiInitial());
  }

  FutureOr<void> chatGoogleApiCall(
      ChatGoogleApiCall event, Emitter<ChatGoogleApiState> emit) async {
    messages.add(ChatApiGemini(
        role: "user", parts: [ChatApiPartModel(text: event.messagePrompt)]));
    emit(ChatGoogleApiSuccessState(messages: messages));
    await ChatApiRepo.ChatApiResponseGeneration(messages);
  }
}
