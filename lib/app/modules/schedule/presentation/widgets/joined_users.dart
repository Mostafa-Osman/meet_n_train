import 'package:avatar_stack/avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/schedule_cubit.dart';

class JoinedUsers extends StatelessWidget {
  const JoinedUsers({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final scheduleCubit = BlocProvider.of<ScheduleCubit>(context);

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
          for (var n = 0;
              n < scheduleCubit.scheduleModel[index].joinedUsersCount;
              n++)
            const AssetImage(
              'assets/images/cat.jpg',
            ),
        ],
      ),
    );
  }
}
