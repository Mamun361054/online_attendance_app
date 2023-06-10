import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

main(){

  const String baseUrl = "http://128.199.215.102:4040";
  String storesUrl = "$baseUrl/api/stores";
  String attendanceUrl = "$baseUrl/api/attendance";
  String attendanceData = "Test data";

  group('http call', () {
    test('status code 200', () async{
      final response = await http.get(Uri.parse(attendanceUrl));
      expect(response.statusCode, 200);
    });

    test('response data check', () async{
      final response = await http.get(Uri.parse(attendanceUrl));
      expect(json.decode(response.body), attendanceData);
    });
  });

}