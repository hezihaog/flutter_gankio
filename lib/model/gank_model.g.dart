part of 'gank_model.dart';

GankModel _$GanHuosFromJson(Map<String, dynamic> json) => GankModel(
    json['error'] as bool,
    (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Result.formJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _GankModelSerializerMiXin {
  bool get error;

  List<Result> get results;

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'error': error, 'results': results};
}

Result _$GankModelFormJson(Map<String, dynamic> json) => Result(
    json['_id'] as String,
    json['createAt'] as String,
    json['desc'] as String,
    json['type'] as String,
    json['url'] as String,
    json['publishedAt'] as String,
    (json['images'] as List)
        ?.map((e) => e as String)?.toList(),
    json['who'] as String,
    json['source'] as String,
    json['used'] as bool);

abstract class _$GankModelSerializerMiXin {
  String get _id;

  String get createdAt;

  String get desc;

  String get type;

  String get url;

  String get publishedAt;

  List<String> get images;

  String get who;

  String get source;

  bool get used;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': _id,
        'createdAt': createdAt,
        'desc': desc,
        'type': type,
        'url': url,
        'publishedAt': publishedAt,
        'images': images,
        'who': who,
        'source': source,
        'used': used
      };
}
