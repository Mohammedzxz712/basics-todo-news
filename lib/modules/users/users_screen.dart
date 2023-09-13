import 'package:flutter/material.dart';
import '../../models/user/user_model.dart';

class UsersScreen extends StatelessWidget {
  List<UsersModel> users = [
    UsersModel(
      id: 1,
      name: 'Mohammed Abdullah',
      phone: '01553987674',
    ),
    UsersModel(
      id: 2,
      name: 'Kareem Abdullah',
      phone: '01113987674',
    ),
    UsersModel(
      id: 3,
      name: 'Ahmed Ali',
      phone: '0112237674',
    ),
    UsersModel(
      id: 4,
      name: 'Ali Ali',
      phone: '01234587674',
    ),
    UsersModel(
      id: 5,
      name: 'Yasser Ahmed',
      phone: '011111987674',
    ),
    UsersModel(
      id: 1,
      name: 'Mohammed Abdullah',
      phone: '01553987674',
    ),
    UsersModel(
      id: 1,
      name: 'Kareem Abdullah',
      phone: '01113987674',
    ),
    UsersModel(
      id: 1,
      name: 'Ahmed Ali',
      phone: '0112237674',
    ),
    UsersModel(
      id: 1,
      name: 'Ali Ali',
      phone: '01234587674',
    ),
    UsersModel(
      id: 1,
      name: 'Yasser Ahmed',
      phone: '011111987674',
    ),
  ];
  UsersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
            itemBuilder: (context, index) => buildUsers(users[index]),
            separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Container(
                    height: 1,
                    color: Colors.grey[400],
                  ),
                ),
            itemCount: users.length),
      ),
    );
  }

  Widget buildUsers(UsersModel user) => Row(
        children: [
          CircleAvatar(
            radius: 27,
            child: Text(
              '${user.id}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${user.phone}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      );
}
