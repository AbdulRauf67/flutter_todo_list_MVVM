

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices{



  @override
  Future<dynamic> getApi(String url) async {

    dynamic responseJson;
    try {
      final response = await http.get(url as Uri).timeout(
          const Duration(seconds: 10));
      responseJson= reternResponse(response);
    } on SocketException{
      throw InternetException('');
    } on RequestTimeOut{
      throw RequestTimeOut('');
    }

    return responseJson;
  }

  @override
  Future<dynamic> postApi(Map<String, dynamic> data,String url) async {

    if(kDebugMode){
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url),body: jsonEncode(data)).timeout(
          const Duration(seconds: 10));
      responseJson= reternResponse(response);
    } on SocketException{
      throw InternetException('');
    } on RequestTimeOut{
      throw RequestTimeOut('');
    }

    return responseJson;
  }

  reternResponse(http.Response response) {

    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidUrlException ;
      default:
        throw FatchDataException('Error accoured while communication with server'+ response.statusCode.toString());
    }
  }
}