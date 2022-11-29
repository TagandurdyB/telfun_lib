class ElemImg {
  final String image;

  ElemImg({this.image});
}

class ElemPlace {
  final String name;
  final List etraps;
final int id;
  ElemPlace({this.etraps, this.id, this.name});
}

class ElemEtrap {
  final String name;
  final int id;
  ElemEtrap({ this.id,this.name});
}

class ElemCategory {
  final String tm, image;
  final int id, count;
  ElemCategory({this.count, this.id, this.tm, this.image});
}

class ElemMark {
  final String name, image;
  final int id;

  ElemMark({this.image, this.id, this.name});
}

class ElemModel {
  final int category_id, mark_id, id;
  final String name;
  final List colors;
  ElemModel({this.name, this.colors, this.category_id, this.mark_id, this.id});
}

class ElemEvents {
  final int id, price, index, mark_id, category_id;
  bool favorite;
  final bool is_new;
  final DateTime data;
  final List images;
  final String name, phone, place, about, mark, public_image;
  //final List images;
  ElemEvents(
      {this.mark_id,
      this.category_id,
      this.index = -1,
      this.favorite = false,
      this.is_new = false,
      this.data,
      this.price,
      this.phone,
      this.place,
      this.about,
      this.mark,
      this.images,
      this.id,
      this.name,
      this.public_image});
}

class ElemColor {
  final int id;
  final String tm, ru, code;
  ElemColor({this.id, this.tm, this.ru, this.code});
}
