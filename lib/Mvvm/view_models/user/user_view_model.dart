import 'package:elred_assignment/Mvvm/Models/screens/screen_data_response_model.dart';
import 'package:elred_assignment/Mvvm/helpers/api_constant.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class UserViewModel extends ChangeNotifier {
  ValueNotifier<ScreenDataResponseModel> viewModelNotifier = ValueNotifier(ScreenDataResponseModel());

  Future<Map<String, dynamic>> postUserData(
      {required BuildContext context,
        String? name,
        String? dob, String? gender,
        String? profession, String? skill,
        bool isUseLoader = false}) async {
    viewModelNotifier.value = ScreenDataResponseModel(loadingStatus: ApiStatus.loading);
    final response =
    await http.post(Uri.parse("https://test1.elred.io/postUserInformation"), body: {
      name: name,
      dob: dob,
      profession: profession,
      skill: skill,
      gender: gender
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;

    } else {
      // viewModelNotifier.value = ScreenDataResponseModel(loadingStatus: ApiStatus.failed);
      throw Exception("Failed to load data");
    }
  }
}
