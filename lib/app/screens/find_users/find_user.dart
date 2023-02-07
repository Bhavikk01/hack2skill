import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/user_model/user_model.dart';
import '../../services/providers.dart';

class FindUser extends ConsumerWidget {
  const FindUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: StreamBuilder<List<UserModel>>(
          stream: ref.read(databaseProvider).getAllUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active &&
                snapshot.data != null) {
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final user = snapshot.data![index];
                    return Padding(
                        padding: const EdgeInsets.all(8.5),
                        child: Container(
                          height: 50,
                          child: ListTile(
                            onTap: (){
                              //TODO: Have to create a profile page for user.
                            },
                            leading: Image.network(user.photoId, height: 30, fit: BoxFit.cover),
                            title: Text(user.username),
                          ),
                        )
                    );
                  });
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );




  }
}
