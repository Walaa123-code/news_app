import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/news/news_item.dart';
import 'package:news_app/ui/home/news/news_widget_view_model.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_colors.dart';

class NewsWidget extends StatefulWidget {
  Source source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidgetViewModel viewModel = NewsWidgetViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id??"");
  }
  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<NewsWidgetViewModel>(
            builder: (context, viewModel, child){
              // todo: error
              if(viewModel.errorMessage != null){
                return Center(
                  child: Column(
                    children: [
                       Text(viewModel.errorMessage!,
                       style: Theme.of(context).textTheme.headlineMedium,),
                      ElevatedButton(onPressed: (){
                        ApiManager.getNewsBySourceId(widget.source.id??'');
                        setState(() {

                        });
                      },
                          child: const Text('Try again'))
                    ],
                  ),
                );
              }else if(viewModel.newsList == null){
                // todo loading
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.grayColor,
                  ),
                );
              }else{
                return ListView.builder(itemBuilder: (context,index){
                  return NewsItem(news: viewModel.newsList![index]);
                },
                  itemCount: viewModel.newsList!.length,
                );
              }


            }),
        /*
        child: FutureBuilder<NewsResponse?>(
            future: ApiManager.getNewsBySourceId(widget.source.id??""),
            builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(
                child: CircularProgressIndicator(
                color: AppColors.grayColor,
                ),
                );
        }else if(snapshot.hasError){
                return Center(
                  child: Column(
                  children: [
                    const Text('Something went wrong'),
                      ElevatedButton(onPressed: (){
                        ApiManager.getNewsBySourceId(widget.source.id??'');
                        setState(() {

                        });
                      },
                      child: const Text('Try again'))
                  ],
                  ),
                );
        }
              // server => response (success, error)
              if(snapshot.data!.status != 'ok'){
                return Center(
                  child: Column(
                    children: [
                       Text(snapshot.data!.message!),
                      ElevatedButton(onPressed: (){
                        ApiManager.getNewsBySourceId(widget.source.id??'');
                        setState(() {

                        });
                      },
                          child: const Text('Try again'))
                    ],
                  ),
                );
              }
              var newList = snapshot.data!.articles!;
              return ListView.builder(itemBuilder: (context,index){
                return NewsItem(news: newList[index]);
              },
                itemCount: newList.length,
              );
        }),

         */

    );
  }

}
