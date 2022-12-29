import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

bool value = false;

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'dark',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Switch(
                  onChanged: (val) {
                    NewsCubit.get(context).changeThemeMode(val);
                  },
                  value: NewsCubit.get(context).themeMode == ThemeMode.light
                      ? true
                      : false,
                ),
              ),
              Text(
                'light',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
        );
      },
    );
  }
}
