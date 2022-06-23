import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vehicle_tracking1/widget/custom_botton.dart';
import 'package:vehicle_tracking1/widget/custom_text.dart';
import 'constanc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'map.dart';
import 'mqtt_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  late User signedInUser;



  List xx=[];
  List<LatLng> ll = [];

  addLL () async{


    setState((){
      ll.clear();
    });

    setState((){
    xx.forEach((element) {
        ll.add(LatLng(element['x'], element['y']));
      });
    });
    print(ll);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCuttentUser();


    DatabaseReference reff =  FirebaseDatabase.instance.reference().child('location');
    reff.once().then((DataSnapshot snapshot){

      Map<dynamic, dynamic> values =  snapshot.value;
      values.forEach((key,values) {
        xx.add({
          'x': values["x"],
          'y': values["y"]
        });
      });
      print(xx);
    });


  }

  void getCuttentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {},
                  child: Text(
                    "Home",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  )),
              SizedBox(
                height: 16,
              ),
              InkWell(
                  onTap: () {},
                  child: Text(
                    "About",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  )),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 60),
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
              ),
              child: Center(
                  child: Text(
                "Vehicle Tracking App",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Colors.white),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                  ),
                  CustomBotton(
                    text: "Luck",
                    color: secondaryColor,
                    OnPressed: () async{
                      DatabaseReference ref = FirebaseDatabase.instance.reference().child('switch');
                      await ref.set(0);
                    },
                    Myicon: Icons.lock,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomBotton(
                    text: "Unluck",
                    color: secondaryColor,
                    OnPressed: () async{

                      DatabaseReference ref = FirebaseDatabase.instance.reference().child('switch');
                      await ref.set(1);


                     },
                    Myicon: Icons.lock_open_rounded,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomBotton(
                    text: "Location",
                    color: secondaryColor,
                    OnPressed: () {

                      addLL();

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  MyPage(list: ll,)),
                      );
                    },
                    Myicon: Icons.map_outlined,
                  ),
                  SizedBox(
                    height: 24,
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
