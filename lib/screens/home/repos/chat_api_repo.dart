import 'package:google_gemini_clone/models/chat_api_gemini.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

class ChatApiRepo {
  static Future<String> ChatApiResponseGeneration(
      List<ChatApiGemini> previousMessages) async {
    final String apiKey = dotenv.env['API_KEY'] ?? '';

    String url =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=$apiKey";

    Dio dio = Dio();

    try {
      final response = await dio.post(url, data: {
        "contents": previousMessages
            .map(
              (e) => e.toMap(),
            )
            .toList(),
        "generationConfig": {
          "temperature": 1,
          "topK": 40,
          "topP": 0.95,
          "maxOutputTokens": 8192,
          "responseMimeType": "text/plain"
        }
      });

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        String modelResponse =
            response.data["candidates"].first["content"]["parts"].first["text"];
        return modelResponse;
      }
      return '';
    } catch (e) {
      print(e);
      return '';
    }
  }
}
