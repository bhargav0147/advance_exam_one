import 'package:advance_exam_one/app/modal/app_modal.dart';
import 'package:advance_exam_one/app/modal/sample_modal.dart';
import 'package:advance_exam_one/utils/api_helper.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  List mainList = [];
  AppModal appModal = AppModal();

  Future<void> getJson() async {
    appModal = await ApiHelper.apiHelper.apicall();
    mainList = appModal.data!;
    print(mainList.length);
    notifyListeners();
  }

}
