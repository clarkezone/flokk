import 'package:json_annotation/json_annotation.dart';

part 'shared_files.g.dart';

@JsonSerializable()
class SharedFiles {
  List<SharedFile> value;

  SharedFiles({this.value});

  factory SharedFiles.fromJson(Map<String, dynamic> json) =>
      _$SharedFilesFromJson(json);

  Map<String, dynamic> toJson() => _$SharedFilesToJson(this);
}

@JsonSerializable()
class SharedFile {
  final String id;
  final LastShared lastShared;
  final ResourceVisualization resourceVisualization;
  final Reference resourceReference;

  SharedFile(
      {this.id,
      this.lastShared,
      this.resourceVisualization,
      this.resourceReference});

  factory SharedFile.fromJson(Map<String, dynamic> json) =>
      _$SharedFileFromJson(json);

  Map<String, dynamic> toJson() => _$SharedFileToJson(this);
}

@JsonSerializable()
class LastShared {
  final String sharedDateTime;
  final String sharingSubject;
  final String sharingType;
  final SharedBy sharedBy;
  final Reference sharingReference;

  LastShared(
      {this.sharedDateTime,
      this.sharingSubject,
      this.sharingType,
      this.sharedBy,
      this.sharingReference});

  factory LastShared.fromJson(Map<String, dynamic> json) =>
      _$LastSharedFromJson(json);

  Map<String, dynamic> toJson() => _$LastSharedToJson(this);
}

@JsonSerializable()
class ResourceVisualization {
  final String title;
  final String type;
  final String mediaType;
  final String previewImageUrl;
  final String previewText;
  final String containerWebUrl;
  final String containerDisplayName;
  final String containerType;

  ResourceVisualization(
      {this.title,
      this.type,
      this.mediaType,
      this.previewImageUrl,
      this.previewText,
      this.containerWebUrl,
      this.containerDisplayName,
      this.containerType});

  factory ResourceVisualization.fromJson(Map<String, dynamic> json) =>
      _$ResourceVisualizationFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceVisualizationToJson(this);
}

@JsonSerializable()
class Reference {
  final String webUrl;
  final String id;
  final String type;

  Reference({this.webUrl, this.id, this.type});

  factory Reference.fromJson(Map<String, dynamic> json) =>
      _$ReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$ReferenceToJson(this);
}

@JsonSerializable()
class SharedBy {
  final String displayName;
  final String id;

  SharedBy({this.displayName, this.id});

  factory SharedBy.fromJson(Map<String, dynamic> json) =>
      _$SharedByFromJson(json);

  Map<String, dynamic> toJson() => _$SharedByToJson(this);
}
