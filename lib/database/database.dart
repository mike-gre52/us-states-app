import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class MapDatabase {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    return File("$path/mapDatabase.json");
  }

  Future<String> readFile() async {
    try {
      final file = await _localFile;

      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      return 'error';
    }
  }

  Future<File> writeToDatabase(String jsonString) async {
    final file = await _localFile;

    return file.writeAsString(jsonString);
  }
}
