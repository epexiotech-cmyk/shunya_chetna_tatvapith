class VisitModel {
  int? id;

  late int patientId; // 🔥 link with patient
  late int clinicId; // 🔥 link with clinic

  late String date;
  late String observation;
  late String problem;

  List<String> pdfPaths = [];

  VisitModel({
    this.id,
    required this.patientId,
    required this.clinicId,
    required this.date,
    required this.observation,
    required this.problem,
    required this.pdfPaths,
  });
}
