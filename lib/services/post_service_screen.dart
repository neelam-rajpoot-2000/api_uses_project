import 'dart:convert';

import 'package:http/http.dart' as http;

class PostService {
 static String baseUrl = 'https://reqres.in/api/user?page=2';
  static Future<List> getPosts() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        //services error
        return Future.error('Server Error!');
      }
    } catch(SocketException) {
      //fetching error
      return Future.error('Error Fetching Data!');
    }
  }

 Future<String> createPost(Map<String,dynamic> data) async{
    try{
      var response = await http.post(Uri.parse("$baseUrl/create"),
        body: jsonEncode(data),
        headers: {
        "Content-Type":"application/json ; charset=Utf-8"     }
      );
      if(response.statusCode==200){
        print(response.body);
        return "SUCCESS";
      }else{
        return "ERROR";
      }
 }catch(SocketException){
      return "ERROR";
    }
    }


 Future<String> deletePost(Map<String,dynamic> data) async{
   try{
     var response = await http.delete(Uri.parse("$baseUrl/delete"),
         body: jsonEncode(data),
         headers: {
           "Content-Type":"application/json ; charset=Utf-8"     }
     );
     if(response.statusCode==200){
       print(response.body);
       return "SUCCESS";
     }else{
       return "ERROR";
     }
   }catch(SocketException){
     return "ERROR";
   }
 }
}
