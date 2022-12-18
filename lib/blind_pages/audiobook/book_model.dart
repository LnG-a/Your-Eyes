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
      title: "Gieo hạt giống yêu thương - Tập 1",
      author: "Robert Fulghum",
      url: 'hat_giong_yeu_thuong2.MP3',
      cover: 'assets/images/cover1.jpg',
    ),
    Book(
      title: "Gieo hạt giống yêu thương - Tập 2",
      author: "Robert Fulghum",
      url: 'hat_giong_yeu_thuong3.MP3',
      cover: 'assets/images/cover2.jpg',
    ),
    Book(
      title: "Gieo hạt giống yêu thương - Tập 3",
      author: "Robert Fulghum",
      url: 'hat_giong_yeu_thuong4.MP3',
      cover: 'assets/images/cover3.jpg',
    ),
    Book(
      title: "Gieo hạt giống yêu thương - Tập 4",
      author: "Robert Fulghum",
      url: 'hat_giong_yeu_thuong5.MP3',
      cover: 'assets/images/cover1.jpg',
    ),
    Book(
      title: "Gieo hạt giống yêu thương - Tập 5",
      author: "Robert Fulghum",
      url: 'hat_giong_yeu_thuong6.MP3',
      cover: 'assets/images/cover2.jpg',
    ),
  ];
}
