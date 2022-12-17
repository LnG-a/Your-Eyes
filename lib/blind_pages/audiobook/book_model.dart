class Book {
  final String title;
  final String author;
  final String url;
  final String cover;

  Book(
      {required this.title,
      required this.author,
      required this.url,
      required this.cover});

  static final books = [
    Book(
      title: "Hạt giống yêu thương - tập 1",
      author: "Robert Fulghum",
      url: 'assets/audio/hat_giong_yeu_thuong2.MP3',
      cover: 'assets/images/cover1.jpg',
    ),
    Book(
      title: "Hạt giống yêu thương - tập 2",
      author: "Robert Fulghum",
      url: 'assets/audio/hat_giong_yeu_thuong3.MP3',
      cover: 'assets/images/cover2.jpg',
    ),
    Book(
      title: "Hạt giống yêu thương - tập 3",
      author: "Robert Fulghum",
      url: 'assets/audio/hat_giong_yeu_thuong4.MP3',
      cover: 'assets/images/cover3.jpg',
    ),
    Book(
      title: "Hạt giống yêu thương - tập 4",
      author: "Robert Fulghum",
      url: 'assets/audio/hat_giong_yeu_thuong5.MP3',
      cover: 'assets/images/cover1.jpg',
    ),
    Book(
      title: "Hạt giống yêu thương - tập 5",
      author: "Robert Fulghum",
      url: 'assets/audio/hat_giong_yeu_thuong6.MP3',
      cover: 'assets/images/cover2.jpg',
    ),
  ];
}
