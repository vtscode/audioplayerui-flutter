import './song_model.dart';

class Playlists {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlists({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });

  static List<Playlists> playlists = [
    Playlists(
        title: "Hip-hop R&B Mix",
        songs: Song.song,
        imageUrl: "https://picsum.photos/221/111"),
    Playlists(
        title: "Rock & Roll",
        songs: Song.song,
        imageUrl: "https://picsum.photos/222/112"),
    Playlists(
        title: "Techno",
        songs: Song.song,
        imageUrl: "https://picsum.photos/223/113"),
  ];
}
