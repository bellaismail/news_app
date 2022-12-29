import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/utils/app_strings.dart';
import 'package:new_app/features/news_feature/presentation/screens/search_screen/search_screen.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.appBarTitle),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchScreen()))
                          .then((value) => {cubit.changeWillSearching()});
                      // Navigator.pushNamed(context, AppRoutes.newsSearchScreen)
                      //     .then((value) {
                      //   cubit.changeWillSearching();
                      // });
                    },
                    icon: const Icon(Icons.search)),
              ),
            ],
          ),
          body: cubit.bodyList[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            currentIndex: cubit.currentIndex,
            items: cubit.bottomNavIconList,
          ),
        );
      },
    );
  }
}
