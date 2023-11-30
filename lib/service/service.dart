


import 'package:dio/dio.dart';
// import 'package:quiz4/config/get_it.dart';
// import 'package:quiz4/model/model_add.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_quiz/bloc/config/get_it.dart';
import 'package:test_quiz/model/model_add.dart';

abstract class AddService{
  Dio dio = Dio();
  String baseURL = "https://653e6cc99e8bd3be29df4853.mockapi.io/question";

  Question (ModelAdd Asks);
}

class AddServiceImpl extends AddService{
  @override
  Question (ModelAdd Asks)async{
    try{
      print(Asks.toJson());
      Response response = await dio.post(baseURL,data: Asks.toJson());
      if (response.statusCode==200){
        print(response.data);
    //     String token =response.data['token'];
    // storage.get<SharedPreferences>().setString('token', token);
        return true;
      }else{
        return false;
      }
    }catch(e){
      print("object");
      throw e;
    }
  }
}

