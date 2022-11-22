class ElemImg {
  final String image;

  ElemImg({this.image});
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

class ElemEvents {
  final int id, price;
  final DateTime data;
  final String name, phone, place, about, mark,public_image;
 // final List images;
  ElemEvents(
      {this.data,
        this.price,
      this.phone,
      this.place,
      this.about,
      this.mark,
     // this.images,
      this.id,
      this.name,
      this.public_image});
}

class ElemModel {
  final int category_id, mark_id, id;
  final String name;
  final List colors;
  ElemModel({this.name, this.colors, this.category_id, this.mark_id, this.id});
}

class ElemEventDetal {
  final List images;
  final String name,mark,place,about,phone;
  final int price;
  final DateTime data;

  ElemEventDetal( {this.data,this.mark, this.place, this.about, this.phone, this.price,this.name,this.images});
}

/*
  static String img = "img";
  static String categori = "category";
  static String mark = "mark";
  static String events = "events";
  static String model = "model";
  static String eventDetal = "eventDetal";
   */
