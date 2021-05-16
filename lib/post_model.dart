class PostModel {
  late String title, body;

  PostModel.fromJson(dynamic json) {
    title = json['title'];
    body = json['body'];
  }
}
