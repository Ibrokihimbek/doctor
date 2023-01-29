
import 'package:doctor_app/data/models/open_data_model/open_data_model.dart';

abstract class OpenDataCubitState{}

class InitialState extends OpenDataCubitState{}

class LoadInProgress extends OpenDataCubitState{}

class LoadInSuccess extends OpenDataCubitState{
  LoadInSuccess({required this.infoOpenData});
  final InfoOpenData infoOpenData;
}

class LoadInFailure extends OpenDataCubitState{
  LoadInFailure({required this.error});
  final String error;
}