import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        //custom_paint
        child: CustomPaint(
          painter: MyPainter(),
          size: const Size(300.0, 400.0),
        ),
      ),
    );
  }
}

//the class for customPaint

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //this is my pen --start
    Paint paint = Paint();
    paint.strokeJoin = StrokeJoin.round;
    paint.color = Colors.blue;
    paint.strokeWidth = 5;
    paint.style = PaintingStyle.fill;
    //this is my pen -- end

    //this is my pen2 --start
    Paint paint2 = Paint();
    paint2.strokeJoin = StrokeJoin.round;
    paint2.color = Colors.red;
    paint2.strokeWidth = 5;
    paint2.style = PaintingStyle.fill;
    //this is my pen2 -- end

    //this is my pen3 --start
    Paint paint3 = Paint();
    paint3.strokeJoin = StrokeJoin.miter;
    paint3.color = Colors.green;
    paint3.strokeWidth = 20;
    paint3.style = PaintingStyle.stroke;
    //this is my pen3 -- end

    //start and end point with offset
    Offset start = Offset(35.0, size.height / 2);
    Offset end = Offset(size.width, size.height / 5);

    //  (draw).........

    //draw line
    canvas.drawLine(start, end, paint3);

    //use path --start
    Path path = Path();
    Path path2 = Path();

    //start and end point in path(path 1 )
    path.moveTo(30, size.height / 2);

    path.lineTo(0.0, 10);
    path.lineTo(10.0, 10);
    path.lineTo(size.width, size.height);
    path.lineTo(30.0, 200);

    //draw a circle with path (path 2)
    path2.addOval(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: 40.0,
      ),
    );

    //final draw with path
    canvas.drawPath(path2, paint2);
    canvas.drawPath(path, paint);

    path.close();

    //use path --end
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
