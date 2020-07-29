// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:graphtester/main.dart';
import 'package:graphtester/msgraph/models/person.dart';

void main() {
  test('PeopleJsonReadTest', () {
    final peeps = People.fromJson(
        json.decode(_peopleJsonTestContent) as Map<String, dynamic>);
    expect(peeps.value.length, 17);
  });

  test('CalendarJsonReadTest', () {
    final peeps = CalendarEvents.fromJson(
        json.decode(_calendarEvents) as Map<String, dynamic>);
    expect(peeps.value.length, todo);
  });

  test('ShardFilesJsonReadTest', () {
    final peeps = SharedFiles.fromJson(
        json.decode(_sharedFilesJsonTestContent) as Map<String, dynamic>);
    expect(peeps.value.length, todo);
  });

  test('ShardFilesJsonReadTest', () {
    final peeps = Email.fromJson(
        json.decode(_emailJsonTestContent) as Map<String, dynamic>);
    expect(peeps.value.length, todo);
  });

  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}

// query: https://graph.microsoft.com/v1.0/me/calendarview?startdatetime=2020-07-27T20:28:07.882Z&enddatetime=2020-08-03T20:28:07.882Z
const _calendarEvents = r'''
{
    "@odata.context": "https://graph.microsoft.com/v1.0/$metadata#users('40e17a24-8b35-4a07-8e7a-bbf5861ef2ee')/calendarView",
    "value": [
        {
            "@odata.etag": "W/\"PPl3XdkjZkyeFIx2E+TBmwAAAEx0SA==\"",
            "id": "AAMkADAwZjM5ZTQ0LWFlYzAtNGI1My04MTAzLTlhYTk0ZTc2NzJmNgBGAAAAAAAIxYCuYZ7lQbqdPdobQUI9BwA8_Xdd2SNmTJ4UjHYT5MGbAAAAAAENAAA8_Xdd2SNmTJ4UjHYT5MGbAAAATjMwAAA=",
            "createdDateTime": "2020-07-29T02:51:27.742628Z",
            "lastModifiedDateTime": "2020-07-29T02:51:28.8100154Z",
            "changeKey": "PPl3XdkjZkyeFIx2E+TBmwAAAEx0SA==",
            "categories": [],
            "originalStartTimeZone": "Pacific Standard Time",
            "originalEndTimeZone": "Pacific Standard Time",
            "iCalUId": "040000008200E00074C5B7101A82E008000000006FC0BD275365D601000000000000000010000000AF4D6799F46F914C9458FB9C94440154",
            "reminderMinutesBeforeStart": 15,
            "isReminderOn": true,
            "hasAttachments": false,
            "subject": "Meeting in the Halo room",
            "bodyPreview": "",
            "importance": "normal",
            "sensitivity": "normal",
            "isAllDay": false,
            "isCancelled": false,
            "isOrganizer": true,
            "responseRequested": true,
            "seriesMasterId": null,
            "showAs": "busy",
            "type": "singleInstance",
            "webLink": "https://outlook.office365.com/owa/?itemid=AAMkADAwZjM5ZTQ0LWFlYzAtNGI1My04MTAzLTlhYTk0ZTc2NzJmNgBGAAAAAAAIxYCuYZ7lQbqdPdobQUI9BwA8%2BXdd2SNmTJ4UjHYT5MGbAAAAAAENAAA8%2BXdd2SNmTJ4UjHYT5MGbAAAATjMwAAA%3D&exvsurl=1&path=/calendar/item",
            "onlineMeetingUrl": null,
            "isOnlineMeeting": false,
            "onlineMeetingProvider": "unknown",
            "allowNewTimeProposals": true,
            "recurrence": null,
            "onlineMeeting": null,
            "responseStatus": {
                "response": "organizer",
                "time": "0001-01-01T00:00:00Z"
            },
            "body": {
                "contentType": "html",
                "content": ""
            },
            "start": {
                "dateTime": "2020-07-29T17:00:00.0000000",
                "timeZone": "UTC"
            },
            "end": {
                "dateTime": "2020-07-29T17:30:00.0000000",
                "timeZone": "UTC"
            },
            "location": {
                "displayName": "Halo/244",
                "locationType": "default",
                "uniqueId": "Halo/244",
                "uniqueIdType": "private"
            },
            "locations": [
                {
                    "displayName": "Halo/244",
                    "locationType": "default",
                    "uniqueId": "Halo/244",
                    "uniqueIdType": "private"
                }
            ],
            "attendees": [
                {
                    "type": "required",
                    "status": {
                        "response": "none",
                        "time": "0001-01-01T00:00:00Z"
                    },
                    "emailAddress": {
                        "name": "Adele Vance",
                        "address": "AdeleV@clarkezone.onmicrosoft.com"
                    }
                }
            ],
            "organizer": {
                "emailAddress": {
                    "name": "James Clarke",
                    "address": "james@clarkezone.onmicrosoft.com"
                }
            }
        },
        {
            "@odata.etag": "W/\"PPl3XdkjZkyeFIx2E+TBmwAAAExz7g==\"",
            "id": "AAMkADAwZjM5ZTQ0LWFlYzAtNGI1My04MTAzLTlhYTk0ZTc2NzJmNgBGAAAAAAAIxYCuYZ7lQbqdPdobQUI9BwA8_Xdd2SNmTJ4UjHYT5MGbAAAAAAENAAA8_Xdd2SNmTJ4UjHYT5MGbAAAATjMvAAA=",
            "createdDateTime": "2020-07-29T02:48:21.2325477Z",
            "lastModifiedDateTime": "2020-07-29T02:48:22.0001035Z",
            "changeKey": "PPl3XdkjZkyeFIx2E+TBmwAAAExz7g==",
            "categories": [],
            "originalStartTimeZone": "Pacific Standard Time",
            "originalEndTimeZone": "Pacific Standard Time",
            "iCalUId": "040000008200E00074C5B7101A82E0080000000054B992B85265D601000000000000000010000000C8E9A85D327BF548B2E249AF6B8FD9C0",
            "reminderMinutesBeforeStart": 15,
            "isReminderOn": true,
            "hasAttachments": false,
            "subject": "Chat to Adele",
            "bodyPreview": "",
            "importance": "normal",
            "sensitivity": "normal",
            "isAllDay": false,
            "isCancelled": false,
            "isOrganizer": true,
            "responseRequested": true,
            "seriesMasterId": null,
            "showAs": "busy",
            "type": "singleInstance",
            "webLink": "https://outlook.office365.com/owa/?itemid=AAMkADAwZjM5ZTQ0LWFlYzAtNGI1My04MTAzLTlhYTk0ZTc2NzJmNgBGAAAAAAAIxYCuYZ7lQbqdPdobQUI9BwA8%2BXdd2SNmTJ4UjHYT5MGbAAAAAAENAAA8%2BXdd2SNmTJ4UjHYT5MGbAAAATjMvAAA%3D&exvsurl=1&path=/calendar/item",
            "onlineMeetingUrl": null,
            "isOnlineMeeting": false,
            "onlineMeetingProvider": "unknown",
            "allowNewTimeProposals": true,
            "recurrence": null,
            "onlineMeeting": null,
            "responseStatus": {
                "response": "organizer",
                "time": "0001-01-01T00:00:00Z"
            },
            "body": {
                "contentType": "html",
                "content": ""
            },
            "start": {
                "dateTime": "2020-07-30T03:00:00.0000000",
                "timeZone": "UTC"
            },
            "end": {
                "dateTime": "2020-07-30T03:30:00.0000000",
                "timeZone": "UTC"
            },
            "location": {
                "displayName": "",
                "locationType": "default",
                "uniqueIdType": "unknown",
                "address": {},
                "coordinates": {}
            },
            "locations": [],
            "attendees": [
                {
                    "type": "required",
                    "status": {
                        "response": "none",
                        "time": "0001-01-01T00:00:00Z"
                    },
                    "emailAddress": {
                        "name": "Adele Vance",
                        "address": "AdeleV@clarkezone.onmicrosoft.com"
                    }
                }
            ],
            "organizer": {
                "emailAddress": {
                    "name": "James Clarke",
                    "address": "james@clarkezone.onmicrosoft.com"
                }
            }
        },
        {
            "@odata.etag": "W/\"PPl3XdkjZkyeFIx2E+TBmwAAAEx0bw==\"",
            "id": "AAMkADAwZjM5ZTQ0LWFlYzAtNGI1My04MTAzLTlhYTk0ZTc2NzJmNgBGAAAAAAAIxYCuYZ7lQbqdPdobQUI9BwA8_Xdd2SNmTJ4UjHYT5MGbAAAAAAENAAA8_Xdd2SNmTJ4UjHYT5MGbAAAATjMxAAA=",
            "createdDateTime": "2020-07-29T02:52:12.4799593Z",
            "lastModifiedDateTime": "2020-07-29T02:52:18.960237Z",
            "changeKey": "PPl3XdkjZkyeFIx2E+TBmwAAAEx0bw==",
            "categories": [],
            "originalStartTimeZone": "Pacific Standard Time",
            "originalEndTimeZone": "Pacific Standard Time",
            "iCalUId": "040000008200E00074C5B7101A82E008000000005D2068425365D60100000000000000001000000086D84E789FE18640A27580BE963A2D64",
            "reminderMinutesBeforeStart": 15,
            "isReminderOn": true,
            "hasAttachments": false,
            "subject": "Let's chat",
            "bodyPreview": "________________________________________________________________________________\r\nJoin Microsoft Teams Meeting\r\nLearn more about Teams | Meeting options\r\n________________________________________________________________________________",
            "importance": "normal",
            "sensitivity": "normal",
            "isAllDay": false,
            "isCancelled": false,
            "isOrganizer": true,
            "responseRequested": true,
            "seriesMasterId": null,
            "showAs": "busy",
            "type": "singleInstance",
            "webLink": "https://outlook.office365.com/owa/?itemid=AAMkADAwZjM5ZTQ0LWFlYzAtNGI1My04MTAzLTlhYTk0ZTc2NzJmNgBGAAAAAAAIxYCuYZ7lQbqdPdobQUI9BwA8%2BXdd2SNmTJ4UjHYT5MGbAAAAAAENAAA8%2BXdd2SNmTJ4UjHYT5MGbAAAATjMxAAA%3D&exvsurl=1&path=/calendar/item",
            "onlineMeetingUrl": null,
            "isOnlineMeeting": true,
            "onlineMeetingProvider": "teamsForBusiness",
            "allowNewTimeProposals": true,
            "recurrence": null,
            "responseStatus": {
                "response": "organizer",
                "time": "0001-01-01T00:00:00Z"
            },
            "body": {
                "contentType": "html",
                "content": "<html>\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n<meta content=\"text/html; charset=us-ascii\">\r\n</head>\r\n<body>\r\n<div style=\"width:100%; height:20px\"><span style=\"white-space:nowrap; color:gray; opacity:.36\">________________________________________________________________________________</span>\r\n</div>\r\n<div class=\"me-email-text\" style=\"color:#252424; font-family:'Segoe UI','Helvetica Neue',Helvetica,Arial,sans-serif\">\r\n<div style=\"margin-top:24px; margin-bottom:10px\"><a class=\"me-email-headline\" href=\"https://teams.microsoft.com/l/meetup-join/19%3ameeting_NGJkN2ViMzctZjFiOC00MWRlLWFmMDAtYTk0MzE3MTE2NDM5%40thread.v2/0?context=%7b%22Tid%22%3a%2207a6fbee-dda4-419b-9098-9e2cf34deaf1%22%2c%22Oid%22%3a%2240e17a24-8b35-4a07-8e7a-bbf5861ef2ee%22%7d\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"font-size:18px; font-family:'Segoe UI Semibold','Segoe UI','Helvetica Neue',Helvetica,Arial,sans-serif; text-decoration:underline; color:#6264a7\">Join\r\n Microsoft Teams Meeting</a> </div>\r\n<a class=\"me-email-link\" target=\"_blank\" href=\"https://aka.ms/JoinTeamsMeeting\" rel=\"noreferrer noopener\" style=\"font-size:12px; text-decoration:none; color:#6264a7\">Learn more about Teams</a> |\r\n<a class=\"me-email-link\" target=\"_blank\" href=\"https://teams.microsoft.com/meetingOptions/?organizerId=40e17a24-8b35-4a07-8e7a-bbf5861ef2ee&amp;tenantId=07a6fbee-dda4-419b-9098-9e2cf34deaf1&amp;threadId=19_meeting_NGJkN2ViMzctZjFiOC00MWRlLWFmMDAtYTk0MzE3MTE2NDM5@thread.v2&amp;messageId=0&amp;language=en-US\" rel=\"noreferrer noopener\" style=\"font-size:12px; text-decoration:none; color:#6264a7\">\r\nMeeting options</a>\r\n<div style=\"font-size:14px; margin-bottom:4px\"></div>\r\n<div style=\"font-size:12px\"></div>\r\n</div>\r\n<div style=\"width:100%; height:20px\"><span style=\"white-space:nowrap; color:gray; opacity:.36\">________________________________________________________________________________</span>\r\n</div>\r\n</body>\r\n</html>\r\n"
            },
            "start": {
                "dateTime": "2020-07-30T18:30:00.0000000",
                "timeZone": "UTC"
            },
            "end": {
                "dateTime": "2020-07-30T19:00:00.0000000",
                "timeZone": "UTC"
            },
            "location": {
                "displayName": "",
                "locationType": "default",
                "uniqueIdType": "unknown",
                "address": {},
                "coordinates": {}
            },
            "locations": [],
            "attendees": [
                {
                    "type": "required",
                    "status": {
                        "response": "none",
                        "time": "0001-01-01T00:00:00Z"
                    },
                    "emailAddress": {
                        "name": "Adele Vance",
                        "address": "AdeleV@clarkezone.onmicrosoft.com"
                    }
                }
            ],
            "organizer": {
                "emailAddress": {
                    "name": "James Clarke",
                    "address": "james@clarkezone.onmicrosoft.com"
                }
            },
            "onlineMeeting": {
                "joinUrl": "https://teams.microsoft.com/l/meetup-join/19%3ameeting_NGJkN2ViMzctZjFiOC00MWRlLWFmMDAtYTk0MzE3MTE2NDM5%40thread.v2/0?context=%7b%22Tid%22%3a%2207a6fbee-dda4-419b-9098-9e2cf34deaf1%22%2c%22Oid%22%3a%2240e17a24-8b35-4a07-8e7a-bbf5861ef2ee%22%7d"
            }
        }
    ]
}
''';

