import 'package:dio_net/screen/Home/widgets/user_item.dart';
import 'package:dio_net/service/user_service/user_service.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: FutureBuilder(
          future: GetUserService.getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: userItem(context, snapshot.data![index], () {}),
                  );
                },
              );
            } else {
              return Center(
                child: Text('No users'),
              );
            }
          },
        ),
      ),
    );
  }
}
