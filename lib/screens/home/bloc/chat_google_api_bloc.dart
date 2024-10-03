import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_google_api_event.dart';
part 'chat_google_api_state.dart';

class ChatGoogleApiBloc extends Bloc<ChatGoogleApiEvent, ChatGoogleApiState> {
  ChatGoogleApiBloc() : super(ChatGoogleApiInitial()) {
    on<ChatGoogleApiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
