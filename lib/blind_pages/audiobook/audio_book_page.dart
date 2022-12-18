import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:your_eyes/blind_pages/audiobook/book_model.dart';

class AudioBookPage extends StatefulWidget {
  final String title = "Sách nói";
  const AudioBookPage({Key? key}) : super(key: key);

  @override
  State<AudioBookPage> createState() => _AudioBookPageState();
}

class _AudioBookPageState extends State<AudioBookPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  int count = 0;
  Book book = Book.books[0];
  final player = AudioCache(prefix: 'assets/audio/');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    book = Book.books[0];
    setAudio();

    //Listen to states: play, pause, stop
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    // Listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    // Listen to audio position
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future setAudio() async {
    //Repeat book
    // audioPlayer.setReleaseMode(ReleaseMode.LOOP);

    // Load audio
    final url = await player.load(book.url);
    audioPlayer.setUrl(url.path, isLocal: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sách nói"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Expanded(
            child: GestureDetector(
              child: ClipRect(
                child: Image.asset(
                  book.cover,
                  fit: BoxFit.contain,
                ),
              ),
              onTap: () async {
                if (isPlaying) {
                  await audioPlayer.pause();
                } else {
                  await audioPlayer.resume();
                }
              },
              onLongPress: () {
                if (count == 5) return;
                count++;
                setState(() async {
                  book = Book.books[count];
                  await setAudio();
                });
              },
              onDoubleTap: () {
                if (count == 0) return;
                count--;
                setState(() async {
                  book = Book.books[count];
                  await setAudio();
                });
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            book.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            book.author,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Slider(
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
            activeColor: const Color(0xff7F3DFF),
            inactiveColor: const Color(0xffd4bdff),
            onChanged: (value) async {
              final position = Duration(seconds: value.toInt());
              await audioPlayer.seek(position);

              // Optional
              await audioPlayer.resume();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatTime(position)),
                Text(formatTime(duration - position)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  if (count == 0) return;
                  count--;
                  setState(() async {
                    book = Book.books[count];
                    await setAudio();
                  });
                },
                icon: const Icon(
                  Icons.skip_previous,
                ),
                iconSize: 50,
                color: const Color(0xff7F3DFF),
              ),
              CircleAvatar(
                backgroundColor: const Color(0xff7F3DFF),
                radius: 35,
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  iconSize: 50,
                  color: Colors.white,
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      await audioPlayer.resume();
                    }
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  if (count == 5) return;
                  count++;
                  setState(() async {
                    book = Book.books[count];
                    await setAudio();
                  });
                },
                icon: const Icon(
                  Icons.skip_next,
                ),
                iconSize: 50,
                color: const Color(0xff7F3DFF),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

String formatTime(Duration? duration) {
  if (duration == null) {
    return '--:--';
  } else {
    String minutes = duration.inMinutes.toString().padLeft(2, '0');
    String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
