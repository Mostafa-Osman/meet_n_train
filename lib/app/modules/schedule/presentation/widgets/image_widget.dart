import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                  image: AssetImage('assets/images/cat.jpg'),
                  fit: BoxFit.cover
              ),
        ),
        ),

        Positioned(
          top: 10.0,
          left: 10.0,
          child: Container(
              padding: const EdgeInsets.only(
                  right: 10.0, left: 10.0, bottom: 5.0, top: 5.0),
              decoration: BoxDecoration(
                  color: const Color(0xFFE1D9DC),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 12,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage( 'assets/images/cat.jpg',),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Volley Ball',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Poppins-semiBold',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )),
        ),
        Positioned(
          bottom: 10.0,
          left: 10.0,
          child: Container(
              padding: const EdgeInsets.only(
                  right: 10.0, left: 10.0, bottom: 5.0, top: 5.0),
              decoration: BoxDecoration(
                  color: const Color(0xFFE1D9DC),
                  borderRadius: BorderRadius.circular(20.0)),
              child: const Text(
                '8 sport left',
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'Poppins-semiBold',
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFF5040),
                ),
              )),
        ),
      ],
    );
  }
}
