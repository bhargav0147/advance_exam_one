import 'dart:convert';

import 'package:advance_exam_one/app/modal/app_modal.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static  ApiHelper apiHelper=ApiHelper();
  String apiLink =
      'https://real-time-product-search.p.rapidapi.com/search?q=Nike%20shoes&country=us&language=en';
  AppModal appModal = AppModal();

  Future<AppModal> apicall() async {
    var response =await http.get(Uri.parse(apiLink), headers: {
      "X-RapidAPI-Key": "5b8bdc4157msh8b6147d46474495p19b24cjsn21606fe184db",
      "X-RapidAPI-Host": "real-time-product-search.p.rapidapi.com",
    });
    var json = jsonDecode(response.body);
    appModal = AppModal.fromJson(json);
    return appModal;
  }
}
