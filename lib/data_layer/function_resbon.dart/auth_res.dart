// ignore_for_file: file_names

// loginRes(String email, String pass) async {
//   Curd curd = Curd();
//   var respons = await curd.postrequest(
//     APiMange.login,
//     {
//       "email": email,
//       "password": pass,
//     },
//     encode: true,
//     myheadersres: myheaders,
//   );
//   return respons;
// }
import 'package:real_easte_app/data_layer/database/connectdatabase.dart';
import 'package:real_easte_app/presentation_layer/resources/msnge_api.dart';

LogOutRes() async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    APiMange.logout,
    {},
    encode: true,
    myheadersres: myheaders,
  );
  print(respons);
  return respons;
}

ChangepassRes(oldpass, newpass, newpassConfirm) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    APiMange.changePassword,
    {
      "old_password": oldpass,
      "new_password": newpass,
      "new_password_confirmation": newpassConfirm
    },
    encode: true,
    myheadersres: myheaders,
  );
  print(respons);
  return respons;
}

userDataResp() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.userData,
    encode: true,
    myheadersres: myheaders,
  );
  print(respons);
  return respons;
}

ChangeUserDataRes(String name, String country, String phone) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    APiMange.changeuserData,
    {"name": name, "country": country, "phone": phone},
    encode: true,
    myheadersres: myheaders,
  );

  return respons;
}
