import 'package:flutter/material.dart';
import 'package:yildiz_motor_v2/backend/theme.dart';
import 'package:yildiz_motor_v2/widgets/custom_text_form_field.dart';
import 'package:yildiz_motor_v2/widgets/custom_button.dart';
import 'package:yildiz_motor_v2/widgets/custom_top_bar.dart';

import '../../backend/classes.dart';
import '../../backend/methods.dart';

class EditSupplierScreen extends StatefulWidget {
  const EditSupplierScreen({super.key});

  @override
  State<EditSupplierScreen> createState() => _EditSupplierScreenState();
}

class _EditSupplierScreenState extends State<EditSupplierScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  void initState() {
    nameController.text = editedItem[Supplier().name];
    phoneController.text = editedItem[Supplier().phone];
    addressController.text = editedItem[Supplier().address];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: YMColors().white,
      body: Column(
        children: [
          CustomTopBar(
            title: 'Tedarikçi Düzenle',
            leftButtonText: "Geri",
            leftButtonAction: () {
              Navigator.pushReplacementNamed(context, '/list_suppliers');
            },
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width / 3,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: YMColors().lightGrey,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                            "İsim",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontSize:
                                                  YMSizes().fontSizeMedium,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: CustomTextFormField(
                                            height: 50,
                                            hintText: "(Zorunlu)",
                                            controller: nameController,
                                            action: TextInputAction.next,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                            "Telefon",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontSize:
                                                  YMSizes().fontSizeMedium,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: CustomTextFormField(
                                            height: 50,
                                            controller: phoneController,
                                            action: TextInputAction.next,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                            "Adres",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontSize:
                                                  YMSizes().fontSizeMedium,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: CustomTextFormField(
                                            height: 50,
                                            controller: addressController,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: CustomButton(
                                  text: "Sil",
                                  onPressed: () {
                                    DatabaseService().deleteSupplier(
                                        editedItem[Supplier().id]);
                                    Navigator.pushReplacementNamed(
                                        context, "/list_suppliers");
                                  },
                                  bgColor: YMColors().red,
                                  textColor: YMColors().white,
                                  height: 50,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: CustomButton(
                                  text: "Kaydet",
                                  onPressed: () {
                                    if (nameController.text.isNotEmpty) {
                                      DatabaseService().updateSupplier({
                                        Supplier().id:
                                            editedItem[Supplier().id],
                                        Supplier().name:
                                            (nameController.text.isEmpty)
                                                ? null
                                                : nameController.text,
                                        Supplier().phone:
                                            (phoneController.text.isEmpty)
                                                ? null
                                                : phoneController.text,
                                        Supplier().address:
                                            (addressController.text.isEmpty)
                                                ? null
                                                : addressController.text,
                                      });
                                      Navigator.pushReplacementNamed(
                                          context, "/list_suppliers");
                                    }
                                  },
                                  bgColor: YMColors().blue,
                                  textColor: YMColors().white,
                                  height: 50,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
