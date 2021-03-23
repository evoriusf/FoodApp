import 'package:flutter/foundation.dart';

FooditemList fooditemList = FooditemList(foodItems: [
  FoodItem(
      id: 1,
      title: "Pepperoni pizza",
      desc: "Pizza with pepperoni topping",
      price: 50000,
      imgUrl:
          "https://www.cooksifu.com/wp-content/uploads/2019/03/Pepperoni-pizza.jpg",
      cate: "food"),
  FoodItem(
      id: 2,
      title: "Sausages pizza",
      desc: "PIzza with slices of sausages on top",
      price: 48000,
      imgUrl:
          "https://media-cdn.tripadvisor.com/media/photo-s/0f/c5/2a/f3/traditional-pizza-bbq.jpg",
      cate: "food"),
  FoodItem(
      id: 3,
      title: "Cheeese",
      desc: "Pizza but all cheese",
      price: 80000,
      imgUrl:
          "https://kitchenatics.com/wp-content/uploads/2020/09/Cheese-pizza-1.jpg",
      cate: "food"),
  FoodItem(
      id: 4,
      title: "Tuna melt",
      desc: "Pizza with tuna tuna yummy",
      price: 50000,
      imgUrl:
          "https://i.pinimg.com/originals/89/b7/67/89b76716d53ad9379835b8b502a9a72a.jpg",
      cate: "food"),
  FoodItem(
      id: 5,
      title: "Spaghetti",
      desc: "Biasalah",
      price: 25000,
      imgUrl:
          "https://cdn1-production-images-kly.akamaized.net/lw6Ry6aiWX_SbemYuPVJOh6Xt3k=/1748x0:5493x3745/640x640/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3048436/original/030475400_1581499756-shutterstock_413580649.jpg",
      cate: "food"),
  FoodItem(
      id: 6,
      title: "Beef Lasagna",
      desc: "Lasagna with beef",
      price: 49500,
      imgUrl:
          "https://img.taste.com.au/7Hc2lg09/taste/2016/11/beef-lasagne-77009-1.jpeg",
      cate: "food"),
  FoodItem(
      id: 7,
      title: "Soft Drink",
      desc: "Coca cola",
      price: 49500,
      imgUrl:
          "https://e7.pngegg.com/pngimages/65/459/png-clipart-fizzy-drinks-juice-carbonated-water-cola-diet-drink-coca-cola-s-glass-food.png",
      cate: "drink"),
  FoodItem(
      id: 8,
      title: "Lemon Tea",
      desc: "Tea with lemon",
      price: 49500,
      imgUrl: "https://cf.shopee.co.id/file/f19611d604090c62fc56e734393d9ad1",
      cate: "drink"),
  FoodItem(
      id: 9,
      title: "Mineral Water",
      desc: "Just a normal mineral water",
      price: 49500,
      imgUrl:
          "http://clipart-library.com/images_k/glass-of-water-transparent-background/glass-of-water-transparent-background-15.png",
      cate: "drink"),
]);

class FooditemList {
  List<FoodItem> foodItems;

  FooditemList({@required this.foodItems});
}

class FoodItem {
  int id;
  String title, desc;
  int price;
  String imgUrl, cate;
  int quantity;

  FoodItem({
    @required this.id,
    @required this.title,
    @required this.desc,
    @required this.price,
    @required this.imgUrl,
    this.quantity = 1,
    @required this.cate,
  });

  bool get isNotEmpty => null;

  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }

  bool contains(FoodItem query) {}
}
