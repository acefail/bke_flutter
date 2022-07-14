class WalkThroughModel {
  String? title;
  String? subtitle;
  String? image;

  WalkThroughModel({this.title, this.subtitle, this.image});
}

List<WalkThroughModel> getListWalkThrough() {
  List<WalkThroughModel> list = [];

  list.add(WalkThroughModel(
      title: 'Get Inspired',
      subtitle: 'Discover delicious recipes and funny food stories.'));
  list.add(WalkThroughModel(
      title: 'Sharpen Your Skills',
      subtitle: 'With our Cooking Videos and top Tips.'));
  list.add(WalkThroughModel(
      title: 'Shape Your Recipes',
      subtitle: 'With our international community.'));
  return list;
}
