import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Models/database.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<Database>();
    // context.read<Database>().viewPassword();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<Database>(
              builder: ((context, value, child) {
                return GestureDetector(
                    onTap: () {
                      dbclass.obscureviewPassword();
                    },
                    child: Text(value.ishidenPassword.toString()));
              }),
            )
          ],
        ),
      ),
    );
  }
}
