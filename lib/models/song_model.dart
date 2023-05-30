class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

  static List<Song> song = [
    Song(
      title: "Koman",
      description: "Raim Laode",
      url: "assets/music/music1.mp3",
      coverUrl: "assets/images/music1.jpg",
    ),
    Song(
      title: "Flower",
      description: "Jisoo - Flower",
      url: "assets/music/music2.mp3",
      coverUrl: "assets/images/music2.png",
    ),
    Song(
      title: "Cupid",
      description: "Fifty Fifty - Cupid",
      url: "assets/music/music3.mp3",
      coverUrl: "assets/images/music3.png",
    ),
  ];
}
