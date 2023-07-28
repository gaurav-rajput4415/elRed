import 'package:elred_assignment/Mvvm/Models/screens/screen_data_response_model.dart';
import 'package:elred_assignment/Mvvm/helpers/api_constant.dart';
import 'package:elred_assignment/Mvvm/view_models/screens/screens_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/strings.dart';
import 'gender_screen.dart';

class NameScreen extends StatefulWidget implements PreferredSizeWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NameScreenState extends State<NameScreen> {
  var nameController = TextEditingController();
  late ScreensViewModel screensViewModel;
  double progress = 0.10;
  late Screens screens;


  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double height = mediaQueryData.size.height;
    double width = mediaQueryData.size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.appbarTitle,
          style: TextStyle(color: Colors.white),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Center(
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.red,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ),
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
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getBody(BuildContext context, ScreenDataResponseModel value,
      ScreensViewModel viewModel) {
    for(var i=0; i < value.screens!.length; i++ ){
      if(value.screens![i].screenName == 'name') {
        screens = value.screens![i];
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
      child: value.screens != null
          ? Column(
              children: [
                Text(screens.heading.toString(),
                    style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                Text(screens.question.toString(),
                    style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: value.screens![0].hintText.toString(),
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
                          backgroundColor:
                              Colors.orange[200], // Background color
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  GenderScreen(name : nameController.text.toString())));
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ), // trying to move to the bottom
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Text("No data found"),
    );
  }
}
