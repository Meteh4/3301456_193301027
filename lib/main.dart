import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:preview_1/giris.dart';
import 'package:preview_1/secretnotes.dart';
import 'package:preview_1/remindersscreen.dart';
import 'package:iconly/iconly.dart';

import 'loginscreen.dart';
import 'registerscreen.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Tanıtım ekrani',
      debugShowCheckedModeBanner: false,
      home: const OnBoardingPage(),
      theme: ThemeData(primarySwatch: Colors.brown),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MyApp()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: const Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16, right: 16),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "",
          decoration: pageDecoration,
          bodyWidget: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xFFFEEAE6),
              border: Border.all(
                color: const Color(0xFF7D4F52),
              ),
            ),
            width: 400.0,
            height: 500.0,
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Center(
                      child: Text(
                        'Merhaba',
                        style: TextStyle(
                            color: Color(0xFF442B2D),
                            height: -6,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Text(
                        ' Bu uygulama Selçuk Üniversitesi Bilgisayar Mühendisliği Bölümünden Metehan Soydan isimli öğrenci tarafından yapılmıştır.',
                        style: TextStyle(
                            color: Color(0xFF7D4F52),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ]),
            ),
          ),
        ),
        PageViewModel(
          title: "",
          decoration: pageDecoration,
          bodyWidget: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xFFFEEAE6),
              border: Border.all(
                color: const Color(0xFF7D4F52),
              ),
            ),
            width: 400.0,
            height: 500.0,
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Center(
                      child: Text(
                        'Uygulamanın amacı',
                        style: TextStyle(
                            color: Color(0xFF442B2D),
                            height: -5,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Uygulama hoş bir arayüze sahip bir not tutma ve gizleme uygulamasıdır , uygulama henüz işlevsel değildir. Tanıtım ekranının sonundan itibaren uygulama ingilizce olacaktır',
                        style: TextStyle(
                            color: Color(0xFF7D4F52),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ]),
            ),
          ),
        ),
        PageViewModel(
          title: "",
          decoration: pageDecoration,
          bodyWidget: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xFFFEEAE6),
              border: Border.all(
                color: const Color(0xFF7D4F52),
              ),
            ),
            width: 400.0,
            height: 500.0,
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Center(
                      child: Text(
                        'Arayüz',
                        style: TextStyle(
                            color: Color(0xFF442B2D),
                            height: -5,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                        child: Text(
                      'Renkler , tasarım ve uygulamanın dizaynı tamamen benim fikrimdir , uygulama arayüzü çoğulukla material arayüzünü kullanmış olup gerekli yerlerde custom iconlar kullanılmıştır.',
                      style: TextStyle(
                          color: Color(0xFF7D4F52),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ))
                  ]),
            ),
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xFFFEEAE6),
              border: Border.all(
                color: const Color(0xFF7D4F52),
              ),
            ),
            width: 400.0,
            height: 500.0,
            child: Column(
              children: [
                const Text(
                  'You are Ready to Go',
                  style: TextStyle(
                      color: Color(0xFF442B2D),
                      fontSize: 25,
                      height: 3,
                      fontWeight: FontWeight.bold),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Color(0xFF7D4F52)),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFFEEAE6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Color(0xFF7D4F52)),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFFEEAE6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      back: const Icon(IconlyBold.arrow_left_square),
      next: const Icon(IconlyBold.arrow_right_square),
      done: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Color(0xFFFEEAE6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
