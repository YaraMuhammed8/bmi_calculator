class BMIStatus {
  double start;
  double end;
  String status;

  BMIStatus({required this.start,required this.end,required this.status});
}
List<BMIStatus> bmiStatus = [
  BMIStatus(start: 0,end: 18.4,status: "UnderWeight"),
  BMIStatus(start: 18.5,end: 24.9,status: "Normal"),
  BMIStatus(start: 25,end: 29.9,status: "OverWeight"),
  BMIStatus(start: 30,end: 50,status: "Obese"),
];