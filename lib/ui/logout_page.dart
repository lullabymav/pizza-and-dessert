import 'package:final_project_tpm_pizza/ui/login_page.dart';
import 'package:flutter/material.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
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
