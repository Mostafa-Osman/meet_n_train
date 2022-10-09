import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_n_train/app/common/themes/app_colors.dart';
import 'package:meet_n_train/app/modules/schedule/presentation/cubit/schedule_cubit.dart';
import 'package:meet_n_train/app/modules/schedule/presentation/widgets/image_widget.dart';
import 'package:meet_n_train/app/modules/schedule/presentation/widgets/joined_users.dart';

class CustomCart extends StatelessWidget {
  const CustomCart({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final scheduleCubit = BlocProvider.of<ScheduleCubit>(context);
    return Card(
      elevation: 4.0,
      shadowColor: AppColors.greyShadeColor,
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        margin: const EdgeInsets.all(10.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageWidget(
              index: index,
            ),
            const SizedBox(height: 10.0),
            Text(
              scheduleCubit
                  .formatDate(scheduleCubit.scheduleModel[index].date,
                      'EEEE, dd MMMM yyyy . hh:mm a')
                  .toString(),
              style:  TextStyle(
                  fontSize: 10.0,
                  fontFamily: 'Poppins-semiBold',
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyColor),
            ),
            const SizedBox(height: 5.0),
            Text(
              scheduleCubit.scheduleModel[index].tag.title,
              style: const TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Poppins-semiBold',
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5.0),
            Text(
              scheduleCubit.scheduleModel[index].placeName,
              style:  TextStyle(
                  fontSize: 10.0,
                  fontFamily: 'Poppins-semiBold',
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyColor),
            ),
            Row(
              children: [
                Text(
                  '${scheduleCubit.scheduleModel[index].cancelledAt ?? index * 3} Days',
                  style: const TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Poppins-semiBold',
                      fontWeight: FontWeight.w500,
                      color:AppColors.mainColor),
                ),
                const Spacer(),
                if (scheduleCubit.scheduleModel[index].price.toInt() == 0)
                  const Icon(
                    Icons.monetization_on_outlined,
                    color: AppColors.mainColor,
                  ),
                if (scheduleCubit.scheduleModel[index].price.toInt() > 0)
                  const Icon(
                    Icons.credit_card,
                    color: AppColors.mainColor,
                  ),
                if (scheduleCubit.scheduleModel[index].price.toInt() > 0)
                  const Icon(
                    Icons.wallet,
                    color: AppColors.mainColor,
                  ),
                const SizedBox(width: 10.0),
              ],
            ),
            Row(
              children: [
                JoinedUsers(
                  index: index,
                ),
                const Spacer(),
                Text(
                  scheduleCubit.scheduleModel[index].price == 0
                      ? 'free'
                      : 'AED${scheduleCubit.scheduleModel[index].price}',
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Poppins-ExtraBold',
                      fontWeight: FontWeight.w800,
                      color: AppColors.mainColor),
                ),
                const SizedBox(width: 5.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
