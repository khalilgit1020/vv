import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'constanc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class MyPage extends StatefulWidget {
  final List<LatLng> list;
  const MyPage({Key? key, required this.list}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late var x;
  late var y;
  var myMarkers = HashSet<Marker>();//collection
  late BitmapDescriptor customMarker;//attribute
  List<Polyline> myPolyline = [];


  getCustomMarker() async{
    customMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assets/images/car-icon2.png");
  }

  void initState(){
    super.initState();
    getCustomMarker();



    creatPolyLine();

  }
  creatPolyLine(){
    myPolyline.add(Polyline(polylineId: PolylineId('1'),
    color: Colors.red,
    width: 3,
    points: widget.list

   /* [

      LatLng(33.39247345340144, 44.48760161120614),
      LatLng(33.39241043133181, 44.487654985842475),
      LatLng(33.39148485319285, 44.48901091460627),
      //جامع المصطفلى
      LatLng(33.390114098251125, 44.48749100303919),
      //السندباد
      LatLng(33.38781514500637, 44.48506937605569),
      //حسينية سيد الشهداء
      LatLng(33.386767397215124, 44.48626027420331),
      //زقاق 69
      LatLng(33.38867526884362, 44.488524003039316),
      //جاسم على الله
      LatLng(33.389808701192855, 44.48993463637395),
      //جاسم على الله
      LatLng(33.39088809514523, 44.48867945846399),
      //
      LatLng(33.391859784132684, 44.48742954311978),
      //ركن البيت
      LatLng(33.392334403588876, 44.48786381428377),
      //البيت
      LatLng(33.39247345340144, 44.48760161120614),

    ]*/,
    patterns: [PatternItem.dash(10),PatternItem.gap(10)],
    ),);
  }
  DatabaseReference ref = FirebaseDatabase.instance.reference();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("The map"),backgroundColor:primaryColor,),
      body: Center(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(33.3924734, 44.4876016),
            zoom: 15,
          ),
          onMapCreated: (GoogleMapController googleMapController){
            setState(() {
              myMarkers.add(Marker(markerId: MarkerId('1'),
                  position: LatLng(33.3924734, 44.4876016),
                icon: customMarker,
              ),
              );
            }
            );
          },
          markers:myMarkers ,
          polylines: myPolyline.toSet(),
        ),
      ),
    );
  }
}
