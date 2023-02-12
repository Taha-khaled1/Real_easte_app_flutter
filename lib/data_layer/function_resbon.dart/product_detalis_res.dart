// // ignore_for_file: file_names


// getProductDetalisRespon(int idproduct) async {
//   Curd curd = Curd();
//   var respons = await curd.getrequest(
//     '${APiMange.productdetalis}/$idproduct',
//   );
//   print(respons);
//   return respons;
// }

// addCartRespon(String userId, String productId, String quantity) async {
//   Curd curd = Curd();
//   var respons = await curd.postrequest(
//     APiMange.gteAddCartList,
//     {
//       'user_id': userId,
//       'id': productId, //productId
//       "quantity": quantity,
//       "variant": "",
//     },
//     encode: true,
//     myheadersres: myheaders2,
//   );
//   return respons;
// }
