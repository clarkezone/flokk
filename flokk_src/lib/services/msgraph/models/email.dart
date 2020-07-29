import 'package:flokk/services/msgraph/models/message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'email.g.dart';

@JsonSerializable()
class Emails {
  List<Email> value;

  Emails({this.value});

  factory Emails.fromJson(Map<String, dynamic> json) => _$EmailsFromJson(json);

  Map<String, dynamic> toJson() => _$EmailsToJson(this);
}

@JsonSerializable()
class Email {
  final String id;
  final String createdDateTime;
  final String lastModifiedDateTime;
  final String changeKey;
  final List<String> categories;
  final String receivedDateTime;
  final String sentDateTime;
  final bool hasAttachments;
  final String internetMessageId;
  final String subject;
  final String bodyPreview;
  final String importance;
  final String parentFolderId;
  final String conversationId;
  final String conversationIndex;
  final bool isDeliveryReceiptRequested;
  final bool isReadReceiptRequested;
  final bool isRead;
  final bool isDraft;
  final String webLink;
  final String inferenceClassification;
  final Body body;
  final Recipient sender;
  final Recipient from;
  final List<Recipient> toRecipients;
  final List<Recipient> ccRecipients;
  final List<Recipient> bccRecipients;
  final List<Recipient> replyTo;
  final Flag flag;

  Email(
      {this.id,
      this.createdDateTime,
      this.lastModifiedDateTime,
      this.changeKey,
      this.categories,
      this.receivedDateTime,
      this.sentDateTime,
      this.hasAttachments,
      this.internetMessageId,
      this.subject,
      this.bodyPreview,
      this.importance,
      this.parentFolderId,
      this.conversationId,
      this.conversationIndex,
      this.isDeliveryReceiptRequested,
      this.isReadReceiptRequested,
      this.isRead,
      this.isDraft,
      this.webLink,
      this.inferenceClassification,
      this.body,
      this.sender,
      this.from,
      this.toRecipients,
      this.ccRecipients,
      this.bccRecipients,
      this.replyTo,
      this.flag});

  factory Email.fromJson(Map<String, dynamic> json) => _$EmailFromJson(json);

  Map<String, dynamic> toJson() => _$EmailToJson(this);
}
