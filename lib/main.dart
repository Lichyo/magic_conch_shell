import 'controller.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Controller controller = Controller();
  late final AudioPlayer player;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player = AudioPlayer();
    AudioSource audioSource = AudioSource.asset('');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'image/background.png',
              fit: BoxFit.fill,
              opacity: const AlwaysStoppedAnimation(0.85),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Column(
              children: <Widget>[
                const SizedBox(
                  height: 200.0,
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Image.asset(
                    'image/${controller.image}',
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                Transform.rotate(
                  angle: 180 / 3.14,
                  child: Draggable(
                    onDragStarted: () {
                      controller.getAnswer();
                      player.setAudioSource(AudioSource.asset('audio/${controller.answer}.m4a'));
                    },
                    onDragEnd: (value) {
                      player.play();
                      setState(() {});
                    },
                    feedback: Image.asset(
                      'image/tab.png',
                      width: 200,
                    ),
                    childWhenDragging: Image.asset(
                      'image/shell.png',
                      width: 200,
                    ),
                    child: Image.asset(
                      'image/origin_shell.png',
                      width: 200,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
