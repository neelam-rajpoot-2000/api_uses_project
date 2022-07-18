import 'package:api_uses_project/services/post_service_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HttpScreen extends StatefulWidget {
  const HttpScreen({Key? key}) : super(key: key);

  @override
  State<HttpScreen> createState() => _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen> {
  PostService postService= PostService();
  @override
  Widget build(BuildContext context) {
    var length;
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Crash'),
      ),
      body: SafeArea(
        child: FutureBuilder<List>(
          future: PostService.getPosts(),
          builder: (context,snapshot) {
            if (snapshot.hasData) {
              if(snapshot.data?.length == 0){
               return Center(
                  child: Text("No Text Available!"),
               );
             }
             return ListView.builder(
               itemCount: snapshot.data?.length,
                 itemBuilder: (context,index){
                 return ListTile(
                 title: Text(snapshot.data?[index]),
                 );

                 });

            }else if(snapshot.hasError){
              return Center(child:Text(snapshot.error.toString()) ,);

            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          }
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.edit
        ),
        onPressed: (){
          String title;
          String slug;
          String content;
          showDialog(context: context, builder: (context)=>AlertDialog(
            content:Form(
              child:Column(
                mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    labelText: 'Title'
                  ),
                  onChanged: (_val){
                    title=_val;
                  },
                ),
                SizedBox(height: 12,),
                TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      labelText: 'Content'
                  ),
                  onChanged: (_val){
                    content=_val;
                  },
                ),
                SizedBox(height: 12,),
                RaisedButton(onPressed: () {},

                  child: Text('Add'),
                ),
              ],
            ),
            ) ,
          ));
        },
      ),
    );
  }
}
