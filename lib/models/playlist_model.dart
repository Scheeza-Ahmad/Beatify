class PlaylistModel {
  final String images;
  final String arrNames;
  final String artist;
  final String song;

  PlaylistModel({
    required this.images,
    required this.arrNames,
    required this.artist,
    required this.song,
  });
}

// Playlist data
List<PlaylistModel> playlist = [
  PlaylistModel(
    images: 'assets/images/zarasa.png',
    arrNames: 'Zara sa',
    artist: 'Pritam, KK',
    song: 'assets/songs/zarasa.mp3',
  ),
  PlaylistModel(
    images: 'assets/images/mannmera.png',
    arrNames: 'Mann mera',
    artist: 'Gajendra Verma',
    song: 'assets/songs/maanmera.mp3',
  ),
  PlaylistModel(
    images: 'assets/images/dilibadat.png',
    arrNames: 'Dil Ibadat',
    artist: 'Pritam KK',
    song: 'assets/songs/dilibadat.mp3',
  ),
  PlaylistModel(
    images: 'assets/images/saiyara.png',
    arrNames: 'Saiyaara',
    artist: 'Faheem Abdullah',
    song: 'assets/songs/saiyara.mp3',
  ),
  PlaylistModel(
    images: 'assets/images/jhol.png',
    arrNames: 'Jhol',
    artist: 'Maanu, Annural Khalid',
    song: 'assets/songs/jhol.mp3',
  ),
  PlaylistModel(
    images: 'assets/images/afsoos.png',
    arrNames: 'Afsos',
    artist: 'Anuv Jain, AP Dhillon',
    song: 'assets/songs/afsoos.mp3',
  ),
  PlaylistModel(
    images: 'assets/images/haseen.png',
    arrNames: 'Haseen',
    artist: 'Talwinder, NDS Rippy Grewal',
    song: 'assets/songs/haseen.mp3',
  ),
];
