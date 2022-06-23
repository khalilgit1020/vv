import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widget/custom_botton.dart';
import '../../constanc.dart';
import '../home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUpScreen extends StatelessWidget {
  final _auth=FirebaseAuth.instance;

  late String email;
  late String password;
  late String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 128, left: 24, right: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 64,
                    ),
                    Text("Name", style: TextStyle(color: Colors.grey)),
                    TextField(
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text("Email", style: TextStyle(color: Colors.grey)),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text("Password", style: TextStyle(color: Colors.grey)),
                    TextField(
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    CustomBotton(
                      text: "SIGN UP",
                      color: secondaryColor,
                      OnPressed: () async{
                       print(email);
                       print(password);
                        try{
                          final newUser= await _auth.createUserWithEmailAndPassword(email: email, password: password);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        }catch(e){
                          print(e);
                        }

                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
