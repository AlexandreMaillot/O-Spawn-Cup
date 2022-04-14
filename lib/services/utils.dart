
import "dart:math";
import 'package:flutter/cupertino.dart';
import "package:intl/intl.dart";
import "dart:async";
import "dart:io";
import "package:firebase_storage/firebase_storage.dart" as firebase_storage;
import "package:flutter/services.dart" show rootBundle;
import "package:path_provider/path_provider.dart";

class Utils {
  int? numRound = 0;

  String generateCode(String beforeCode,int length){
    const String _chars = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890";
    final Random _rnd = Random();
    String code = beforeCode + String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    return code;
  }

  String formatDate(DateTime? date) {
    final f = DateFormat("dd/MM/yyyy hh:mm");

    if(date != null) {
      return DateFormat("dd/MM/yyyy").add_Hm().format(date);
    } else {
      return "";
    }

  }




}