import "package:flokk/models/abstract_model.dart";
import 'package:flokk/models/contacts_model.dart';
import 'package:flokk/services/msgraph/models/email.dart';

class MSEmailModel extends AbstractModel {
  ContactsModel contactsModel;
  Emails _emails;

  MSEmailModel(this.contactsModel) {
    enableSerialization("email.dat");
  }

  set emails(Emails em) {
    _emails = em;
  }

  @override
  void scheduleSave() {
    cull();
    super.scheduleSave();
  }

  /// //////////////////////////////////////////////////////////////////
  /// Serialization
  @override
  MSEmailModel copyFromJson(Map<String, dynamic> json) {
    Emails.fromJson(json);
    return this;
  }

  @override
  Map<String, dynamic> toJson() {
    return _emails.toJson();
  }

  /// //////////////////////////////////////////////////////////////////
  /// Public API
  bool get isLoading => _isLoading;
  bool _isLoading = false;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  /////////////////////////////////////////////////////////////////////
  // emails
  List<Email> get eMails {
    return _emails.value;
  }

  void cull() {
    // final current = DateTime.now();
    // for (List<Tweet> n in _tweetHash.values) {
    //   n.removeWhere((x) => current.difference(x.createdAt) >= expiry);
    // }
    // _tweetHash.removeWhere((key, value) => value.isEmpty);
    notifyListeners();
  }
}
