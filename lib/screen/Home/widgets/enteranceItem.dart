import 'package:flutter/material.dart';

class EnteranceItem extends StatelessWidget {
  EnteranceItem(this.items, this.page, {super.key});
  String items;
  StatefulWidget page;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        color: Color.fromARGB(255, 53, 60, 66),
        child: Center(
          child: Text(
            items,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
