import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  Map<String, dynamic> config = {
    'baseUrl': 'https://apidev.ewally.com.br',
  };

  final filename = 'lib/.env.dart';
  File(filename).writeAsString('final env = ${json.encode(config)};');
}