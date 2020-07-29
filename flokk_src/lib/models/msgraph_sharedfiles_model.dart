import "package:flokk/models/abstract_model.dart";
import 'package:flokk/models/contacts_model.dart';
import 'package:flokk/services/msgraph/models/shared_files.dart';

class MSSharedFilesModel extends AbstractModel {
  ContactsModel contactsModel;
  SharedFiles _sharedFiles;

  MSSharedFilesModel(this.contactsModel) {
    enableSerialization("sharedfiles.dat");
  }

  set sharedFiles(SharedFiles sf) {
    _sharedFiles = sf;
  }

  @override
  void scheduleSave() {
    cull();
    super.scheduleSave();
  }

  /// //////////////////////////////////////////////////////////////////
  /// Serialization
  @override
  MSSharedFilesModel copyFromJson(Map<String, dynamic> json) {
    SharedFiles.fromJson(json);
    return this;
  }

  @override
  Map<String, dynamic> toJson() {
    return _sharedFiles.toJson();
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
  // SharedFiles
  List<SharedFile> get theSharedFiles {
    return _sharedFiles.value;
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
