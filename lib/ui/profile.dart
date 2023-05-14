import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child : CircleAvatar(
                      backgroundImage: NetworkImage("https://media.licdn.com/dms/image/D5603AQFLtldPkU-agw/profile-displayphoto-shrink_800_800/0/1677298171866?e=2147483647&v=beta&t=62IcCXpa7TPVpjtjHzA8v92ECPVY2lw7hVaDaZRbRuM"),
                      radius: 80,
                    ),
                  ),
                ),
                Center(
                  child: Text('Hello folks! Get to know me more here', style: TextStyle(fontWeight: FontWeight.bold),)
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Name : Syafira Widiyanti"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Birthday : Sleman, November 3rd 2002"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Zodiac : Scorpio"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Student Number : 123200057"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Major : Informatics"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("College : UPN Veteran Yogyakarta"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Ht/Wt : 157/45"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Phone : +62 859-5244-1486"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Social Media : IG @syfira.wdy / Linkedin @Syafira Widiyanti" ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ),
        )
    );
  }
}
