import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app/features/news_feature/presentation/widgets/common_component.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../../widgets/news_row.dart';

class TeslaScreen extends StatelessWidget {
  const TeslaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<dynamic> myList = NewsCubit.get(context).teslaList;
        return ConditionalBuilder(
          condition:
              myList.isNotEmpty /*state is! NewsGetTeslaNewsLoadingState*/,
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
