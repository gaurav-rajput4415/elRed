import 'package:elred_assignment/Mvvm/views/profile_summary_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/strings.dart';
import 'born_Screen.dart';

class DesignerSkillScreen extends StatefulWidget {
  const DesignerSkillScreen({super.key});

  @override
  State<DesignerSkillScreen> createState() => _DesignerSkillScreenState();
}

class _DesignerSkillScreenState extends State<DesignerSkillScreen> {
  String skill = "Figma";

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
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("I am a UI/UX developer", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
              Text("And I develop", style: TextStyle(color: Colors.orange, fontSize: 30, fontWeight: FontWeight.bold)),

              RadioListTile(
                title: Text("Figma"),
                value: "Figma",
                groupValue: skill,
                onChanged: (value){
                  setState(() {
                    skill = value.toString();
                  });
                },
              ),

              RadioListTile(
                title: Text("AdobeXd"),
                value: "Adobe",
                groupValue: skill,
                onChanged: (value){
                  setState(() {
                    skill = value.toString();
                  });
                },
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProfileSummaryScrren(name: 'gau', dob: '12/08/1996', gender: 'Male', profession: 'Frontedn', skill: 'Web',)));
                      },
                      child: const Text(
                        'Next', style: TextStyle(color: Colors.black, fontSize: 18),), // trying to move to the bottom
                    ),
                  ),
                ),
              ),                 ],
          ),
        ),
      ),
    );

  }
}
