import 'package:final_project_tpm_pizza/ui/login_page.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  // late SharedPreferences logindata;
  // late String email;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   initials();
  // }
  //
  // void initials()async{
  //   logindata = await SharedPreferences.getInstance();
  //   setState(() {
  //     email = logindata.getString('email')!;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      //logindata.setBool('login', true);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red
                    ),
                    child: Text('Logout')
                )
              ],
            ),
          ),
        )
    );
  }
}
