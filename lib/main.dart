import 'package:flutter/material.dart';
import 'package:transition_anim/animation_controller.dart';
import 'package:transition_anim/transition_animation_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Transition animation widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  bool home = true;
  late TransitionAnimationController animationController;

  @override
  void initState() {
    animationController = TransitionAnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: home
          ? Container(
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TransitionAnim(
                    animationController: animationController,
                    order: 1,
                    child: const Text(
                      'Hello !',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  TransitionAnim(
                    animationController: animationController,
                    order: 2,
                    child: const Text('Flutter',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 22)),
                  ),
                ],
              ))
          : Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          animationController.toggle(onAnimationEnd: () {
            if (!mounted) {
              return;
            }
            setState(() {
              home = !home;
            });
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
