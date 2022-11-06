import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Onboarding(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              _controller.forward();
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: PageView(),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(15),
        child: SizedBox(
          height: kToolbarHeight + 20,
          width: 10,
          // decoration: BoxDecoration(
          //   color: Colors.black,
          //   borderRadius: BorderRadius.circular(10),
          // ),
          child: Center(
            child: Stack(
              children: [
                Positioned(
                  child: SizedBox.fromSize(
                    size: const Size(55, 55),
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.transparent,
                      value: _controller.value,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.purple),
                      strokeWidth: 2.5,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: Container(
                    width: 45,
                    height: 45,
                    padding: const EdgeInsets.all(5),
                    child: GestureDetector(
                      onTapDown: (_) {
                        _controller.value += .25;
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
