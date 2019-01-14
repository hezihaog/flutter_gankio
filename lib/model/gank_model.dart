part 'package:flutter_gankio/model/gank_model.g.dart';

class GankModel extends Object with _GankModelSerializerMiXin{
  final bool error;
  final List<Result> results;

  GankModel(this.error, this.results);

  factory GankModel.fromJson(Map<String, dynamic> json)
     => _$GanHuosFromJson(json);

}

class Result extends Object with _$GankModelSerializerMiXin {
  final String _id;
  final String createdAt;
  final String desc;
  final String type;
  final String url;
  final String publishedAt;
  final List<String> images;
  final String who;
  final String source;
  final bool used;

  Result(this._id, this.createdAt, this.desc, this.type, this.url,
      this.publishedAt, this.images, this.who, this.source, this.used);

  factory Result.formJson(Map<String, dynamic> json) => _$GankModelFormJson(json);
}
