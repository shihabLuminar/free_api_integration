import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:token_test/controller/home_screen_controller.dart';
import 'package:token_test/view/login_screen/login_screen.dart';
import 'package:token_test/view/product_add_screen/product_adding_screen.dart';
import 'package:token_test/view/product_edit_screen/product_edit_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<HomeScreenController>().getProducts();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text("product name"),
              subtitle: Text("product description"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      // Navigate to ProductEditScreen and await the updated product
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductEditScreen(),
                          ));
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to ProductAddScreen and await the result
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductAddScreen()),
          );
        },
        child: Icon(Icons.add),
        tooltip: "Add Product",
        backgroundColor: Colors.green,
      ),
    );
  }
}
