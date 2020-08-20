

class AirDeepModel{
  String title;
  dynamic img;

  AirDeepModel({
    this.title,
    this.img
});

  factory AirDeepModel.toJson(dynamic e) =>
      AirDeepModel(
        title: e['title'],
        img: e['img']
      );
}