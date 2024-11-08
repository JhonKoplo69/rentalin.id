import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/models/motorcycle.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/views/manage_motorcycle_view.dart';
import 'package:rentalin_id/app/widgets/app_bar.components.dart';
import 'package:rentalin_id/app/widgets/button_main.components.dart';
import '../controllers/update_motorcyle_controller.dart';
import 'package:rentalin_id/app/widgets/input_text_noicon.components.dart';

class UpdateMotorcycleDetailView extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Initialize the controller here
  final UpdateMotorcycleController controller = Get.put(UpdateMotorcycleController());

  @override
  Widget build(BuildContext context) {
    final motorcycle = Get.arguments['motorcycle'] as Motorcycle; // Ambil 'motorcycle' dari map
    final String motorcycleId = Get.arguments['motorcycleId'] ?? 'Unknown Id';


    // Initialize the controller's motorcycle value with data from `motorcycle`
    controller.motorcycle.value = motorcycle;
    print('Motorcycle ID: ${motorcycle.id}');
    print('Motorcycle ID: ${motorcycleId}');
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: tdBg,
        toolbarHeight: 80,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const AppBarComponents(
          nameMenu: 'Update Motorcycle Details',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 23, right: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display the details
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: tdGrey),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              width: 345,
              height: 217,
              margin: EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Merk Motor: ${motorcycle.merkMotor}"),
                      Text("Motor Name: ${motorcycle.motorName}"),
                      Text("Type Motor: ${motorcycle.typeMotor}"),
                      Text("Plat Motor: ${motorcycle.platMotor}"),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                        () => Checkbox(
                      value: controller.motorcycle.value.isRecommended,
                      onChanged: (value) {
                        controller.motorcycle.value.isRecommended = value ?? false;
                      },
                    ),
                  ),
                  const Text('Recommended'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: InputTextNoIcon(
                labelText: "Price/Day",
                hintText: "Rp. 150.000",
                onChanged: (value) {
                  double? price = double.tryParse(value);
                  if (price != null) {
                    controller.motorcycle.value.pricePerDay = price;
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // "Go Back" button with fixed size
                SizedBox(
                  width: 163,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: tdBlue,
                      backgroundColor: Colors.white,
                      side: BorderSide(color: tdBlue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Go Back',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                // "Update" button with fixed size
                SizedBox(
                  width: 163,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      CollectionReference motorCollection = firestore.collection("Manage MotorCycle");
                      await motorCollection.doc(motorcycleId).update({
                        'Merk Motor': controller.motorcycle.value.merkMotor,
                        'Motor Name': controller.motorcycle.value.motorName,
                        'Plat Motor': controller.motorcycle.value.platMotor,
                        'PricePerDay': controller.motorcycle.value.pricePerDay,
                        'Recommendation': controller.motorcycle.value.isRecommended,
                        'Type Motor': controller.motorcycle.value.typeMotor
                      });
                      Get.off(ManageMotorcycleView());
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: tdgreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
