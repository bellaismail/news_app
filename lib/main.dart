import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app/config/themes/app_theme.dart';
import 'package:new_app/features/news_feature/presentation/screens/news_layout/new_layout.dart';
import 'package:new_app/core/sahred/cubit_observe.dart';
import 'package:new_app/core/sahred/local_data_helper/cache_helper.dart';
import 'package:new_app/core/sahred/remote_data_helper/dio_helper.dart';

import 'features/news_feature/presentation/cubit/cubit.dart';
import 'features/news_feature/presentation/cubit/states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.inti();
  runApp(ScreenUtilInit(builder: (context, child) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getThemeFromSP()
        ..getBusinessNews(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              // routes: appRoutesMap,
              theme: lightThemeData(),
              darkTheme: darkThemeData(),
              themeMode: cubit.themeMode,
              home: const NewsLayout(),
            ),
          );
        },
      ),
    );
  }
}
