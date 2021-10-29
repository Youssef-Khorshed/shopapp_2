
class Category
{Category();
  List<dynamic>items =['All'];
Category.fromJson(List<dynamic> json)
{
  json.forEach((element) {
    items.add(element);
  });
}
}