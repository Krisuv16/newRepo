import 'package:ambulance/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonCard extends StatelessWidget {
  final button;
  final String? title;
  const CustomButtonCard({
    Key? key,
    this.button,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 80,
      width: width * 0.29,
      child: Card(
        color: AppColors.cardBackground,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(18)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              button,
              color: AppColors.cardButtomColor,
            ),
            Text(
              title!,
              style: const TextStyle(color: AppColors.cardButtomColor),
            )
          ],
        ),
      ),
    );
  }
}
