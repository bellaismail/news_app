import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app/core/utils/media_query_values.dart';
import 'package:new_app/features/news_feature/presentation/widgets/common_component.dart';
import 'package:new_app/features/news_feature/presentation/widgets/news_row.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: Theme.of(context).iconTheme,
      ),
      body: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: searchController,
                  onChanged: (val) {
                    cubit.changeWillSearching(search: val);
                    searchController.text = val;
                  },
                  validator: (val) {
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text(
                      'search...',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQueryValue(context: context).hight / 30,
                ),
                Expanded(
                  child: ConditionalBuilder(
                    condition: cubit.searchList.isNotEmpty,
                    builder: (context) {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          return NewsRow(artical: cubit.searchList[index]);
                        },
                        separatorBuilder: (context, index) {
                          return CustomDivider(indent: 10.w, extend: 10.w);
                        },
                        itemCount: cubit.searchList.length,
                      );
                    },
                    fallback: (context) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