// query https://graph.microsoft.com/v1.0/me/drive/sharedWithMe
const _sharedFilesJsonTestContent = r'''
{
    "@odata.context": "https://graph.microsoft.com/v1.0/$metadata#users('40e17a24-8b35-4a07-8e7a-bbf5861ef2ee')/insights/shared",
    "value": [
        {
            "id": "ARnb9AhJmAxJrhTyrN6a94YKNnHpxLkKQ6tfZZvbl5bcy6QbjeoTJUuAGq6k1-RNtfbhERvALWdOj5HbMGDrDUIZ2_QISZgMSa4U8qzemveGBA",
            "lastShared": {
                "sharedDateTime": "2020-07-29T02:42:47Z",
                "sharingType": "Direct",
                "sharedBy": {
                    "displayName": "Adele Vance",
                    "address": "AdeleV@clarkezone.onmicrosoft.com",
                    "id": "291d2d44-eb35-4695-8445-0cd2739b253b"
                },
                "sharingReference": {}
            },
            "resourceVisualization": {
                "type": "Excel",
                "mediaType": "application/octet-stream",
                "previewText": ""
            },
            "resourceReference": {
                "type": "microsoft.graph.entity"
            }
        },
        {
            "id": "ARnb9AhJmAxJrhTyrN6a94YKNnHpxLkKQ6tfZZvbl5bcy6QbjeoTJUuAGq6k1-RNtfaiy8zflcRMkgX9O98ejMkZ2_QISZgMSa4U8qzemveGBA",
            "lastShared": {
                "sharedDateTime": "2020-07-29T02:42:22Z",
                "sharingType": "Direct",
                "sharedBy": {
                    "displayName": "Adele Vance",
                    "address": "AdeleV@clarkezone.onmicrosoft.com",
                    "id": "291d2d44-eb35-4695-8445-0cd2739b253b"
                },
                "sharingReference": {}
            },
            "resourceVisualization": {
                "type": "Word",
                "mediaType": "application/octet-stream",
                "previewText": ""
            },
            "resourceReference": {
                "type": "microsoft.graph.entity"
            }
        },
        {
            "id": "ARnb9AhJmAxJrhTyrN6a94YKNnHpxLkKQ6tfZZvbl5bcy6QbjeoTJUuAGq6k1-RNtcs7fXFTAxROkStpO5xpvzYZ2_QISZgMSa4U8qzemveGBA",
            "lastShared": {
                "sharedDateTime": "2020-07-29T02:39:33Z",
                "sharingType": "Direct",
                "sharedBy": {
                    "displayName": "Adele Vance",
                    "address": "AdeleV@clarkezone.onmicrosoft.com",
                    "id": "291d2d44-eb35-4695-8445-0cd2739b253b"
                },
                "sharingReference": {}
            },
            "resourceVisualization": {
                "title": "Presentation",
                "type": "PowerPoint",
                "mediaType": "application/vnd.openxmlformats-officedocument.presentationml.presentation",
                "previewImageUrl": "https://clarkezone-my.sharepoint.com/_api/v2.0/drives/b!Gdv0CEmYDEmuFPKs3pr3hgo2cenEuQpDq19lm9uXltzLpBuN6hMlS4AarqTX5E21/items/01CQBQNEOLHN6XCUYDCRHJCK3JHOOGTPZW/thumbnails/0/small/thumbnailContent",
                "previewText": "",
                "containerWebUrl": "https://clarkezone-my.sharepoint.com/personal/adelev_clarkezone_onmicrosoft_com/Documents/Forms/All.aspx",
                "containerDisplayName": "Adele Vance",
                "containerType": "OneDriveBusiness"
            },
            "resourceReference": {
                "webUrl": "https://clarkezone-my.sharepoint.com/personal/adelev_clarkezone_onmicrosoft_com/_layouts/15/Doc.aspx?sourcedoc=%7B717D3BCB-0353-4E14-912B-693B9C69BF36%7D&file=Presentation.pptx&action=edit&mobileredirect=true&DefaultItemOpen=1",
                "id": "drives/b!Gdv0CEmYDEmuFPKs3pr3hgo2cenEuQpDq19lm9uXltzLpBuN6hMlS4AarqTX5E21/items/01CQBQNEOLHN6XCUYDCRHJCK3JHOOGTPZW",
                "type": "microsoft.graph.driveItem"
            }
        }
    ]
}
''';

