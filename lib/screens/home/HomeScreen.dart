import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_display/model/patient_response.dart';
import 'package:patient_display/screens/home/cuibt/Cubit.dart';
import 'package:patient_display/screens/home/cuibt/States.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PatientData>? myAllPatients = [
    PatientData(name: "mahmoud", age: 26),
    PatientData(name: "ahmed", age: 22),
    PatientData(name: "mohamed", age: 18),
  ];

  @override
  void initState() {
    super.initState();
    print("init1");

    // new Future.delayed(new Duration(seconds: 3), () {
    //   Navigator.pop(context); //pop dialog
    //   _login();
    // });
  }

  @override
  void didChangeDependencies() {}

  List<String>? myPatientDates = ["24-5", "23-5", "22-5"];
  PatientCubit? patientCubit;

  String generateRandomString(int len) {
    var r = Random();
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  @override
  Widget build(BuildContext context) {
    print("build1");

    return BlocConsumer<PatientCubit, PatientStates>(
      listener: (context, state) {},
      builder: (context, state) {
        patientCubit = PatientCubit.getCubitInstance(context);

        if (state is PatientGettingSuccessState) {
          myAllPatients = state.patients;

          print(myAllPatients!.length);
        }

        return Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.black12,
                  child: const ListTile(
                    leading: Text("Age"),
                    title: Text("Name"),
                    trailing: Text("Date"),
                  ),
                ),
                state is PatientLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: ListView.builder(
                              itemCount: myAllPatients!.isNotEmpty
                                  ? myAllPatients!.length
                                  : 0,
                              // itemCount: 0,
                              itemBuilder: (context, index) => Column(
                                    children: [
                                      ListTile(
                                        leading: Text(
                                            "${myAllPatients![index].age}"),
                                        title: Text(
                                            "${myAllPatients![index].name}"),
                                        trailing: Text(myPatientDates![index]),
                                      ),
                                      const Divider(
                                        color: Colors.grey,
                                      )
                                    ],
                                  )),
                        ),
                      ),
                ElevatedButton(
                    onPressed: () {
                      // String ss = generateRandomString(4);

                      String ss = patientCubit!.generateRandomString(7);

                      patientCubit!.gettingPatients();

                      print('object $ss');
                    },
                    child: const Text('update patients'))
              ],
            ),
          ),
        );
      },
    );
  }
}
