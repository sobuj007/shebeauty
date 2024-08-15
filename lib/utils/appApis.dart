mixin AppAppis{
  static String endpoint= "https://softisan.xyz/api";
  static String endpointImg= "https://softisan.xyz/storage/";
  static String login= endpoint+"/login";
  static String register= endpoint+"/register";
  static String user= endpoint+"/user";
  static String getallproduct= endpoint+"/getallProducts";
  // static String user= endpoint+"/user";

  static makeimgUrl(imgs)=>endpointImg+imgs;
 
  
}