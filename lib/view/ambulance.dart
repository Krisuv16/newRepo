import 'package:ambulance/constants/colors.dart';
import 'package:ambulance/controller/ambulance.dart';
import 'package:ambulance/widgets/button_card.dart';
import 'package:ambulance/widgets/custom_sizedbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AmbulanceController ambulanceController = Get.find();

class Ambulance extends StatelessWidget {
  const Ambulance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Obx(() => ambulanceController.isloading.value == true
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.white))
                : mainBody(width, height)),
          ],
        ),
      ),
    );
  }

  Container mainBody(double width, double height) {
    return Container(
      width: width,
      decoration: const BoxDecoration(
          color: AppColors.secondaryBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          imageBody(height, width),
          const SizedBox(
            height: 30,
          ),
          Obx(
            () => CustomSizedBox(
              label: "Hospital Name",
              title: ambulanceController.user.value.name ?? "Loading..",
            ),
          ),
          Obx(
            () => CustomSizedBox(
                label: "Location",
                title: ambulanceController.user.value.address!.city ??
                    "Loading.."),
          ),
          Obx(
            () => CustomSizedBox(
              label: "Phone",
              title: ambulanceController.user.value.phone ?? "Loading..",
              sicon: const Icon(
                Icons.local_phone_outlined,
                color: AppColors.cardBackground,
              ),
            ),
          ),
          Obx(() => webSiteBox(width)),
          const CustomSizedBox(
            label: "Hours",
            title: "Open 5:30 PM",
          ),
          const CustomSizedBox(
            label: "Resting Hour",
            title: "Close 8:00 AM ",
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustomButtonCard(
                button: Icons.delete,
                title: "Delete",
              ),
              CustomButtonCard(
                button: Icons.upload_file_sharp,
                title: "Save",
              ),
              CustomButtonCard(
                button: Icons.message,
                title: "Message",
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                "Cancel",
                style: TextStyle(color: AppColors.cardButtomColor),
              )),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Obx imageBody(double height, double width) {
    return Obx(() => ambulanceController.isImageLoading.value == true
        ? const CircularProgressIndicator()
        : Container(
            height: height * 0.15,
            width: width * 0.34,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: NetworkImage(ambulanceController.image.value.url!),
                fit: BoxFit.cover,
              ),
            ),
          ));
  }

  SizedBox webSiteBox(double width) {
    return SizedBox(
      height: 70,
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 5,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    child:
                        Text("Website", style: TextStyle(color: Colors.grey)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Text(
                        ambulanceController.user.value.website ?? "Loading..",
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5)),
                  ),
                ],
              ),
              const Spacer(),
              const Padding(
                  padding: EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Icon(
                    Icons.arrow_forward,
                    color: AppColors.cardBackground,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.primaryBackground,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: const [
            Icon(Icons.arrow_back_ios, color: Colors.white),
            Text(
              "Ambulance",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      leadingWidth: 300,
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.filter_list_rounded, color: Colors.white),
        )
      ],
    );
  }
}
