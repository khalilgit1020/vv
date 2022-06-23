import 'package:flutter/material.dart';
import 'package:vehicle_tracking1/auth/regester.dart';
import 'package:vehicle_tracking1/widget/custom_bottom_soctial.dart';
import 'package:vehicle_tracking1/widget/custom_botton.dart';
import 'package:vehicle_tracking1/widget/text_bottom.dart';
import '../constanc.dart';
import '../home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpenner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 24, right: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Welcome,",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Sign in to Continue",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            )
                          ],
                        ),
                        TextBottom(
                          text: 'Sign Up',
                          color: secondaryColor,
                          alignment: Alignment.centerRight,
                          fontsize: 20,
                          fontWeight: FontWeight.w800,
                          OnPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 64,
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
                      height: 16,
                    ),
                    TextBottom(
                      text: 'Forger password?',
                      color: Colors.black,
                      alignment: Alignment.centerRight,
                      fontsize: 16,
                      fontWeight: FontWeight.w500,
                      OnPressed: () {},
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    CustomBotton(
                      text: "SIGN IN",
                      color: secondaryColor,
                      OnPressed: () async {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                "Vehicle Tracking App",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
              SizedBox(
                height: 80,
              ),
              InkWell(
                onTap: () async {
                 try{
                   final user = await _auth.signInWithEmailAndPassword(
                       email: email, password: password);
                   if (user != null) {
                     print(email);
                     print(password);
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => HomeScreen()),
                     );
                   }
                 }catch(e){
                   print(e);
                 }
                },
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Skip",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      Icon(Icons.arrow_forward_ios,size: 16,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
