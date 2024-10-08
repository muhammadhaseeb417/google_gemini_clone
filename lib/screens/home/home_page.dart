import 'package:flutter/material.dart';
import 'package:google_gemini_clone/screens/home/bloc/chat_google_api_bloc.dart';
import 'package:google_gemini_clone/screens/home/widgets/container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ChatGoogleApiBloc>().add(ChatGoogleApiIntialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ensures the UI adjusts when the keyboard appears
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 70,
                width: double.infinity,
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Google_Gemini_logo.svg/2560px-Google_Gemini_logo.svg.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Expanded to take the remaining space
            Expanded(
              child: BlocConsumer<ChatGoogleApiBloc, ChatGoogleApiState>(
                listener: (context, state) {},
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  if (state is ChatGoogleApiInitial) {
                    return const SingleChildScrollView(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello,",
                            style: TextStyle(
                              fontSize: 60,
                            ),
                          ),
                          Text(
                            "How can I help you today?",
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
                    );
                  } else if (state is ChatGoogleApiSuccessState) {
                    final messages = state.messages;
                    return ListView.builder(
                      padding: const EdgeInsets.all(15),
                      // Add one more item if generating (for shimmer)
                      itemCount: messages.length +
                          (context.read<ChatGoogleApiBloc>().generating
                              ? 1
                              : 0),
                      itemBuilder: (context, index) {
                        // If we're at the last index and generating is true, show shimmer
                        if (index == messages.length &&
                            context.read<ChatGoogleApiBloc>().generating) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade800,
                            highlightColor: Colors.grey.shade500,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.7,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }

                        // Align user and model messages correctly
                        return Align(
                          alignment: messages[index].role == "user"
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width *
                                0.7, // 70% of the screen width
                            decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              borderRadius: messages[index].role == "user"
                                  ? const BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                      topLeft: Radius.circular(15),
                                    )
                                  : const BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                            ),
                            child: Row(
                              mainAxisAlignment: messages[index].role == "user"
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    messages[index].parts.first.text,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                    softWrap: true, // Ensure the text wraps
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text('An error occurred'),
                    );
                  }
                },
              ),
            ),
            // Input field at the bottom
            Padding(
              padding: const EdgeInsets.all(12.0),
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
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      if (textEditingController.text.isNotEmpty) {
                        String text = textEditingController.text;
                        textEditingController.clear();
                        context
                            .read<ChatGoogleApiBloc>()
                            .add(ChatGoogleApiCall(messagePrompt: text));
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue, // Background color for visibility
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
