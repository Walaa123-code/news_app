import 'package:hive/hive.dart';


//@HiveType(typeId: 0)
class SourceResponse {
SourceResponse({
this.status,
this.sources,
this.code,
this.message,
});

SourceResponse.fromJson(dynamic json) {
status = json['status'];
code= json['code'];
message=json['message'];
if (json['sources'] != null) {
sources = [];
json['sources'].forEach((v) {
sources?.add(Source.fromJson(v));
});
}
}
//@HiveField(0)
String? status;
//@HiveField(1)
List<Source>? sources;
//@HiveField(2)
String? code;
//@HiveField(3)
String? message;

Map<String, dynamic> toJson() {
final map = <String, dynamic>{};
map['status'] = status;
if (sources != null) {
map['sources'] = sources?.map((v) => v.toJson()).toList();
}
return map;
}
}

/// id : "abc-news"
/// name : "ABC News"
/// description : "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com."
/// url : "https://abcnews.go.com"
/// category : "general"
/// language : "en"
/// country : "us"
//@HiveType(typeId: 1)
class Source  extends HiveObject{
Source({
this.id,
this.name,
this.description,
this.url,
this.category,
this.language,
this.country,
});

Source.fromJson(dynamic json) {
id = json['id'];
name = json['name'];
description = json['description'];
url = json['url'];
category = json['category'];
language = json['language'];
country = json['country'];
}
//@HiveField(0)
String? id;
//@HiveField(1)
String? name;
//@HiveField(2)
String? description;
//@HiveField(3)
String? url;
//@HiveField(4)
String? category;
//@HiveField(5)
String? language;
//@HiveField(6)
String? country;

Map<String, dynamic> toJson() {
final map = <String, dynamic>{};
map['id'] = id;
map['name'] = name;
map['description'] = description;
map['url'] = url;
map['category'] = category;
map['language'] = language;
map['country'] = country;
return map;
}
}