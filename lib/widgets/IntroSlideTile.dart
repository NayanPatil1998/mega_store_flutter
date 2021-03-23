import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class IntroSlideTile extends StatelessWidget {
  const IntroSlideTile({
    Key key,
    @required this.size,
    this.caption,
    this.imageUrl,
  }) : super(key: key);

  final Size size;
  final String caption;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ZStack(
      [
        VxBox(
            child: Image(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        )).height(size.height * 0.7).width(size.width).red100.make(),
        VxBox(
          child: Column(
            children: [
              "Mega Store"
                  .text
                  .center
                  .xl5
                  .textStyle(GoogleFonts.dmSerifText())
                  .black
                  .make()
                  .centered(),
              caption.text.bold.xl3.black.center.make().centered()
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        )
            .padding(
              EdgeInsets.symmetric(vertical: 45),
            )
            .height(size.height * 0.7)
            .width(size.width)
            .withGradient(
              LinearGradient(
                  colors: [Colors.grey.withOpacity(0.0), Colors.white],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter),
            )
            .make(),
      ],
    );
  }
}
