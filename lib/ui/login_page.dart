import 'package:final_project_tpm_pizza/ui/homepage.dart';
import 'package:final_project_tpm_pizza/ui/registration_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isChecked = false;
  bool isLoginSuccess = true;

  late Box box1;

  @override
  void initState(){
    super.initState();
    createBox();
  }

  void createBox() async {
    box1 = await Hive.openBox('logindata');
    getData();
  }

  void getData() async {
    if(box1.get('email')!=null){
      email.text = box1.get('email');
      isChecked = true;
      setState(() {

      });
    }
    if(box1.get('password')!=null){
      password.text = box1.get('password');
      isChecked = true;
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Login Page'),
            backgroundColor: Colors.orange[700],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
                FlutterLogo(
                 size: 100,
                ),
              _emailField(),
              _passwordField(),
              _checkRememberMe(),
              _loginButton(),
            ],
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => RegistrationPage())
              );
            },
            child: Text('Register Now'),
          )
        )
    );
  }

  Widget _emailField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        controller: email,
        decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: TextStyle(
              color: Colors.orange
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Colors.orange
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Colors.orange
              )
          ),
        ),
      ),
    );
  }

  Widget _passwordField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        controller: password,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(
              color: Colors.orange
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Colors.orange
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Colors.orange
              )
          ),
        ),
      ),
    );
  }

  Widget _checkRememberMe(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Remember Me",
          style: TextStyle(color: Colors.black)
        ),
        Checkbox(
          value: isChecked,
          onChanged: (value){
            isChecked = !isChecked;
            setState(() {

            });
          },
        ),
      ],
    );
  }

  Widget _loginButton(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: ElevatedButton(
        onPressed: (){
          String text = "";
          print('Login Clicked Event');
          login();
          if(email == email && password == password){
            setState(() {
              isLoginSuccess = true;
              text = 'Login Success';
              Navigator.pushReplacement(context,
                  MaterialPageRoute(
                      builder: (context) => HomePage()
                  )
              );
            });
          } else {
            setState(() {
              isLoginSuccess = false;
              text = 'Login Failed, Username or Password Wrong';
            });
          }

          SnackBar snackBar = SnackBar(
              content: Text(text)
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('Login')
      ),
    );
  }

  void login(){
    if(isChecked){
      box1.put('email', email.text);
      box1.put('password', password.text);
    }
  }
}