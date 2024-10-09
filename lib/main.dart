import 'package:flutter/material.dart';
import 'package:google_gemini_clone/screens/home/bloc/chat_google_api_bloc.dart';
import 'package:google_gemini_clone/screens/home/home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Add this line
  await dotenv.load(fileName: ".env");
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatGoogleApiBloc(),
      child: MaterialApp(
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
