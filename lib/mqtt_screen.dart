import 'package:flutter/material.dart';
class MqttScreen extends StatefulWidget {
  const MqttScreen({Key? key}) : super(key: key);

  @override
  _MqttScreenState createState() => _MqttScreenState();
}

class _MqttScreenState extends State<MqttScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("mqtt"),
      ),
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}
