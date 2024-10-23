import 'package:flutter/material.dart';
import 'package:music_app/utils/databasemanager.dart';
import 'package:music_app/utils/classes.dart';
import 'package:music_app/widgets/artist_widgets.dart';

class Wrapper{
  
  static Future<ListView> artistView() async{
    List<Artist> toRender = await DbManager.getArtists(null);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: toRender.length,
      itemBuilder: (BuildContext context, int index){
        return circleArtist(toRender[index].imageUrl.toString(), (){print('suca');});
      }
    );
  }
}