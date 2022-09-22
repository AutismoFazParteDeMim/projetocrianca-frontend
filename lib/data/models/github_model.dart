class GitHubModel {
  String? user;
  String? photoUrl;
  String? profileUrl;

  GitHubModel({this.user, this.photoUrl, this.profileUrl});

  GitHubModel.formJson(Map<String, dynamic> json) {
    user = json["login"];
    photoUrl = json["avatar_url"];
    profileUrl = json["url"];
  }
}
