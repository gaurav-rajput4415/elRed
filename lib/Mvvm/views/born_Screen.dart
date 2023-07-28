import 'package:elred_assignment/Mvvm/views/skill_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../constants/strings.dart';
import '../Models/screens/screen_data_response_model.dart';
import '../helpers/api_constant.dart';
import '../view_models/screens/screens_view_model.dart';

class BornScreen extends StatefulWidget {
  String name, gender;
   BornScreen({super.key, required this.name, required this.gender});

  @override
  State<BornScreen> createState() => _BornScreenState();
}

class _BornScreenState extends State<BornScreen> {

  TextEditingController dateInput = TextEditingController();
  late ScreensViewModel screensViewModel;
  late Screens screens;

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

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
      if (value.screens![i].screenName == 'dob') {
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
      child: Column(
        children: [
          Text("My name is: ${widget.name} I am ${widget.gender}", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
          Text(screens.heading.toString(), style: TextStyle(color: Colors.orange, fontSize: 30, fontWeight: FontWeight.bold)),

          TextField(
            controller: dateInput,
            //editing controller of this TextField
            decoration: InputDecoration(
                icon: Icon(Icons.calendar_today), //icon of text field
                labelText: screens.hintText //label text of field
            ),
            readOnly: true,
            //set it true, so that user will not able to edit text
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2100));

              if (pickedDate != null) {
                print(
                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                DateFormat('dd-MM-yyyy').format(pickedDate);
                print(
                    formattedDate); //formatted date output using intl package =>  2021-03-16
                setState(() {
                  dateInput.text =
                      formattedDate; //set output date to TextField value.
                });
              } else {}
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  SkillScreen(name: widget.name, gender: widget.gender, dob: dateInput.text)));
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
