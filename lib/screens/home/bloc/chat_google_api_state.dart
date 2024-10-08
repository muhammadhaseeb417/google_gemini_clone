part of 'chat_google_api_bloc.dart';

@immutable
sealed class ChatGoogleApiState {}

final class ChatGoogleApiInitial extends ChatGoogleApiState {}

final class ChatGoogleApiSuccessState extends ChatGoogleApiState {
  final List<ChatApiGemini> messages;

  ChatGoogleApiSuccessState({required this.messages});
}
