class User {
  final int? id;
  final String name;
  final String rollNo;
  final String semester;
  final String gpa;
  final String address;

  User({
    this.id,
    required this.name,
    required this.rollNo,
    required this.semester,
    required this.gpa,
    required this.address,
  });

  get imageUrl => null;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'rollNo': rollNo,
      'semester': semester,
      'gpa': gpa,
      'address': address,
    };
  }
}
