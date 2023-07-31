// database_service.dart

import 'package:cloud_firestore/cloud_firestore.dart'; // If using Firestore
import 'package:firebase_database/firebase_database.dart'; // If using Realtime Database
import '../models/song.dart'; // Importing your Song model


Future<void> addSong(Song song) {
  return FirebaseFirestore.instance.collection('songs').add({
    'title': song.title,
    'artist': song.artist,
    'album': song.album,
    'coverUrl': song.coverUrl,
    'audioUrl': song.audioUrl,
  });
}

Future<Song?> getSongById(String id) async {
  var doc = await FirebaseFirestore.instance.collection('songs').doc(id).get();
  if (doc.exists) {
    return Song(
      title: doc['title'],
      artist: doc['artist'],
      album: doc['album'],
      coverUrl: doc['coverUrl'],
      audioUrl: doc['audioUrl'],
    );
  }
  return null; // Return null if the document doesn't exist
}

Future<void> deleteSong(String id) {
  return FirebaseFirestore.instance.collection('songs').doc(id).delete();
}
