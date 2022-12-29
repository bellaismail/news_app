import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/media_query_values.dart';

class NewsRow extends StatelessWidget {
  const NewsRow({Key? key, required this.artical}) : super(key: key);

  final artical;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        children: [
          Container(
            width: 150.0.w,
            height: 150.0.h,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                image: NetworkImage('${artical['urlToImage']}'),
                onError: (object, s) {},
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: MediaQueryValue(context: context).width / 30),
          Expanded(
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${artical['title']}',
                    style: Theme.of(context).textTheme.displayLarge,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${artical['author']}',
                    style: Theme.of(context).textTheme.displaySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
