import 'package:json_annotation/json_annotation.dart';

part 'new_phrase.g.dart';

@JsonSerializable()
class NewModelPhrase{
  const NewModelPhrase({
    this.q,
    this.a,
    this.h
});

  factory NewModelPhrase.fromJson(Map<String, dynamic> json) =>
      _$NewModelPhraseFromJson(json);

  final String? q;
  final String? a;
  final String? h;

  Map<String, dynamic> toJson() => _$NewModelPhraseToJson(this);


}