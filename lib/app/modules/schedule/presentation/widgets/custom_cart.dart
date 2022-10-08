import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_n_train/app/modules/schedule/presentation/cubit/schedule_cubit.dart';
import 'package:meet_n_train/app/modules/schedule/presentation/widgets/image_widget.dart';
import 'package:meet_n_train/app/modules/schedule/presentation/widgets/joined_users.dart';

class CustomCart extends StatelessWidget {
  const CustomCart({Key? key}) : super(key: key);

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
            const ImageWidget(),
            const SizedBox(height: 10.0),
            Text(
              //todo ظبط التايم زي اللي ف الصوره
              '${scheduleCubit.scheduleModel[0].date}',
              //'sunday,13 Nov 2022 . 3:17 pm',
              style: const TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'Poppins-semiBold',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            const SizedBox(height: 5.0),
            const Text(
              'All Payments',
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Poppins-semiBold',
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5.0),
             Text(
              '${scheduleCubit.scheduleModel[0].placeName}',
              style: const TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'Poppins-semiBold',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            Row(
              children:  [
                Text(
                  '${scheduleCubit.scheduleModel[0].finishDate}',
                  style: const TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Poppins-semiBold',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFF5040)),
                ),
                const Spacer(),
                const Icon(
                  Icons.monetization_on_outlined,
                  color: Color(0xFFFF5040),
                ),
                const Icon(
                  Icons.credit_card,
                  color: Color(0xFFFF5040),
                ),
                const Icon(
                  Icons.wallet,
                  color: Color(0xFFFF5040),
                ),
              ],
            ),
            Row(
              children: const [
                JoinedUsers(),
                Spacer(),
                Text(
                  'AED${100.0}',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Poppins-ExtraBold',
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFFF5040)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
