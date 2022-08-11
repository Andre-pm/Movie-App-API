import 'package:flutter/material.dart';

import '../movies/moviesPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return const MoviesPage();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade500,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.movie_filter_outlined,
              color: Colors.white,
              size: 150,
            ),
            Text(
              'Movies App',
              style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
