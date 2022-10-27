import 'package:crypto_app_pi/main.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class introduction extends StatefulWidget {
  const introduction({Key? key}) : super(key: key);

  @override
  State<introduction> createState() => _introductionState();
}

class _introductionState extends State<introduction> {
  @override
  Widget build(BuildContext context) {
    const pageDecoration = const PageDecoration(
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 28,
            fontFamily: 'poppins'),
        bodyTextStyle:
            TextStyle(color: Colors.black, fontSize: 19, fontFamily: 'poppins'),
        bodyPadding: EdgeInsets.all(16));
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: 'Welcome to Cryptocurrency Tracking Price App',
          body:
              'You can track the price of cryptocurrency with livestreaming data price',
          image: Image.network(
            'https://img.freepik.com/free-vector/gradient-cryptocurrency-concept-with-wallet_23-2149154182.jpg?w=740&t=st=1666880340~exp=1666880940~hmac=e24b065518837b5a8f6ee67d6cad0393a530b04a18e7757dfe2f102682f1f3dc',
            width: 350,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Discover Your Coin',
          body: 'Discover your favorite coin, we offer up to 100 coins ',
          image: Image.network(
              'https://static.vecteezy.com/system/resources/previews/005/927/058/non_2x/tron-icon-crypto-free-vector.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'News',
          body: 'You can find news about Cryptocurrency with up to date  news',
          image: Image.network(
              'https://img.freepik.com/free-vector/attention-attraction-important-announcement-warning-information-sharing-latest-news-loudspeaker-megaphone-bullhorn-with-exclamation-mark-vector-isolated-concept-metaphor-illustration_335657-2809.jpg?w=740&t=st=1666879643~exp=1666880243~hmac=3bab199814f19b036708f1e16c89e63e1b5abd6301d4a109173eacca63d39cc3'),
          decoration: pageDecoration,
        )
      ],
      onDone: () {
        Navigator.push(context, MaterialPageRoute(builder: (c) => mainPage()));
      },
      showSkipButton: true,
      showNextButton: true,
      showDoneButton: true,
      showBackButton: false,
      back: Icon(Icons.arrow_back),
      skip: Text(
        'Skip',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      next: Icon(Icons.arrow_forward),
      done: Text(
        'Get Started',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      dotsDecorator: DotsDecorator(
        size: Size(10, 10),
        color: Colors.grey,
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
      ),
    );
  }
}
