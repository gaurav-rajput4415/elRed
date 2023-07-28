import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/strings.dart';
import 'born_Screen.dart';
import 'gender_screen.dart';

class BackendScreen extends StatefulWidget {
  const BackendScreen({super.key});

  @override
  State<BackendScreen> createState() => _BackendScreenState();
}

class _BackendScreenState extends State<BackendScreen> {
  String gender = "frontend";

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double height = mediaQueryData.size.height;
    double width = mediaQueryData.size.width;
    return Scaffold(
      appBar: AppBar(
        title:  Text(Strings.appbarTitle,style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("I am a backend developer", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.normal)),
                  Text("i have knowledge of", style: TextStyle(color: Colors.orange, fontSize: 30, fontWeight: FontWeight.bold)),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: 'Enter the technology name',
                      fillColor: Colors.white70,
                    ),
                  ),

                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange[200], // Background color
                          ),
                          onPressed: () {
                          },
                          child: const Text(
                            'Next', style: TextStyle(color: Colors.black, fontSize: 18),), // trying to move to the bottom
                        ),
                      ),
                    ),
                  ),                 ],
              ),
            ),
          )
        ],
      ),
    );

  }
}
