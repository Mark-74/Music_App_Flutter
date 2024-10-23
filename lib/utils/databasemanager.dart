/*
This file contains the Database class, it contains static methods to access the database.
The wrapping of the sqflite package was made to make it easier to use in the pages.
*/
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:music_app/utils/classes.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbManager{

  static Database? db;

  //must be called before using the other functions
  static Future<void> init() async{
    
    db = await openDatabase(
      join(await getDatabasesPath(), 'database.db'),
      onCreate: (db, version) async{
        //the Songs table contains all the saved songs from the user
        await db.execute(
          'CREATE TABLE IF NOT EXISTS songs(id AUTO_INCREMENT, title TEXT, artist TEXT, url TEXT, imageUrl TEXT)'
          );
        
        //the playlists table contains all the saved playlists from the user
        await db.execute(
          'CREATE TABLE IF NOT EXISTS playlists(id AUTO_INCREMENT, title TEXT, url TEXT, imageUrl TEXT)'
        );

        //the table UserPlaylists contains all the playlists created from the user
        await db.execute(
          'CREATE TABLE IF NOT EXISTS userPlaylists(id AUTO_INCREMENT, title TEXT, imageUrl TEXT)'
        );

        //the table songs-playlist references a song to a user-made playlist
        await db.execute(
          'CREATE TABLE IF NOT EXISTS songsToPlaylists(id AUTO_INCREMENT, song_id INT, playlist_id INT)'
        );

        //the artists table contains all the artists saved by the user
        await db.execute(
          'CREATE TABLE IF NOT EXISTS artists(id AUTO_INCREMENT, name TEXT, imageUrl TEXT)'
        );
      },
      version: 1
    );
  }

  //////////////////////////////// SONGS TABLE ////////////////////////////////

  static Future<List<Song>> getAllSongs() async{
    List<Map<String, Object?>> results = await db!.query('songs',);

    List<Song> output = [];

    for(var line in results){
      output.add(Song(
        line['title'] as String,
        line['artist'] as String,
        Uri.parse(line['url'] as String),
        Uri.parse(line['imageUrl'] as String)
        )
      );
    }

    return output;
  }

  static Future<List<Song>> searchSong(String query) async{
    List<Map<String, Object?>> results = await db!.query(
      'songs',
      where: 'title = ?',
      whereArgs: [query]
      );

    List<Song> output = [];

    for(var line in results){
      output.add(Song(
        line['title'] as String,
        line['artist'] as String,
        Uri.parse(line['url'] as String),
        Uri.parse(line['imageUrl'] as String)
        )
      );
    }

    return output;
  }

  static Future<List<Song>> getLimitedSongs(int limit) async{
    List<Map<String, Object?>> results = await db!.query(
      'songs',
      limit: limit
      );

    List<Song> output = [];

    for(var line in results){
      output.add(Song(
        line['title'] as String,
        line['artist'] as String,
        Uri.parse(line['url'] as String),
        Uri.parse(line['imageUrl'] as String)
        )
      );
    }

    return output;
  }

  static Future<void> addSong(Song song) async{
    await db!.insert(
      'songs',
      song.toMap()
      );
  }

  static Future<void> removeSong(String title, String artist) async{
    await db!.delete(
      'songs',
      where: 'title = ? AND artist = ?',
      whereArgs: [title, artist]
    );
  }

  //////////////////////////////// ARTISTS TABLE ////////////////////////////////
  
  static Future<List<Artist>> getArtists(int? limit) async{
    List<Map<String, Object?>> results = limit != null ? await db!.query('artists', limit: limit) : await db!.query('artists');

    List<Artist> output = [];
    for(var line in results){
      output.add(Artist(
        line['name'] as String,
        Uri.parse(line['imageUrl'] as String)
      ));
    }

    return output;
  }

  static Future<void> addArtist(Artist artist) async{
    print(getAllSongs());
    await db!.insert(
      'artists',
      artist.toMap()
    );
  }

  static Future<void> removeArtist(String name) async{
    await db!.delete(
      'artists',
      where: 'name = ?',
      whereArgs: [name]
    );
  }

  static Future<List<Artist>> searchArtist(String query) async{
    List<Map<String, Object?>> results = await db!.query(
      'artists',
      where: 'name = ?',
      whereArgs: [query]);

    List<Artist> output = [];
    for(var line in results){
      output.add(Artist(
        line['name'] as String,
        Uri.parse(line['imageUrl'] as String)
      ));
    }

    return output;
  }
}