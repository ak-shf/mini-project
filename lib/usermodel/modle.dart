class Staff {
  String? address;
  String? email;
  String? mobile;
  String? name;
  String? uid;
  String? image;
  String? personalemail;
  String? dateofbirth;

  String? role;
  //List<List<String>>?services;

  Staff(
      {this.address,
      this.email,
      this.personalemail,
      this.mobile,
      this.name,
      this.uid,
      this.image,
      this.dateofbirth,
      this.role});
  Map<String, dynamic> toJson() => {
        "address": address,
        "email": email,
        "personalemail": personalemail,
        "mobile": mobile,
        "name": name,
        "uid": uid,
        "ImageLink": image,
        'role': role,
        "dateofdirth": dateofbirth
        //'services':services
      };
}

class Doctor {
  String? address;
  String? email;
  String? mobile;
  String? name;
  String? uid;
  String? image;
  String? personalemail;
  String? dateofbirth;

  String? role;
  //List<List<String>>?services;

  Doctor(
      {this.address,
      this.email,
      this.personalemail,
      this.mobile,
      this.name,
      this.uid,
      this.image,
      this.dateofbirth,
      this.role});
  Map<String, dynamic> toJson() => {
        "address": address,
        "email": email,
        "personalemail": personalemail,
        "mobile": mobile,
        "name": name,
        "uid": uid,
        "ImageLink": image,
        'role': role,
        "dateofdirth": dateofbirth
        //'services':services
      };
}
// class Admin {
//   String? address;
//   String? email;
//   String? mobile;
//   String? name;
//   String? uid;
//   String? image;
//   String? personalemail;
//   String? dateofbirth;

//   String? role;
//   //List<List<String>>?services;

//   Admin(
//       {this.address,
//       this.email,
//       this.personalemail,
//       this.mobile,
//       this.name,
//       this.uid,
//       this.image,
//       this.dateofbirth,
//       this.role});
//   Map<String, dynamic> toJson() => {
//         "address": address,
//         "email": email,
//         "personalemail": personalemail,
//         "mobile": mobile,
//         "name": name,
//         "uid": uid,
//         "ImageLink": image,
//         'role': role,
//         "dateofdirth":dateofbirth
//         //'services':services
//       };
// }
class Parent {
  String? address;
  String? email;
  String? mobile;
  String? name;
  String? uid;
  String? image;
  String? personalemail;
  String? dateofbirth;

  String? role;
  //List<List<String>>?services;

  Parent(
      {this.address,
      this.email,
      this.personalemail,
      this.mobile,
      this.name,
      this.uid,
      this.image,
      this.dateofbirth,
      this.role});
  Map<String, dynamic> toJson() => {
        "address": address,
        "email": email,
        "personalemail": personalemail,
        "mobile": mobile,
        "name": name,
        "uid": uid,
        "ImageLink": image,
        'role': role,
        "dateofdirth": dateofbirth
        //'services':services
      };
}
