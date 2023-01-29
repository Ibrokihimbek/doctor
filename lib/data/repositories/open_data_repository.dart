import 'package:doctor_app/data/models/responses/myresponse_model.dart';
import 'package:doctor_app/data/service/api_service/info_api_service.dart';

class OpenDataRepo{
  OpenDataRepo({required this.apiService});
  final ApiService apiService;


  Future<MyResponse> getAllInfo()=>apiService.getAllInfo();

}