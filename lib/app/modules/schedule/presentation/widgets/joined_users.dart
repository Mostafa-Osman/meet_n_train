import 'package:avatar_stack/avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';

class JoinedUsers extends StatelessWidget {
  const JoinedUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: 20.0,
      child: AvatarStack(
        height: 50,
        settings: RestrictedAmountPositions(
          maxAmountItems: 5,
          maxCoverage: 0.1,
          minCoverage: 0.3,
        ),
        avatars: [
          for (var n = 0; n < 10; n++)
            const AssetImage(
              'assets/images/cat.jpg',
            ),
        ],
      ),
    );
  }
}
