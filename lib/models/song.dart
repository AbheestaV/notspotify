class Song {
  final String title;
  final String artist;
  final String album;
  final String coverUrl;
  final String audioUrl;

  Song({
    required this.title,
    required this.artist,
    required this.album,
    required this.coverUrl,
    required this.audioUrl,
  });

  // Additional methods to convert to/from Firestore documents
}
