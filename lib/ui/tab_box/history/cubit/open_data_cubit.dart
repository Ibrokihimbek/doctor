import 'package:doctor_app/data/models/responses/myresponse_model.dart';
import 'package:doctor_app/data/repositories/open_data_repository.dart';
import 'package:doctor_app/ui/tab_box/history/cubit/open_data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OpenDataCubit extends Cubit<OpenDataCubitState>{
  OpenDataCubit({required this.openDataRepo}):super(InitialState()){
    _fetchAllData();
  }

  final OpenDataRepo openDataRepo;

  _fetchAllData() async{
    emit(LoadInProgress());
    MyResponse myResponse = await openDataRepo.getAllInfo();
    if(myResponse.error.isEmpty){
      emit(LoadInSuccess(infoOpenData: myResponse.data));
    }else{
      emit(LoadInFailure(error: myResponse.error));
    }
  }
}