import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      shadowColor: Colors.grey.shade300,
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
              style: const TextStyle(
                  fontSize: 10.0,
                  fontFamily: 'Poppins-semiBold',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
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
              style: const TextStyle(
                  fontSize: 10.0,
                  fontFamily: 'Poppins-semiBold',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            Row(
              children: [
                Text(
                  '${scheduleCubit.scheduleModel[index].cancelledAt ?? index * 3} Days',
                  style: const TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Poppins-semiBold',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFF5040)),
                ),
                const Spacer(),
                if (scheduleCubit.scheduleModel[index].price.toInt() == 0)
                  const Icon(
                    Icons.monetization_on_outlined,
                    color: Color(0xFFFF5040),
                  ),
                if (scheduleCubit.scheduleModel[index].price.toInt() > 0)
                  const Icon(
                    Icons.credit_card,
                    color: Color(0xFFFF5040),
                  ),
                if (scheduleCubit.scheduleModel[index].price.toInt() > 0)
                  const Icon(
                    Icons.wallet,
                    color: Color(0xFFFF5040),
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
                      color: Color(0xFFFF5040)),
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
