import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app/features/news_feature/presentation/widgets/news_row.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../../widgets/common_component.dart';

class AppleScreen extends StatelessWidget {
  const AppleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<dynamic> myList = NewsCubit.get(context).appleList;
        return ConditionalBuilder(
          condition: myList.isNotEmpty,
          builder: (context) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return NewsRow(artical: myList[index]);
              },
              separatorBuilder: (context, index) {
                return CustomDivider(indent: 10.w, extend: 10.w);
              },
              itemCount: myList.length,
            );
          },
          fallback: (context) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          },
        );
      },
    );
  }
}
