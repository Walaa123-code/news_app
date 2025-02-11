import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_style.dart';
class NewsItem extends StatelessWidget {
  News news;
  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: height*0.01,
        horizontal: width*0.04
      ),
      padding: EdgeInsets.symmetric(
          vertical: height*0.01,
          horizontal: width*0.02
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).indicatorColor,
          width: 2,
        )
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(news.urlToImage??''),
         )
          ,
          SizedBox(height: height*0.02),
          Text(news.title??"",
          style: Theme.of(context).textTheme.headlineLarge,),
          SizedBox(height: height*0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text('By: ${news.author ??""}',
                style: AppStyles.medium12gray,),
              ),
              Text(news.publishedAt??"",
              style: AppStyles.medium12gray,),
            ],
          )
        ],
      ) ,
    );
  }
}
