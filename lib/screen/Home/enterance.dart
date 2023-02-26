
import 'package:dio_net/screen/Home/photos_page.dart';
import 'package:dio_net/screen/Home/users_page.dart';
import 'package:dio_net/screen/Home/widgets/enteranceItem.dart';
import 'package:flutter/material.dart';
import 'posts_page.dart';

class EnterancePage extends StatefulWidget {
  const EnterancePage({Key? key}) : super(key: key);

  @override
  State<EnterancePage> createState() => _EnterancePageState();
}

class _EnterancePageState extends State<EnterancePage> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 53, 60, 66),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.6,
                    child: ListWheelScrollView.useDelegate(
                      onSelectedItemChanged: (value) {
                        page = value;
                        print(value);
                      },
                      physics: FixedExtentScrollPhysics(),
                      diameterRatio: 1.7,
                      itemExtent: 70,
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 5,
                        builder: (context, index) {
                          return EnteranceItem(items[index], pages[page]);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0.5,
                    top: 92,
                    child: Icon(
                      Icons.arrow_left,
                      size: 60,
                      color: Colors.teal,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 150, right: 75, left: 75),
                    child: Divider(
                      thickness: 2,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              TextButton(
                child: Text(
                  'Go',
                  style: TextStyle(color: Colors.teal, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => pages[page]));
                },
              )
            ],
          ),
        ));
  }
}

List<String> items = [
  'Users',
  'Posts',
  'Comments',
  'Photos',
  'Albums',
];
List<StatefulWidget> pages = [
  UserPage(),
  HomePage(),
  PhotosPage(),
  HomePage(),
  PhotosPage(),
];
