class Attendance {
  String? id;
  String? studentId;
  String? date;
  String? status;

  Attendance({this.id, this.studentId, this.date, this.status});

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      id: json['id'],
      studentId: json['studentId'],
      date: json['date'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentId': studentId,
      'date': date,
      'status': status,
    };
  }
  factory Attendance.fromMap(Map<String, dynamic> map) {
    return Attendance(
      id: map['id'],
      studentId: map['studentId'],
      date: map['date'],
      status: map['status'],
    );
  }
}
