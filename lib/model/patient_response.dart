class Patients {
  Patients(this.patients);

  List<PatientData>? patients;

  Patients.fromJson(Map<String, dynamic> json){
    patients = json['patients'];
  }

  Map<String,dynamic> tojson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patients'] = patients;

    return data;
  }


}

class PatientData {
  String? name;
  int? age;

  PatientData({this.name, this.age});

  PatientData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = this.name;
    data['age'] = age;

    return data;
  }
}
