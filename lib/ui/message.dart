import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Text("Mobile technology and programming lecture provide invaluable learning experiences. Through this lecture, I learned how to design and develop innovative mobile applications. The message that I got from this lecture is to keep sharpening my mobile programming skills to face the ever-evolving challenges in the future.")
              ],
            ),
          ),
      )
    );
  }
}
