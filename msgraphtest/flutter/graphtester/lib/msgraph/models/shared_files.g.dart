// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_files.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SharedFiles _$SharedFilesFromJson(Map<String, dynamic> json) {
  return SharedFiles(
    value: (json['value'] as List)
        ?.map((e) =>
            e == null ? null : SharedFile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SharedFilesToJson(SharedFiles instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

SharedFile _$SharedFileFromJson(Map<String, dynamic> json) {
  return SharedFile(
    id: json['id'] as String,
    lastShared: json['lastShared'] == null
        ? null
        : LastShared.fromJson(json['lastShared'] as Map<String, dynamic>),
    resourceVisualization: json['resourceVisualization'] == null
        ? null
        : ResourceVisualization.fromJson(
            json['resourceVisualization'] as Map<String, dynamic>),
    resourceReference: json['resourceReference'] == null
        ? null
        : Reference.fromJson(json['resourceReference'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SharedFileToJson(SharedFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastShared': instance.lastShared,
      'resourceVisualization': instance.resourceVisualization,
      'resourceReference': instance.resourceReference,
    };

LastShared _$LastSharedFromJson(Map<String, dynamic> json) {
  return LastShared(
    sharedDateTime: json['sharedDateTime'] as String,
    sharingSubject: json['sharingSubject'] as String,
    sharingType: json['sharingType'] as String,
    sharedBy: json['sharedBy'] == null
        ? null
        : SharedBy.fromJson(json['sharedBy'] as Map<String, dynamic>),
    sharingReference: json['sharingReference'] == null
        ? null
        : Reference.fromJson(json['sharingReference'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LastSharedToJson(LastShared instance) =>
    <String, dynamic>{
      'sharedDateTime': instance.sharedDateTime,
      'sharingSubject': instance.sharingSubject,
      'sharingType': instance.sharingType,
      'sharedBy': instance.sharedBy,
      'sharingReference': instance.sharingReference,
    };

ResourceVisualization _$ResourceVisualizationFromJson(
    Map<String, dynamic> json) {
  return ResourceVisualization(
    title: json['title'] as String,
    type: json['type'] as String,
    mediaType: json['mediaType'] as String,
    previewImageUrl: json['previewImageUrl'] as String,
    previewText: json['previewText'] as String,
    containerWebUrl: json['containerWebUrl'] as String,
    containerDisplayName: json['containerDisplayName'] as String,
    containerType: json['containerType'] as String,
  );
}

Map<String, dynamic> _$ResourceVisualizationToJson(
        ResourceVisualization instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
      'mediaType': instance.mediaType,
      'previewImageUrl': instance.previewImageUrl,
      'previewText': instance.previewText,
      'containerWebUrl': instance.containerWebUrl,
      'containerDisplayName': instance.containerDisplayName,
      'containerType': instance.containerType,
    };

Reference _$ReferenceFromJson(Map<String, dynamic> json) {
  return Reference(
    webUrl: json['webUrl'] as String,
    id: json['id'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$ReferenceToJson(Reference instance) => <String, dynamic>{
      'webUrl': instance.webUrl,
      'id': instance.id,
      'type': instance.type,
    };

SharedBy _$SharedByFromJson(Map<String, dynamic> json) {
  return SharedBy(
    displayName: json['displayName'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$SharedByToJson(SharedBy instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'id': instance.id,
    };
