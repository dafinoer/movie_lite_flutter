import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tix_clone_flutter/presentations/apitoken/apitoken_cubit.dart';
import 'package:tix_clone_flutter/ui/apikey/ui_state/validation_apikey.dart';

part '_apikey_textfield.dart';

part '_submit_button.dart';

class ApiScreenPage extends StatelessWidget {
  const ApiScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('ApiKey'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ValidationApiKey(),
          ),
          BlocProvider(
            create: (context) => ApiTokenCubit.create(),
          )
        ],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: _ApiKeyTextField(),
            ),
            const Spacer(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: SizedBox(
                width: size.width,
                child: const _SubmitButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