// https://graph.microsoft.com/v1.0/me/messages?$filter=(from/emailAddress/address) eq 'LidiaH@clarkezone.OnMicrosoft.com' or (from/emailAddress/address) eq 'AdeleV@clarkezone.OnMicrosoft.com'
const _emailJsonTestContent = r'''
{
    "@odata.context": "https://graph.microsoft.com/v1.0/$metadata#users('40e17a24-8b35-4a07-8e7a-bbf5861ef2ee')/messages",
    "value": [
        {
            "@odata.etag": "W/\"CQAAABYAAAA8+Xdd2SNmTJ4UjHYT5MGbAAAATG+7\"",
            "id": "AAMkADAwZjM5ZTQ0LWFlYzAtNGI1My04MTAzLTlhYTk0ZTc2NzJmNgBGAAAAAAAIxYCuYZ7lQbqdPdobQUI9BwA8_Xdd2SNmTJ4UjHYT5MGbAAAAAAEMAAA8_Xdd2SNmTJ4UjHYT5MGbAAAATfxnAAA=",
            "createdDateTime": "2020-07-29T02:29:51Z",
            "lastModifiedDateTime": "2020-07-29T02:29:53Z",
            "changeKey": "CQAAABYAAAA8+Xdd2SNmTJ4UjHYT5MGbAAAATG+7",
            "categories": [],
            "receivedDateTime": "2020-07-29T02:29:52Z",
            "sentDateTime": "2020-07-29T02:29:49Z",
            "hasAttachments": false,
            "internetMessageId": "<BYAPR02MB47602D0ED787C1F3949D69E5FD700@BYAPR02MB4760.namprd02.prod.outlook.com>",
            "subject": "Hello from someone",
            "bodyPreview": "This is the message",
            "importance": "normal",
            "parentFolderId": "AAMkADAwZjM5ZTQ0LWFlYzAtNGI1My04MTAzLTlhYTk0ZTc2NzJmNgAuAAAAAAAIxYCuYZ7lQbqdPdobQUI9AQA8_Xdd2SNmTJ4UjHYT5MGbAAAAAAEMAAA=",
            "conversationId": "AAQkADAwZjM5ZTQ0LWFlYzAtNGI1My04MTAzLTlhYTk0ZTc2NzJmNgAQALXzTwTeJblBmGAyC3ng0K4=",
            "conversationIndex": "AQHWZVANtfNPBN4luUGYYDILeeDQrg==",
            "isDeliveryReceiptRequested": false,
            "isReadReceiptRequested": false,
            "isRead": false,
            "isDraft": false,
            "webLink": "https://outlook.office365.com/owa/?ItemID=AAMkADAwZjM5ZTQ0LWFlYzAtNGI1My04MTAzLTlhYTk0ZTc2NzJmNgBGAAAAAAAIxYCuYZ7lQbqdPdobQUI9BwA8%2BXdd2SNmTJ4UjHYT5MGbAAAAAAEMAAA8%2BXdd2SNmTJ4UjHYT5MGbAAAATfxnAAA%3D&exvsurl=1&viewmodel=ReadMessageItem",
            "inferenceClassification": "focused",
            "body": {
                "contentType": "html",
                "content": "<html><head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><meta content=\"text/html; charset=iso-8859-1\"><style type=\"text/css\" style=\"display:none\">\r\n<!--\r\np\r\n\t{margin-top:0;\r\n\tmargin-bottom:0}\r\n-->\r\n</style></head><body dir=\"ltr\"><div style=\"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)\">This is the message</div></body></html>"
            },
            "sender": {
                "emailAddress": {
                    "name": "Adele Vance",
                    "address": "AdeleV@clarkezone.onmicrosoft.com"
                }
            },
            "from": {
                "emailAddress": {
                    "name": "Adele Vance",
                    "address": "AdeleV@clarkezone.onmicrosoft.com"
                }
            },
            "toRecipients": [
                {
                    "emailAddress": {
                        "name": "James Clarke",
                        "address": "james@clarkezone.onmicrosoft.com"
                    }
                }
            ],
            "ccRecipients": [],
            "bccRecipients": [],
            "replyTo": [],
            "flag": {
                "flagStatus": "notFlagged"
            }
        },
        {
            "@odata.etag": "W/\"CQAAABYAAAA8+Xdd2SNmTJ4UjHYT5MGbAAAATG/K\"",
            "id": "AAMkADAwZjM5ZTQ0LWFlYzAtNGI1My04MTAzLTlhYTk0ZTc2NzJmNgBGAAAAAAAIxYCuYZ7lQbqdPdobQUI9BwA8_Xdd2SNmTJ4UjHYT5MGbAAAAAAEMAAA8_Xdd2SNmTJ4UjHYT5MGbAAAATfxoAAA=",
            "createdDateTime": "2020-07-29T02:31:33Z",
            "lastModifiedDateTime": "2020-07-29T02:31:34Z",
            "changeKey": "CQAAABYAAAA8+Xdd2SNmTJ4UjHYT5MGbAAAATG/K",
            "categories": [],
            "receivedDateTime": "2020-07-29T02:31:33Z",
            "sentDateTime": "2020-07-29T02:31:31Z",
            "hasAttachments": false,
            "internetMessageId": "<BYAPR02MB4760A519567AE4070F242E04FD700@BYAPR02MB4760.namprd02.prod.outlook.com>",
            "subject": "Another email",
            "bodyPreview": "This is the second message",
            "importance": "normal",
            "parentFolderId": "AAMkADAwZjM5ZTQ0LWFlYzAtNGI1My04MTAzLTlhYTk0ZTc2NzJmNgAuAAAAAAAIxYCuYZ7lQbqdPdobQUI9AQA8_Xdd2SNmTJ4UjHYT5MGbAAAAAAEMAAA=",
            "conversationId": "AAQkADAwZjM5ZTQ0LWFlYzAtNGI1My04MTAzLTlhYTk0ZTc2NzJmNgAQADaKOPs7KNhKqNOKoOJ4_os=",
            "conversationIndex": "AQHWZVBeNoo4+zso2Eqo04qg4nj6iw==",
            "isDeliveryReceiptRequested": false,
            "isReadReceiptRequested": false,
            "isRead": false,
            "isDraft": false,
            "webLink": "https://outlook.office365.com/owa/?ItemID=AAMkADAwZjM5ZTQ0LWFlYzAtNGI1My04MTAzLTlhYTk0ZTc2NzJmNgBGAAAAAAAIxYCuYZ7lQbqdPdobQUI9BwA8%2BXdd2SNmTJ4UjHYT5MGbAAAAAAEMAAA8%2BXdd2SNmTJ4UjHYT5MGbAAAATfxoAAA%3D&exvsurl=1&viewmodel=ReadMessageItem",
            "inferenceClassification": "focused",
            "body": {
                "contentType": "html",
                "content": "<html><head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><meta content=\"text/html; charset=iso-8859-1\"><style type=\"text/css\" style=\"display:none\">\r\n<!--\r\np\r\n\t{margin-top:0;\r\n\tmargin-bottom:0}\r\n-->\r\n</style></head><body dir=\"ltr\"><div style=\"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)\">This is the <span style=\"background-color:rgb(255,255,0)\"><b>second </b></span>message</div></body></html>"
            },
            "sender": {
                "emailAddress": {
                    "name": "Adele Vance",
                    "address": "AdeleV@clarkezone.onmicrosoft.com"
                }
            },
            "from": {
                "emailAddress": {
                    "name": "Adele Vance",
                    "address": "AdeleV@clarkezone.onmicrosoft.com"
                }
            },
            "toRecipients": [
                {
                    "emailAddress": {
                        "name": "James Clarke",
                        "address": "james@clarkezone.onmicrosoft.com"
                    }
                }
            ],
            "ccRecipients": [],
            "bccRecipients": [],
            "replyTo": [],
            "flag": {
                "flagStatus": "notFlagged"
            }
        }
    ]
}
''';

