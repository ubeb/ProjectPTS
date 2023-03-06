import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/setting_.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting Page '),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Toggle Theme'),
          onPressed: () {
            final cubit = context.read<SettingCubit>();
            cubit.toogleTheme();
          },
        ),
      ),
    );
  }
  
}
