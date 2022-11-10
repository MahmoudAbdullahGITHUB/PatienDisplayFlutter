import 'package:patient_display/model/patient_response.dart';

abstract class HomeStates {}

class PatientStates extends HomeStates {}

class PatientInitialState extends PatientStates {}
class PatientLoadingState extends PatientStates {}

class PatientGettingSuccessState extends PatientStates {
  final List<PatientData> patients;



  PatientGettingSuccessState(this.patients){
    print('patients len from inner + ${patients.length}');
  }



}

class PatientGettingFailState extends PatientStates {}
