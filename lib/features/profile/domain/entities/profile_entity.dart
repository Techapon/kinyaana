class ProfileEntity {
  final String id;
  final String role;
  final String? img;
  final String? title;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final int? age;
  final String email;
  final String? number;
  final DateTime? updateAt;
  final DateTime? createdAt;

  ProfileEntity({
    required this.id,
    required this.role,
    required this.img,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.age,
    required this.email,
    required this.number,
    required this.updateAt,
    required this.createdAt,
  });

  ProfileEntity get getProfileData => ProfileEntity(
    id: id,
    role: role,
    img: img,
    title: title,
    firstName: firstName,
    lastName: lastName,
    gender: gender,
    age: age,
    email: email,
    number: number,
    updateAt: updateAt,
    createdAt: createdAt,
  );

  // Getter
  String get fullname {
    if (title == null && firstName == null && lastName == null) {
      return "ยังไม่ระบุชื่อ";
    }
    return "$title. $firstName $lastName";
  } 


  @override
  String toString() {
    return 'ProfileEntity(id: $id, role: $role, title: $title, firstName: $firstName, lastName: $lastName, gender: $gender, age: $age, email: $email, number: $number, updateAt: $updateAt, createdAt: $createdAt)';
  }
}