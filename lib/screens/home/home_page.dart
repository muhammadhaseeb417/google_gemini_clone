import 'package:flutter/material.dart';
import 'package:google_gemini_clone/screens/home/widgets/container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 70,
            width: double.maxFinite,
            child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Google_Gemini_logo.svg/2560px-Google_Gemini_logo.svg.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
        // _chatAre(context),
        Expanded(
          child: Container(
            width: double.maxFinite,
            color: Colors.grey.shade900,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 15,
            ),
            child: Stack(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(
                        fontSize: 60,
                      ),
                    ),
                    Text(
                      "How can I help you today ?",
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ContaninerWidget(
                        innerText:
                            "What are tips to improve public speaking skills?"),
                    ContaninerWidget(
                        innerText:
                            "Find hotels in Phuket for a week, and suggest a packing list"),
                    ContaninerWidget(
                        innerText:
                            "Improve the readability of the following code"),
                    ContaninerWidget(
                        innerText: "Find the best running trails nearby"),
                  ],
                ),
                Positioned(
                  bottom: 1,
                  right: 0,
                  left: 0,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: textEditingController,
                          decoration: InputDecoration(
                            hintText: 'Type a message...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors
                              .blue, // Add a background color for visibility
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
