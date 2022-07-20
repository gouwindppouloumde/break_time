/// Cette page est la première sur laquelle arrive l'utilisateur qui n'est pas encore inscrit ou connecté
/// on y trouve les trois pageview qui introduisent l'application
/// elle conduit à la page d'inscription ou connexion

import 'package:break_time/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:break_time/views/my_material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AuthController extends StatefulWidget {
  const AuthController({Key? key}) : super(key: key);

  @override
  State<AuthController> createState() => _AuthControllerState();
}

class _AuthControllerState extends State<AuthController> {
  late PageController _pageController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 1.0,
    );
  }

  @override
  void didUpdateWidget(covariant AuthController oldWidget) {
    _pageController.dispose();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    final themeData = ThemeResolver.of(context).theme;
    final colorsData = ThemeResolver.of(context).colors;
    final sizesData = ThemeResolver.of(context).sizes;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
          builder: (context) => SafeArea(
                  child: PageView(
                controller: _pageController,
                children: [
                  Scaffold(
                    body: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PaddingWith(
                          top: 25,
                          widget: Image(image: chicsdames),
                        ),
                        PaddingWith(
                          top: 0.0,
                          left: 30,
                          right: 30,
                          widget: const Text(
                            "Bienvenu sur Break time",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 35.0,
                                height: 1.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        PaddingWith(
                          top: 0.0,
                          left: 30,
                          right: 30,
                          widget: const Text(
                            "Une application de rencontre pour partager un moment de compagnie autour d'un verre.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 20.0,
                                height: 1.2,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Flexible(
                            child: SmoothPageIndicator(
                                controller: _pageController,
                                count: 3,
                                effect: const ScaleEffect(
                                    activeDotColor: Colors.redAccent,
                                    dotWidth: 10,
                                    dotHeight: 10,
                                    scale: 1.8))),
                        PaddingWith(
                          bottom: 20.0,
                          widget: BtButton(
                              title: 'Suivant',
                              fontSize: 25,
                              height: 45,
                              width: deviceWidth - 30,
                              radius: 30.0,
                              onPressed: () {
                                index++;
                                _pageController.animateToPage(index,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.decelerate);
                              }),
                        ),
                      ],
                    )),
                  ),
                  Scaffold(
                    body: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PaddingWith(
                          top: 50,
                          widget: Image(image: aubar),
                        ),
                        PaddingWith(
                            left: 30,
                            right: 30,
                            widget: const Text(
                              "Rencontrez et partagez d'agréables instants avec des personnes ayant les mêmes centres d'intérêt que vous.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 20.0,
                                  height: 1.2,
                                  fontWeight: FontWeight.w400),
                            )),
                        Flexible(
                            child: SmoothPageIndicator(
                                controller: _pageController,
                                count: 3,
                                effect: const ScaleEffect(
                                    activeDotColor: Colors.redAccent,
                                    dotWidth: 10,
                                    dotHeight: 10,
                                    scale: 1.8))),
                        PaddingWith(
                          bottom: 20.0,
                          widget: BtButton(
                              title: 'Suivant',
                              fontSize: 25,
                              height: 45,
                              width: deviceWidth - 30,
                              radius: 30.0,
                              onPressed: () {
                                index++;
                                _pageController.animateToPage(index,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.decelerate);
                                index = 0;
                              }),
                        ),
                      ],
                    )),
                  ),
                  Scaffold(
                    body: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PaddingWith(
                          top: 50,
                          widget: Image(image: joueurs),
                        ),
                        PaddingWith(
                            left: 30,
                            right: 30,
                            widget: const Text(
                                'Partout où vous êtes, trouvez des amis repondant à vos critères, rencontrez-les et amusez-vous',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    fontSize: 20.0,
                                    height: 1.2,
                                    fontWeight: FontWeight.w400))),
                        Flexible(
                            child: SmoothPageIndicator(
                                controller: _pageController,
                                count: 3,
                                effect: const ScaleEffect(
                                    activeDotColor: Colors.redAccent,
                                    dotWidth: 10,
                                    dotHeight: 10,
                                    scale: 1.8))),
                        PaddingWith(
                          bottom: 20.0,
                          widget: BtButton(
                              title: 'Commencez',
                              fontSize: 25,
                              height: 45,
                              width: deviceWidth - 30,
                              radius: 30.0,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              }),
                        ),
                      ],
                    )),
                  ),
                ],
              ))),
    );
  }
}
