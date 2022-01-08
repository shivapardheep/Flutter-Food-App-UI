//food populars
class foodpopular {
  String popimage;
  String name;
  double star;
  int rating;
  int price;
  foodpopular(
      {required this.popimage,
      required this.name,
      required this.star,
      required this.rating,
      required this.price});
}

List<foodpopular> populardata = [
  foodpopular(
    popimage:
        "https://cdn.pixabay.com/photo/2017/01/22/19/20/pizza-2000615_960_720.jpg",
    name: "Pizza",
    star: 5.0,
    rating: 190,
    price: 400,
  ),
  foodpopular(
    popimage:
        "https://cdn.pixabay.com/photo/2021/12/09/20/46/burger-6859072_960_720.jpg",
    name: "Burgar",
    star: 4.5,
    rating: 110,
    price: 200,
  ),
  foodpopular(
    popimage:
        "https://images.pexels.com/photos/1583884/pexels-photo-1583884.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    name: "French-Fries",
    star: 3.5,
    rating: 90,
    price: 100,
  ),
  foodpopular(
    popimage:
        "https://images.pexels.com/photos/2641886/pexels-photo-2641886.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    name: "Tandoori chicken",
    star: 3.4,
    rating: 50,
    price: 150,
  ),
];
