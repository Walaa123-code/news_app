import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/category_details/source_tab_widget.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryDetails extends StatefulWidget {
 static const String routeName = 'Category_details';

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(
              color: AppColors.grayColor,
            ),);
          } else if (snapshot.hasError) {
            return Column(
              children: [
                const Text('Something went wrong'),
                ElevatedButton(onPressed: () {
                  ApiManager.getSources();
                  setState(() {

                  });
                },
                    child: const Text('Try again'))
              ],
            );
          }
          // server => response   (success , error)
          // error
          if(snapshot.data!.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: () {
                  ApiManager.getSources();
                  setState(() {

                  });
                },
                    child: const Text('Try again'))
              ],
            );
          }
          // server => data
          var sourceList = snapshot.data!.sources ?? [] ;
          return SourceTabWidget(sourceList: sourceList);
        }
    );
  }
}
