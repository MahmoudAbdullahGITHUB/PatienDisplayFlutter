import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_display/model/patient_response.dart';
import 'package:patient_display/netwok/remote/dio_helper.dart';
import 'package:patient_display/screens/home/cuibt/States.dart';

class PatientCubit extends Cubit<PatientStates> {
  PatientCubit() : super(PatientInitialState());

  static PatientCubit getCubitInstance(context) => BlocProvider.of(context);

  List<PatientData> patientsList = [];

  void gettingPatients() {
    emit(PatientLoadingState());

    String randomName;
    int randomAge;
    // in case success
    patientsList = [];
    for (var ind = 0; ind < 3; ind++) {
      String randomName = generateRandomString(5);
      int randomAge = generateRandomInt(64);
      patientsList.add(PatientData(name: randomName, age: randomAge));
    }

    Future.delayed(const Duration(seconds: 3), () {
      print('patients len from cubit + ${patientsList.length}');

      emit(PatientGettingSuccessState(patientsList));

      String randomDate = generateRandomString(30);
    });

    /*DioHelper.getPatients(path: 'url').then((value) {
      emit(PatientGettingSuccessState(value));



    }).catchError((error){
      emit(PatientGettingFailState());
    });*/
  }

  String generateRandomString(int len) {
    var r = Random();
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  int generateRandomInt(int inRange) {
    var r = Random();
    return r.nextInt(inRange);
  }
}
