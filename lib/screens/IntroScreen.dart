import 'package:flutter/material.dart';
import 'package:mega_store/Fixtures/IntroSlidesData.dart';
import 'package:mega_store/screens/Authscreens/Login.dart';
import 'package:mega_store/widgets/ButtonWidget.dart';
import 'package:mega_store/widgets/IntroSlideTile.dart';
import 'package:velocity_x/velocity_x.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7.0),
      height: isCurrentPage ? 10 : 6,
      width: isCurrentPage ? 10 : 6,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: VStack([
          Container(
            height: size.height * 0.7,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: slidesData.length,
              itemBuilder: (context, index) {
                return IntroSlideTile(
                  size: size,
                  imageUrl: slidesData[index].imageUrl,
                  caption: slidesData[index].caption,
                );
              },
            ),
          ),
          VxBox(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < slidesData.length; i++)
                    currentIndex == i
                        ? pageIndexIndicator(true)
                        : pageIndexIndicator(false)
                ],
              ),
            ),
          ).height(25).width(size.width).white.make(),
          SizedBox(
            height: 15,
          ),
          "Continue as guest".text.black.make().centered(),
          SizedBox(
            height: 15,
          ),
          ButtonWidget(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            size: size,
            color: Colors.white,
            buttonText: "Login",
          ),
          ButtonWidget(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            size: size,
            color: Colors.black,
            buttonText: "Create Account",
          )
        ]).scrollVertical(),
      ),
    );
  }
}
