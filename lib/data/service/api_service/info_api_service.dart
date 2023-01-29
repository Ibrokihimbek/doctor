import 'package:dio/dio.dart';
import 'package:doctor_app/data/models/open_data_model/open_data_model.dart';
import 'package:doctor_app/data/models/responses/myresponse_model.dart';
import 'package:doctor_app/data/service/api_cilent/api_client.dart';
class ApiService extends  ApiClient {

  Future<MyResponse> getAllInfo() async{
    MyResponse myResponse = MyResponse(error: "");
    try{
      Response response = await dio.get(dio.options.baseUrl);
      if(response.statusCode! >= 200 && response.statusCode! < 300){
        myResponse.data =  InfoOpenData.fromJson(response.data)
        ;
      }
    } catch(error){
      myResponse.error = error.toString();
    }
    return myResponse;
  }

}