
import 'dart:convert';

import 'package:http/http.dart' as http ;

class ApiProvider{
  final String _baseUrl=
      'https://crudcrud.com/api/965297a48d0a4846ac687e7f39f5135a';

  get(String url) async {
    try{
      final response=await http.get(Uri.parse(_baseUrl+url));

      if(response.statusCode==200){
        var responseJson=json.decode(response.body.toString());
        return responseJson;
      }
    }catch(e){
      print(e);
      rethrow;
    }
  }

  post(String url, Map<String,dynamic> data) async {
    try{
      var jsonData=json.encode(data);
      final response=await http.post(Uri.parse(_baseUrl+url),body: jsonData, headers: {
        'Accept':'Application/json',
        'Content-Type':'Application/json'
      });
      if(response.statusCode==201){
        return true;
      }
    }catch(e){
      print(e);
      rethrow;
    }
  }
  put(String url, Map<String,dynamic> data) async {
    try{
      var jsonData=json.encode(data);
      final response=await http.put(Uri.parse(_baseUrl+url),body: jsonData, headers: {
        'Accept':'Application/json',
        'Content-Type':'Application/json'
      });
      if(response.statusCode==200){
        return true;
      }
    }catch(e){
      print(e);
      rethrow;
    }
  }

  delete(String url) async {
    try{
      final response=await http.delete(Uri.parse(_baseUrl+url));
      if(response.statusCode==200){
        return true;
      }
    }catch(e){
      print(e);
      rethrow;
    }
  }

}