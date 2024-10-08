part of 'chat_google_api_bloc.dart';

@immutable
sealed class ChatGoogleApiEvent {}

final class ChatGoogleApiIntialEvent extends ChatGoogleApiEvent {}

final class ChatGoogleApiCall extends ChatGoogleApiEvent {
  final String messagePrompt;

  ChatGoogleApiCall({
    required this.messagePrompt,
  });
}
