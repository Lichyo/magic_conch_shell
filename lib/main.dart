import 'controller.dart';
import 'package:flutter/material.dart';
import 'painter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  Controller controller = Controller();
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'image/background.png',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Column(
              children: <Widget>[
                const SizedBox(
                  height: 200.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          'image/${controller.image}',
                          width: 300,
                        ),
                      ),
                      Image.asset('image/television.png'),
                    ],
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
                    },
                    onDragEnd: (value) {
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
