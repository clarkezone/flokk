// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Emails _$EmailsFromJson(Map<String, dynamic> json) {
  return Emails(
    value: (json['value'] as List)
        ?.map(
            (e) => e == null ? null : Email.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EmailsToJson(Emails instance) => <String, dynamic>{
      'value': instance.value,
    };

Email _$EmailFromJson(Map<String, dynamic> json) {
  return Email(
    id: json['id'] as String,
    createdDateTime: json['createdDateTime'] as String,
    lastModifiedDateTime: json['lastModifiedDateTime'] as String,
    changeKey: json['changeKey'] as String,
    categories: (json['categories'] as List)?.map((e) => e as String)?.toList(),
    receivedDateTime: json['receivedDateTime'] as String,
    sentDateTime: json['sentDateTime'] as String,
    hasAttachments: json['hasAttachments'] as bool,
    internetMessageId: json['internetMessageId'] as String,
    subject: json['subject'] as String,
    bodyPreview: json['bodyPreview'] as String,
    importance: json['importance'] as String,
    parentFolderId: json['parentFolderId'] as String,
    conversationId: json['conversationId'] as String,
    conversationIndex: json['conversationIndex'] as String,
    isDeliveryReceiptRequested: json['isDeliveryReceiptRequested'] as bool,
    isReadReceiptRequested: json['isReadReceiptRequested'] as bool,
    isRead: json['isRead'] as bool,
    isDraft: json['isDraft'] as bool,
    webLink: json['webLink'] as String,
    inferenceClassification: json['inferenceClassification'] as String,
    body: json['body'] == null
        ? null
        : Body.fromJson(json['body'] as Map<String, dynamic>),
    sender: json['sender'] == null
        ? null
        : Recipient.fromJson(json['sender'] as Map<String, dynamic>),
    from: json['from'] == null
        ? null
        : Recipient.fromJson(json['from'] as Map<String, dynamic>),
    toRecipients: (json['toRecipients'] as List)
        ?.map((e) =>
            e == null ? null : Recipient.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ccRecipients: (json['ccRecipients'] as List)
        ?.map((e) =>
            e == null ? null : Recipient.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    bccRecipients: (json['bccRecipients'] as List)
        ?.map((e) =>
            e == null ? null : Recipient.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    replyTo: (json['replyTo'] as List)
        ?.map((e) =>
            e == null ? null : Recipient.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    flag: json['flag'] == null
        ? null
        : Flag.fromJson(json['flag'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EmailToJson(Email instance) => <String, dynamic>{
      'id': instance.id,
      'createdDateTime': instance.createdDateTime,
      'lastModifiedDateTime': instance.lastModifiedDateTime,
      'changeKey': instance.changeKey,
      'categories': instance.categories,
      'receivedDateTime': instance.receivedDateTime,
      'sentDateTime': instance.sentDateTime,
      'hasAttachments': instance.hasAttachments,
      'internetMessageId': instance.internetMessageId,
      'subject': instance.subject,
      'bodyPreview': instance.bodyPreview,
      'importance': instance.importance,
      'parentFolderId': instance.parentFolderId,
      'conversationId': instance.conversationId,
      'conversationIndex': instance.conversationIndex,
      'isDeliveryReceiptRequested': instance.isDeliveryReceiptRequested,
      'isReadReceiptRequested': instance.isReadReceiptRequested,
      'isRead': instance.isRead,
      'isDraft': instance.isDraft,
      'webLink': instance.webLink,
      'inferenceClassification': instance.inferenceClassification,
      'body': instance.body,
      'sender': instance.sender,
      'from': instance.from,
      'toRecipients': instance.toRecipients,
      'ccRecipients': instance.ccRecipients,
      'bccRecipients': instance.bccRecipients,
      'replyTo': instance.replyTo,
      'flag': instance.flag,
    };
