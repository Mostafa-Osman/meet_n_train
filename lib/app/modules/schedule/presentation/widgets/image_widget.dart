import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/themes/app_colors.dart';
import '../../../../widgets/defaulr_text.dart';
import '../cubit/schedule_cubit.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final scheduleCubit = BlocProvider.of<ScheduleCubit>(context);

    return Stack(
      children: [
        Container(
          height: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: const DecorationImage(
                image: AssetImage('assets/images/cat.jpg'), fit: BoxFit.cover),
          ),
          //    NetworkImage(
          //                 'https:ik.imagekit.io/tnc8pizf9e/${scheduleCubit.scheduleModel[index].images[0].url}?tr=h-200',
          //               ),
        ),
        Positioned(
          top: 10.0,
          left: 10.0,
          child: Container(
              padding: const EdgeInsets.only(
                  right: 10.0, left: 10.0, bottom: 5.0, top: 5.0),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor2,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    radius: 12,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundImage:
                          // NetworkImage(
                          //   'https:ik.imagekit.io/tnc8pizf9e/${scheduleCubit.scheduleModel[index].tag.icon}',
                          // ),
                          AssetImage(
                        'assets/images/cat.jpg',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  DefaultText(
                    title: scheduleCubit.scheduleModel[index].community.title,
                    fontSize: 12.0,
                    fontFamily: 'Poppins-semiBold',
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
                color: AppColors.whiteColor2,
                borderRadius: BorderRadius.circular(20.0)),
            child: DefaultText(
              title: scheduleCubit.scheduleModel[index].spots == 0
                  ? 'unlimited'
                  : '${scheduleCubit.scheduleModel[index].spots} sport left',
              fontSize: 12.0,
              fontFamily: 'Poppins-semiBold',
              textColor: AppColors.mainColor,
            ),
          ),
        ),
      ],
    );
  }
}
