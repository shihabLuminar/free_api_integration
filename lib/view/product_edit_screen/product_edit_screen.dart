import 'package:flutter/material.dart';
import 'package:token_test/global_widgets/custom_textfield.dart';
import 'package:token_test/global_widgets/refactored_button.dart';

class ProductEditScreen extends StatelessWidget {
  ProductEditScreen();

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController stockController = TextEditingController();
    final TextEditingController categoryController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Edit Product")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: nameController,
              label: "Name",
            ),
            CustomTextField(
              controller: descriptionController,
              label: "Description",
            ),
            CustomTextField(
              controller: priceController,
              label: "Price",
            ),
            CustomTextField(
              controller: stockController,
              label: "Stock",
              keyboardType: TextInputType.number,
            ),
            CustomTextField(
              controller: categoryController,
              label: "Category",
            ),
            SizedBox(height: 20),
            RefactoredButton(
              label: "Save Changes",
              onTap: () {
                // Update product instance with edited details

                Navigator.pop(context); // Navigate back after editing product
              },
            ),
          ],
        ),
      ),
    );
  }
}