// https://graph.microsoft.com/v1.0/me/people/?$top=20&filter=personType/class eq 'Person' and personType/subclass eq 'OrganizationUser' &Select=id,displayName,JobTitle,OfficeLocation,ScoredEmailAddresses,Phones
const _peopleJsonTestContent = r'''
{"@odata.context":"https://graph.microsoft.com/v1.0/$metadata#users('40e17a24-8b35-4a07-8e7a-bbf5861ef2ee')/people","value":[{"id":"291d2d44-eb35-4695-8445-0cd2739b253b","displayName":"Adele Vance","givenName":"Adele","surname":"Vance","birthday":null,"personNotes":null,"isFavorite":false,"jobTitle":"Retail Manager","companyName":null,"yomiCompany":null,"department":"Retail","officeLocation":"18/2111","profession":null,"userPrincipalName":"AdeleV@clarkezone.onmicrosoft.com","imAddress":"sip:adelev@clarkezone.onmicrosoft.com","scoredEmailAddresses":[{"address":"AdeleV@clarkezone.onmicrosoft.com","relevanceScore":2147483646.0,"selectionLikelihood":"notSpecified"}],"phones":[{"type":"business","number":"+1 425 555 0109"}],"personType":{"class":"Person","subclass":"OrganizationUser"}},{"id":"3a68773a-1a1d-4ebe-9601-8af6621732ca","displayName":"Alex Wilber","givenName":"Alex","surname":"Wilber","birthday":null,"personNotes":null,"isFavorite":false,"jobTitle":"Marketing Assistant","companyName":null,"yomiCompany":null,"department":"Marketing","officeLocation":"131/1104","profession":null,"userPrincipalName":"AlexW@clarkezone.onmicrosoft.com","imAddress":"sip:alexw@clarkezone.onmicrosoft.com","scoredEmailAddresses":[{"address":"AlexW@clarkezone.onmicrosoft.com","relevanceScore":2147483646.0,"selectionLikelihood":"notSpecified"}],"phones":[{"type":"business","number":"+1 858 555 0110"}],"personType":{"class":"Person","subclass":"OrganizationUser"}},{"id":"0eb1197b-d037-4a73-a9b0-f87d11abc6bf","displayName":"Diego Siciliani","givenName":"Diego","surname":"Siciliani","birthday":null,"personNotes":null,"isFavorite":false,"jobTitle":"HR Manager","companyName":null,"yomiCompany":null,"department":"HR","officeLocation":"14/1108","profession":null,"userPrincipalName":"DiegoS@clarkezone.onmicrosoft.com","imAddress":"sip:diegos@clarkezone.onmicrosoft.com","scoredEmailAddresses":[{"address":"DiegoS@clarkezone.onmicrosoft.com","relevanceScore":2147483646.0,"selectionLikelihood":"notSpecified"}],"phones":[{"type":"business","number":"+1 205 555 0108"}],"personType":{"class":"Person","subclass":"OrganizationUser"}},{"id":"7be1f7d9-2fbc-4640-a07b-9673eb3da0d4","displayName":"Grady Archie","givenName":"Grady","surname":"Archie","birthday":null,"personNotes":null,"isFavorite":false,"jobTitle":"Designer","companyName":null,"yomiCompany":null,"department":"R&D","officeLocation":"19/2109","profession":null,"userPrincipalName":"GradyA@clarkezone.onmicrosoft.com","imAddress":"sip:gradya@clarkezone.onmicrosoft.com","scoredEmailAddresses":[{"address":"GradyA@clarkezone.onmicrosoft.com","relevanceScore":2147483646.0,"selectionLikelihood":"notSpecified"}],"phones":[{"type":"business","number":"+1 309 555 0104"}],"personType":{"class":"Person","subclass":"OrganizationUser"}},{"id":"0713126b-86e2-401a-8d96-1472ed54f0c5","displayName":"Henrietta Mueller","givenName":"Henrietta","surname":"Mueller","birthday":null,"personNotes":null,"isFavorite":false,"jobTitle":"Developer","companyName":null,"yomiCompany":null,"department":"R&D","officeLocation":"18/1106","profession":null,"userPrincipalName":"HenriettaM@clarkezone.onmicrosoft.com","imAddress":"sip:henriettam@clarkezone.onmicrosoft.com","scoredEmailAddresses":[{"address":"HenriettaM@clarkezone.onmicrosoft.com","relevanceScore":2147483646.0,"selectionLikelihood":"notSpecified"}],"phones":[{"type":"business","number":"+1 954 555 0118"}],"personType":{"class":"Person","subclass":"OrganizationUser"}},{"id":"d745f4b2-afd7-413e-bfdf-8da642c04911","displayName":"Isaiah Langer","givenName":"Isaiah","surname":"Langer","birthday":null,"personNotes":null,"isFavorite":false,"jobTitle":"Sales Rep","companyName":null,"yomiCompany":null,"department":"Sales","officeLocation":"20/1101","profession":null,"userPrincipalName":"IsaiahL@clarkezone.onmicrosoft.com","imAddress":"sip:isaiahl@clarkezone.onmicrosoft.com","scoredEmailAddresses":[{"address":"IsaiahL@clarkezone.onmicrosoft.com","relevanceScore":2147483646.0,"selectionLikelihood":"notSpecified"}],"phones":[{"type":"business","number":"+1 918 555 0101"}],"personType":{"class":"Person","subclass":"OrganizationUser"}},{"id":"a5d91cf4-8c95-4a4f-a94d-a17e921651c8","displayName":"Johanna Lorenz","givenName":"Johanna","surname":"Lorenz","birthday":null,"personNotes":null,"isFavorite":false,"jobTitle":"Senior Engineer","companyName":null,"yomiCompany":null,"department":"Engineering","officeLocation":"23/2102","profession":null,"userPrincipalName":"JohannaL@clarkezone.onmicrosoft.com","imAddress":"sip:johannal@clarkezone.onmicrosoft.com","scoredEmailAddresses":[{"address":"JohannaL@clarkezone.onmicrosoft.com","relevanceScore":2147483646.0,"selectionLikelihood":"notSpecified"}],"phones":[{"type":"business","number":"+1 502 555 0102"}],"personType":{"class":"Person","subclass":"OrganizationUser"}},{"id":"2f30a6ba-9196-4006-84d8-33b40cf63d20","displayName":"Joni Sherman","givenName":"Joni","surname":"Sherman","birthday":null,"personNotes":null,"isFavorite":false,"jobTitle":"Paralegal","companyName":null,"yomiCompany":null,"department":"Legal","officeLocation":"20/1109","profession":null,"userPrincipalName":"JoniS@clarkezone.onmicrosoft.com","imAddress":"sip:jonis@clarkezone.onmicrosoft.com","scoredEmailAddresses":[{"address":"JoniS@clarkezone.onmicrosoft.com","relevanceScore":2147483646.0,"selectionLikelihood":"notSpecified"}],"phones":[{"type":"business","number":"+1 980 555 0101"}],"personType":{"class":"Person","subclass":"OrganizationUser"}},{"id":"7eedc5d1-9c57-43bd-881e-ea485d1616e9","displayName":"Lee Gu","givenName":"Lee","surname":"Gu","birthday":null,"personNotes":null,"isFavorite":false,"jobTitle":"Director","companyName":null,"yomiCompany":null,"department":"Manufacturing","officeLocation":"23/3101","profession":null,"userPrincipalName":"LeeG@clarkezone.onmicrosoft.com","imAddress":"sip:leeg@clarkezone.onmicrosoft.com","scoredEmailAddresses":[{"address":"LeeG@clarkezone.onmicrosoft.com","relevanceScore":2147483646.0,"selectionLikelihood":"notSpecified"}],"phones":[{"type":"business","number":"+1 913 555 0101"}],"personType":{"class":"Person","subclass":"OrganizationUser"}},{"id":"38a88040-70ac-4b36-bd95-e98446110f87","displayName":"Lidia Holloway","givenName":"Lidia","surname":"Holloway","birthday":null,"personNotes":null,"isFavorite":false,"jobTitle":"Product Manager","companyName":null,"yomiCompany":null,"department":"Engineering","officeLocation":"20/2107","profession":null,"userPrincipalName":"LidiaH@clarkezone.onmicrosoft.com","imAddress":"sip:lidiah@clarkezone.onmicrosoft.com","scoredEmailAddresses":[{"address":"LidiaH@clarkezone.onmicrosoft.com","relevanceScore":2147483646.0,"selectionLikelihood":"notSpecified"}],"phones":[{"type":"business","number":"+1 918 555 0107"}],"personType":{"class":"Person","subclass":"OrganizationUser"}},{"id":"94e3a8d1-c368-4fe8-9e36-b792d3a84ec0","displayName":"Lynne Robbins","givenName":"Lynne","surname":"Robbins","birthday":null,"personNotes":null,"isFavorite":false,"jobTitle":"Planner","companyName":null,"yomiCompany":null,"department":"Retail","officeLocation":"20/1104","profession":null,"userPrincipalName":"LynneR@clarkezone.onmicrosoft.com","imAddress":"sip:lynner@clarkezone.onmicrosoft.com","scoredEmailAddresses":[{"address":"LynneR@clarkezone.onmicrosoft.com","relevanceScore":2147483646.0,"selectionLikelihood":"notSpecified"}],"phones":[{"type":"business","number":"+1 918 555 0104"}],"personType":{"class":"Person","subclass":"OrganizationUser"}},{"id":"9691f8a6-edbf-482a-9780-eb7436d2d603","displayName":"Megan Bowen","givenName":"Megan","surname":"Bowen","birthday":null,"personNotes":null,"isFavorite":false,"jobTitle":"Marketing Manager","companyName":null,"yomiCompany":null,"department":"Marketing","officeLocation":"12/1110","profession":null,"userPrincipalName":"MeganB@clarkezone.onmicrosoft.com","imAddress":"sip:meganb@clarkezone.onmicrosoft.com","scoredEmailAddresses":[{"address":"MeganB@clarkezone.onmicrosoft.com","relevanceScore":2147483646.0,"selectionLikelihood":"notSpecified"}],"phones":[{"type":"business","number":"+1 412 555 0109"}],"personType":{"class":"Person","subclass":"OrganizationUser"}},{"id":"65e9f723-0622-4df2-b5be-a4b1281d4e37","displayName":"Miriam Graham","givenName":"Miriam","surname":"Graham","birthday":null,"personNotes":null,"isFavorite":false,"jobTitle":"Director","companyName":null,"yomiCompany":null,"department":"Sales & Marketing","officeLocation":"131/2103","profession":null,"userPrincipalName":"MiriamG@clarkezone.onmicrosoft.com","imAddress":"sip:miriamg@clarkezone.onmicrosoft.com","scoredEmailAddresses":[{"address":"MiriamG@clarkezone.onmicrosoft.com","relevanceScore":2147483646.0,"selectionLikelihood":"notSpecified"}],"phones":[{"type":"business","number":"+1 858 555 0109"}],"personType":{"class":"Person","subclass":"OrganizationUser"}},{"id":"1e408f40-6958-4e9a-9eec-192e1733f2cc","displayName":"Nestor Wilke","givenName":"Nestor","surname":"Wilke","birthday":null,"personNotes":null,"isFavorite":false,"jobTitle":"Director","companyName":null,"yomiCompany":null,"department":"Operations","officeLocation":"36/2121","profession":null,"userPrincipalName":"NestorW@clarkezone.onmicrosoft.com","imAddress":"sip:nestorw@clarkezone.onmicrosoft.com","scoredEmailAddresses":[{"address":"NestorW@clarkezone.onmicrosoft.com","relevanceScore":2147483646.0,"selectionLikelihood":"notSpecified"}],"phones":[{"type":"business","number":"+1 206 555 0105"}],"personType":{"class":"Person","subclass":"OrganizationUser"}},{"id":"6b322366-f276-4fc3-be55-abf47fbe15e9","displayName":"Patti Fernandez","givenName":"Patti","surname":"Fernandez","birthday":null,"personNotes":null,"isFavorite":false,"jobTitle":"President","companyName":null,"yomiCompany":null,"department":"Executive Management","officeLocation":"15/1102","profession":null,"userPrincipalName":"PattiF@clarkezone.onmicrosoft.com","imAddress":"sip:pattif@clarkezone.onmicrosoft.com","scoredEmailAddresses":[{"address":"PattiF@clarkezone.onmicrosoft.com","relevanceScore":2147483646.0,"selectionLikelihood":"notSpecified"}],"phones":[{"type":"business","number":"+1 502 555 0144"}],"personType":{"class":"Person","subclass":"OrganizationUser"}},{"id":"c224f639-1ff0-4740-aa5e-066df4d5093d","displayName":"Pradeep Gupta","givenName":"Pradeep","surname":"Gupta","birthday":null,"personNotes":null,"isFavorite":false,"jobTitle":"Accountant","companyName":null,"yomiCompany":null,"department":"Finance","officeLocation":"98/2202","profession":null,"userPrincipalName":"PradeepG@clarkezone.onmicrosoft.com","imAddress":"sip:pradeepg@clarkezone.onmicrosoft.com","scoredEmailAddresses":[{"address":"PradeepG@clarkezone.onmicrosoft.com","relevanceScore":2147483646.0,"selectionLikelihood":"notSpecified"}],"phones":[{"type":"business","number":"+20 255501070"}],"personType":{"class":"Person","subclass":"OrganizationUser"}},{"id":"40e17a24-8b35-4a07-8e7a-bbf5861ef2ee","displayName":"James Clarke","givenName":"James","surname":"Clarke","birthday":null,"personNotes":null,"isFavorite":false,"jobTitle":null,"companyName":null,"yomiCompany":null,"department":null,"officeLocation":null,"profession":null,"userPrincipalName":"james@clarkezone.onmicrosoft.com","imAddress":"sip:james@clarkezone.onmicrosoft.com","scoredEmailAddresses":[{"address":"james@clarkezone.onmicrosoft.com","relevanceScore":1.0,"selectionLikelihood":"notSpecified"}],"phones":[{"type":"business","number":"4251001000"}],"personType":{"class":"Person","subclass":"OrganizationUser"}}]}
''';
