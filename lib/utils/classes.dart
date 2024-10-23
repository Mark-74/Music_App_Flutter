//This file contains the classes to parse objects from the database

class Song{

  final String title;
  final String artist;
  final Uri url;
  final Uri? imageUrl;

  Song(this.title, this.artist, this.url, this.imageUrl);

  Map<String, String> toMap(){
    return {
      'title': title,
      'artist': artist,
      'url': url.toString(),
      'imageUrl': imageUrl != null ? imageUrl.toString() : ''
    };
  }

  @override
  String toString(){
    return '$title - $artist url: $url image: $url';
  }
}

class Playlist{

  final String title;
  final String artist;
  final Uri url;
  final Uri? imageUrl;

  Playlist(this.title, this.artist, this.url, this.imageUrl);

  Map<String, String> toMap(){
    return {
      'title': title,
      'artist': artist,
      'url': url.toString(),
      'imageUrl': imageUrl != null ? imageUrl.toString() : ''
    };
  }
}

class UserPlaylist{

  final List<Song> songs;
  final String title;
  final Uri? imageUrl;

  UserPlaylist(this.songs, this.title, this.imageUrl);

  Map<String, String> toMap(){
    return {
      'title': title,
      'imageUrl': imageUrl != null ? imageUrl.toString() : ''
    };
  }
}

class Artist{
  final String name;
  final Uri? imageUrl;

  Artist(this.name, this.imageUrl);

  Map<String, String> toMap(){
    return {
      'name': name,
      'imageUrl': imageUrl != null ? imageUrl.toString() : ''
    };
  }
}