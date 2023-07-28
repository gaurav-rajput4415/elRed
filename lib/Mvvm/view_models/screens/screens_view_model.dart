import 'package:elred_assignment/Mvvm/Models/screens/screen_data_response_model.dart';
import 'package:elred_assignment/Mvvm/helpers/api_constant.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class ScreensViewModel extends ChangeNotifier {
  ValueNotifier<ScreenDataResponseModel> viewModelNotifier = ValueNotifier(ScreenDataResponseModel());

  Future<void> getScreensData(
      {required BuildContext context,
      bool isUseLoader = false}) async {
    viewModelNotifier.value = ScreenDataResponseModel(loadingStatus: ApiStatus.loading);
    final response =
        await http.get(Uri.parse("https://www.jsonkeeper.com/b/96KZ"));
    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> data = jsonDecode(response.body);
      ScreenDataResponseModel screenDataResponseModel = ScreenDataResponseModel.fromJson(data,loadingStatus: ApiStatus.completed);

      viewModelNotifier.value = screenDataResponseModel;
    } else {
      viewModelNotifier.value = ScreenDataResponseModel(loadingStatus: ApiStatus.failed);
      throw Exception("Failed to load data");
    }
  }
}
