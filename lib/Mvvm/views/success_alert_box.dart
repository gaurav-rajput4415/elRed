import 'package:elred_assignment/Mvvm/views/name_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccessBox extends StatelessWidget {
  var context;

   SuccessBox({super.key,  this.context});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        child: Column(
          children: [
            AlertDialog(
              title: Text('Success'),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[200], // Background color
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NameScreen()));
                  },
                  child: const Text(
                    'okay', style: TextStyle(color: Colors.black, fontSize: 18),), // trying to move to the bottom
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
