
import 'package:dio_net/model/users_model.dart';
import 'package:flutter/material.dart';

Widget userItem(BuildContext context, Users user, void Function() edit) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        user.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            fontWeight: FontWeight.w700, fontSize: 24, color: Colors.black),
      ),
      const SizedBox(
        height: 5,
      ),
      Row(
        children: [
          Expanded(
            child: Text(
              user.email,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.black38),
            ),
          ),
          Column(
            children: [
              IconButton(onPressed: edit, icon: const Icon(Icons.edit)),
              const SizedBox(
                height: 10,
              ),
              IconButton(
                  onPressed: () async {
                    // bool result = await GetUserService.deletePost(post.id);
                    // if (result) {
                    //   Utils.snackBarSuccess('deleted successfully', context);
                    // } else {
                    //   Utils.snackBarError('Someting is wrong', context);
                    // }
                  },
                  icon: const Icon(Icons.delete)),
            ],
          )
        ],
      ),
      const Divider(
        thickness: 3,
      )
    ],
  );
}
