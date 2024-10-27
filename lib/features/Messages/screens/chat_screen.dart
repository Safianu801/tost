import 'package:flutter/material.dart';
import 'package:toast_mobile/features/Messages/screens/profile_view_screen.dart';

class ChatScreen extends StatefulWidget {
  final String userImage;

  const ChatScreen({super.key, required this.userImage});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final sendMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfileViewScreen(
                      userImage: widget.userImage,
                    )));
          },
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5, color: Colors.purple)),
                child: Container(
                  height: 40,
                  width: 40,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(
                    "assets/images/${widget.userImage}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "userName",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  Text(
                    "Online",
                    style: TextStyle(fontSize: 11, color: Colors.green),
                  )
                ],
              )
            ],
          ),
        ),
        actions: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(13)),
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Center(
                  child: Image.asset(
                "assets/images/feather-video.png",
                color: const Color(0xFFDC143C),
              )),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(13)),
            child: const Padding(
              padding: EdgeInsets.all(11.0),
              child: Center(
                  child: Icon(
                Icons.more_vert,
                color: Color(0xFFDC143C),
              )),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 6,
              child: Container(
                decoration: const BoxDecoration(color: Colors.transparent),
              )),
          Expanded(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: TextFormField(
                          obscureText: false,
                          controller: sendMessageController,
                          style: const TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFFEBEBEB)),
                                borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "Your message",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontWeight: FontWeight.w300),
                            suffixIcon: const Icon(Icons.gif, color: Colors.grey,),
                            contentPadding: const EdgeInsets.all(14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Expanded(
                        child: Container(
                          height: 50,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3))
                          ),
                          child: Icon(Icons.keyboard_voice, color: Colors.red,),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
