mixin AppAppis{
  static String endpoint= "https://softisan.xyz/api";
  static String endpointImg= "https://softisan.xyz/storage/";
  static String login= endpoint+"/login";
  static String register= endpoint+"/register";
  static String user= endpoint+"/user";
  static String getallproduct= endpoint+"/getallProducts";
  static String myexpartimag= "https://softisan.xyz/uploads/exparts/";
  static String profileimg= "https://softisan.xyz/uploads/profile/";

  // static String user= endpoint+"/user";

  static makeimgUrl(imgs)=>endpointImg+imgs;
  static String demoimg="https://fastly.picsum.photos/id/572/200/300.jpg?hmac=Rt4zD8IxoA-nMVDrBQ72mgbTVRfQ6OwW3MhWy_3lpdk";
 
  
}