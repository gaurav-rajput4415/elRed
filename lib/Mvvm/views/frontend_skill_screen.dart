import 'package:elred_assignment/Mvvm/views/profile_summary_screen.dart';
import 'package:elred_assignment/Mvvm/views/success_alert_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/strings.dart';
import '../Models/screens/screen_data_response_model.dart';
import '../helpers/api_constant.dart';
import '../view_models/screens/screens_view_model.dart';
import 'born_Screen.dart';

class FrontEndSkillScreen extends StatefulWidget {
  String profession, gender, name, dob;
   FrontEndSkillScreen({super.key, required this.profession, required this.name, required this.gender, required this.dob});

  @override
  State<FrontEndSkillScreen> createState() => _FrontEndSkillScreenState();
}

class _FrontEndSkillScreenState extends State<FrontEndSkillScreen> {
  String skill = "web";
  late ScreensViewModel screensViewModel;
  late Frontend screens;

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
              Expanded(
                  child: ChangeNotifierProvider<ScreensViewModel>(
                    create: (_) =>
                    ScreensViewModel()..getScreensData(context: context),
                    child: Consumer<ScreensViewModel>(
                      builder: (_, viewModel, __) {
                        screensViewModel = viewModel;
                        return ValueListenableBuilder<ScreenDataResponseModel>(
                            valueListenable: viewModel.viewModelNotifier,
                            builder: (_, value, __) {
                              if (value.loadingStatus == ApiStatus.completed) {
                                return _getBody(context, value, viewModel);
                              }
                              if (value.loadingStatus == ApiStatus.failed) {
                                return Center(child: Text("Please retry"));
                              }
                              if (value.loadingStatus == ApiStatus.loading) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                );
                              }
                              return Text("something went wrong");
                            });
                      },
                    ),
                  )),

            ],
          ),
        ),
      ),
    );

  }

  Widget _getBody(BuildContext context, ScreenDataResponseModel value,
      ScreensViewModel viewModel) {
    for (var i = 0; i < value.screens!.length; i++) {
      if (value.screens![i].screenName == 'profession' && value.screens![i].childScreen!.frontend![0].screenName == 'technology') {
        screens = value.screens![i].childScreen!.frontend![0];
      }
      // else if(value.screens![i].screenName == 'gender') {
      //   screens = value.screens![i];
      // }
      // else if(value.screens![i].screenName == 'dob') {
      //   screens = value.screens![i];
      // }
      // else {
      //   screens = value.screens![i];
      // }
    }
    return Container(
      child: Column(
        children: [
          Text(screens.heading.toString(), style: TextStyle(color: Colors.orange, fontSize: 30, fontWeight: FontWeight.bold)),

          Text("I am ${widget.profession}", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
          Text(screens.question.toString(), style: TextStyle(color: Colors.orange, fontSize: 30, fontWeight: FontWeight.bold)),

          RadioListTile(
            title: Text("Web Application"),
            value: "web",
            groupValue: skill,
            onChanged: (value){
              setState(() {
                skill = value.toString();
              });
            },
          ),

          RadioListTile(
            title: Text("Mobile Application"),
            value: "mobile",
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProfileSummaryScrren(name: widget.name, dob:widget.dob, gender: widget.gender, profession: widget.profession, skill:  skill  )));
                  },
                  child: const Text(
                    'Next', style: TextStyle(color: Colors.black, fontSize: 18),), // trying to move to the bottom
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
