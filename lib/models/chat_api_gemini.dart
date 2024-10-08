// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatApiGemini {
  final String role;
  final List<ChatApiPartModel> parts;

  ChatApiGemini({required this.role, required this.parts});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'role': role,
      'parts': parts.map((x) => x.toMap()).toList(),
    };
  }

  factory ChatApiGemini.fromMap(Map<String, dynamic> map) {
    return ChatApiGemini(
      role: map['role'] as String,
      parts: List<ChatApiPartModel>.from((map['parts'] as List<int>).map<ChatApiPartModel>((x) => ChatApiPartModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatApiGemini.fromJson(String source) => ChatApiGemini.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ChatApiPartModel {
  final String text;

  ChatApiPartModel({required this.text});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
    };
  }

  factory ChatApiPartModel.fromMap(Map<String, dynamic> map) {
    return ChatApiPartModel(
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatApiPartModel.fromJson(String source) => ChatApiPartModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
