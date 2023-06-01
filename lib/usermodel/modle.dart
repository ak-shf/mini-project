import 'package:cloud_firestore/cloud_firestore.dart';

class Staff {
  String? address;
  String? email;
  String? mobile;
  String? name;
  String? uid;
  String? id;
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
      this.id,
      this.uid,
      this.image,
      this.dateofbirth,
      this.role});
  static Staff fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Staff(
      name: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      image: snapshot["imageLink"],
      dateofbirth: snapshot["dateofbirth"],
      mobile: snapshot["mobile"],
      id: snapshot['id'],
      personalemail: snapshot["personalemail"],
    );
  }

  Map<String, dynamic> toJson() => {
        "address": address,
        "email": email,
        "personalemail": personalemail,
        "mobile": mobile,
        "name": name,
        "id": id,
        "uid": uid,
        "imageLink": image,
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
  String? id;
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
      this.id,
      this.uid,
      this.image,
      this.dateofbirth,
      this.role});
  static Doctor fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Doctor(
      name: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      image: snapshot["imageLink"],
      dateofbirth: snapshot["dateofbirth"],
      mobile: snapshot["mobile"],
      id: snapshot["id"],
      personalemail: snapshot["personalemail"],
    );
  }

  Map<String, dynamic> toJson() => {
        "address": address,
        "email": email,
        "personalemail": personalemail,
        "mobile": mobile,
        "name": name,
        "uid": uid,
        "id": id,
        "imageLink": image,
        'role': role,
        "dateofbirth": dateofbirth,

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
  String? id;
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
      this.id,
      this.image,
      this.dateofbirth,
      this.role});
  static Parent fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Parent(
      name: snapshot["username"],
      uid: snapshot["uid"],
      id: snapshot["id"],
      email: snapshot["email"],
      image: snapshot["imageLink"],
      dateofbirth: snapshot["dateofbirth"],
      mobile: snapshot["mobile"],
      personalemail: snapshot["personalemail"],
    );
  }

  Map<String, dynamic> toJson() => {
        "address": address,
        "email": email,
        "personalemail": personalemail,
        "mobile": mobile,
        "name": name,
        "uid": uid,
        "id":id,
        "imageLink": image,
        'role': role,
        "dateofdirth": dateofbirth
        //'services':services
      };
}
