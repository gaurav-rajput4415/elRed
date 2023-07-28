import 'package:elred_assignment/Mvvm/view_models/user/user_view_model.dart';
import 'package:elred_assignment/Mvvm/views/name_screen.dart';
import 'package:elred_assignment/Mvvm/views/success_alert_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'born_Screen.dart';

class ProfileSummaryScrren extends StatefulWidget {
  String name, dob, gender, skill, profession;
   ProfileSummaryScrren({super.key, required this.name, required this.dob, required this.gender, required this.profession, required  this.skill});

  @override
  State<ProfileSummaryScrren> createState() => _ProfileSummaryScrrenState();
}

class _ProfileSummaryScrrenState extends State<ProfileSummaryScrren> {
  late UserViewModel userViewModel;

  @override
  void initState() {
    // TODO: implement initState
    userViewModel= Provider.of<UserViewModel>(context, listen: false);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Profile Summary"),
       ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "Hi ${widget.name}"
              ),
              Text("You Did it"),
              SizedBox(
                height: 20,
              ),
              Text("Please review your answers below and do change if any or confirm and continue."),
              SizedBox(
                height: 20,
              ),
              Text("My personal details 🙂"),
              SizedBox(
                height: 20,
              ),
              Text("My name is ${widget.name} I am a ${widget.gender} born on ${widget.dob}"),
              SizedBox(
                height: 20,
              ),
              Text("How I keep busy 💻"),
              SizedBox(
                height: 20,
              ),
              Text("I am a ${widget.profession} and I develop ${widget.skill}."),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.orange[200],
                      ),
                      child: IconButton(
                        iconSize: 25,
                        icon: const Icon(
                          Icons.refresh_rounded,
                          color: Colors.black,
                        ), onPressed: () {  },),

                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[200], // Background color
                        ),
                        onPressed: () {
                          userViewModel.postUserData(context: context, name: widget.name, gender: widget.gender, profession: widget.profession, skill: widget.skill);
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  NameScreen()));
                        },
                        child: const Text(
                          'Next', style: TextStyle(color: Colors.black, fontSize: 18),), // trying to move to the bottom
                      ),
                    ),
                  ]),
                ),
              ),
/*
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: double.infinity,
                    child:
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[200], // Background color
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BornScreen()));
                      },
                      child: const Text(
                        'Next', style: TextStyle(color: Colors.black, fontSize: 18),), // trying to move to the bottom
                    ),
                  ),
                ),
              ),
*/
            ],
          ),
        ),
      ),
    );
  }
}
