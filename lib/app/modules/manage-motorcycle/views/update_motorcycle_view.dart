import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/controllers/read_motorcycle_controller.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/models/motorcycle.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/views/manage_motorcycle_view.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/views/update_motorcycle_detail_view.dart';
import 'package:rentalin_id/app/widgets/app_bar.components.dart';
import 'package:rentalin_id/app/widgets/button_main.components.dart';
import 'package:rentalin_id/app/widgets/input_text_noicon.components.dart';

class UpdateMotorcycleView extends StatelessWidget {
  final merkMotorController = TextEditingController();
  final motorNameController = TextEditingController();
  final typeMotorController = TextEditingController();
  final platMotorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String motorcycleId = Get.arguments['motorcycleId'] ?? 'Uknown Id';
    print(motorcycleId);
    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: tdBg,
          toolbarHeight: 80,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: const AppBarComponents(
            nameMenu: 'Update Motorcycle',
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 23, right: 23),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Motor Picture",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: tdBlue,
                  ),
                ),
                SizedBox(
                    width: 380,
                    height: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tdWhite,
                        foregroundColor: tdWhite,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: tdBlue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/icon/image-plus.png",
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InputTextNoIcon(
                labelText: "Merk Motor",
                hintText: "Honda",
                controller: merkMotorController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InputTextNoIcon(
                labelText: "Motor Name",
                hintText: "PCX",
                controller: motorNameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InputTextNoIcon(
                labelText: "Type Motor",
                hintText: "Matic",
                controller: typeMotorController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InputTextNoIcon(
                labelText: "Plat Motor",
                hintText: "KH 1213 WH",
                controller: platMotorController,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: ButtonMainComponents(
                  buttonName: "Next",
                  nextPage: () {
                    Motorcycle motorcycle = Motorcycle(
                      merkMotor: merkMotorController.text,
                      motorName: motorNameController.text,
                      typeMotor: typeMotorController.text,
                      platMotor: platMotorController.text,
                      pricePerDay: 0.0, // Default value
                      isRecommended: false, // Default value
                    );
                    Get.to(UpdateMotorcycleDetailView(), arguments: {
                      'motorcycleId': motorcycleId,
                      'motorcycle': motorcycle,
                    });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
