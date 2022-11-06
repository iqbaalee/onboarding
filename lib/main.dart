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

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    String content = 'aaa';
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              child: PageView(
            onPageChanged: (value) {
              content = 'bbb';
              setState(() {});
            },
            children: [
              Container(
                height: height,
                width: width,
                color: Colors.red,
              ),
              Container(
                height: height,
                width: width,
                color: Colors.redAccent,
              ),
              Container(
                height: height,
                width: width,
                color: Colors.purple,
              ),
            ],
          )),
          Positioned(
            bottom: 0,
            child: Container(
              height: height * 0.5,
              width: width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
              child: Center(
                child: Text(content),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
