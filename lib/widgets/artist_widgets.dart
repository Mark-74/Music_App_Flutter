import 'package:flutter/material.dart';

Widget circleArtist(String url, Function() onPressed) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      elevation: 8,
      shape: const CircleBorder(),    
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.transparent),
            shape: BoxShape.circle  
          ),
          child: Ink.image(
            image: NetworkImage(url),
            height: 100,
            width: 100,     
            fit: BoxFit.cover,    
            ),
        )
      ),
    ),
  );
    
}

Widget squareArtist(String url, Function() onPressed){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(28),    
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.transparent),
            shape: BoxShape.circle  
          ),
          child: Ink.image(
            image: NetworkImage(url),
            height: 100,
            width: 100,     
            fit: BoxFit.cover,    
            ),
        )
      ),
    ),
  );
}