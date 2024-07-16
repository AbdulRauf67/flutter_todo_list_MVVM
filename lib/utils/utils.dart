

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils{

  static void fieldFocusChange(BuildContext context, FocusNode current,
      FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // static toastMessage(String message){
  //    Fluttertoast.showToast(msg: message,
  //        backgroundColor: Colors.black);
  // }
  //
  // static snakBar(String title,String message){
  //
  //   Get.snackbar(
  //     title,message
  //   );
// }


}