import 'package:flutter_test/flutter_test.dart';
import 'package:online_attendance_app/domain/store.dart';

void main(){

  Map<String, dynamic> storeJson = {"id":1,"name":"beatae","address":"182 Misael Greens Suite 459 West Kim, CT 57048"};
  Store storeModel = const Store(id: 1, name: "beatae", address: "182 Misael Greens Suite 459 West Kim, CT 57048");

  group('store class test', () {
    test('using store json',(){
      expect(Store.fromJson(storeJson), storeModel);
    });
    test('using toJson', (){
      expect(storeJson, storeModel.toJson());
    });
  });
}
