import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '그\n림\n일\n기',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 100,
            ),
            Image.asset(
              'assets/logo/drawCard.png',
              width: 150,
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}
