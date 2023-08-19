class GitHubModel {
  GitHubModel({this.user, this.photoUrl, this.profileUrl});

  GitHubModel.formJson(Map<String, dynamic> json) {
    user = json['login'] as String?;
    photoUrl = json['avatar_url'] as String?;
    profileUrl = json['url'] as String?;
  }

  String? user;
  String? photoUrl;
  String? profileUrl;
}
