// mixin AppAppis {
//   static String endpoint = "https://softisan.xyz/api/";
//   static String endpointImg = "https://softisan.xyz/storage/";
//   static String login = endpoint + "login";
//   static String register = endpoint + "register";
//   static String user = endpoint + "user";
//   static String getallproduct = endpoint + "getallProducts";
//   static String myexpartimag = "https://softisan.xyz/uploads/exparts/";
//   static String profileimg = "https://softisan.xyz/uploads/profile/";
//   static String storecover = "https://softisan.xyz/uploads/storeImages/";
//   // static String user= endpoint+"/user";

//   static makeimgUrl(imgs) => 'https://softisan.xyz/api' + imgs;
//   static String demoimg =
//       "https://fastly.picsum.photos/id/572/200/300.jpg?hmac=Rt4zD8IxoA-nMVDrBQ72mgbTVRfQ6OwW3MhWy_3lpdk";
// }
mixin AppAppis {
  static String endpoint = "https://ghoreparlour.com/api/";
  static String endpointImg = "https://ghoreparlour.com/storage/";
  static String login = endpoint + "login";
  static String register = endpoint + "register";
  static String user = endpoint + "user";
  static String getallproduct = endpoint + "getallProducts";
  static String myexpartimag = "https://ghoreparlour.com/uploads/exparts/";
  static String myexpartCertificate =
      "https://ghoreparlour.com/uploads/expartscertificate/";
  static String profileimg = "https://ghoreparlour.com/uploads/profile/";
  static String storecover = "https://ghoreparlour.com/uploads/storeImages/";

  // static String user= endpoint+"/user";

  static makeimgUrl(imgs) => 'https://ghoreparlour.com/api' + imgs;
  static String demoimg =
      "https://fastly.picsum.photos/id/572/200/300.jpg?hmac=Rt4zD8IxoA-nMVDrBQ72mgbTVRfQ6OwW3MhWy_3lpdk";
}
