import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gallery_api_lab/view_image.dart';
import 'package:http/http.dart' as http;

class Gallery extends StatefulWidget{
  @override
  State<Gallery> createState() => _GalleryState();
}


class _GalleryState extends State<Gallery> {
  List<dynamic> photos = [];
  final int maxPhotostoShow = 24;



  @override
  void initState(){
    super.initState();
    getPhotos();
  }

  getPhotos() async{
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    var response = await http.get(url);

    setState(() {
      photos = json.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("API Gallery"),
      backgroundColor: Colors.cyan,
    ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0
          ),
          itemCount: maxPhotostoShow,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewImage(
                    url: photos[index]['url']
                  ))
                );

              },
              child: Card(
                  child: Image.network(
                      photos[index]['url'],
                      fit: BoxFit.cover
                  )
              ),
            );

          }
      )
    );
  }
}
  
