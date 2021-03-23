import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cart.dart';
import 'bloc/cartlistBloc.dart';
import 'const/themeColor.dart';
import 'model/food_item.dart';

class CartDetails extends StatefulWidget {
  FoodItem temp;
  CartDetails(FoodItem foodItem) {
    temp = foodItem;
  }

  @override
  _CartDetailsState createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  var trek = '';

  void Function(FoodItem cate) foodItem;

  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(35, 25, 35, 0),
                  child: Column(children: <Widget>[
                    DetailsAppBar(),
                    title(),
                  ])),
              picture(),
              SizedBox(height: 30),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    PilihanCrust(
                      joko: trek == 'CC' ? true : false,
                      foodItem: widget.temp,
                      img:
                          "https://s3-media0.fl.yelpcdn.com/bphoto/_jVFxETxeeOTErtcjbWkoA/l.jpg",
                      txt: "Crusty Crust",
                      cate: "CC",
                      crustSelect: (String crust) {
                        setState(() {
                          trek = crust;
                        });
                        setState(() {});
                      },
                    ),
                    PilihanCrust(
                      joko: trek == 'NC' ? true : false,
                      foodItem: widget.temp,
                      img:
                          "https://sparkpeo.hs.llnwd.net/e2/guid/No-yeast-pizza-crust-pizza/ddfa64dd-f557-4a21-bc20-e57dbe83fc6e.jpg",
                      txt: "No Crust",
                      cate: "NC",
                      crustSelect: (String crust) {
                        setState(() {
                          trek = crust;
                        });
                      },
                    ),
                    PilihanCrust(
                      joko: trek == 'MZ' ? true : false,
                      foodItem: widget.temp,
                      img:
                          "https://d2culxnxbccemt.cloudfront.net/craft/content/uploads/2015/01/20185224/stuffed3.jpg",
                      txt: "Moza Crust",
                      cate: "MZ",
                      crustSelect: (String crust) {
                        setState(() {
                          trek = crust;
                        });
                      },
                    ),
                  ]),
              SizedBox(height: 50),
              StreamBuilder(
                stream: bloc.listStream,
                builder: (context, snapshot) {
                  List<FoodItem> foodItems = snapshot.data;
                  return addingGestureDetector(context, foodItems);
                },
              ),
            ],
          ),
        )),
      ),
    );
  }

  Container noItemContainer() {
    return Container(
      child: Center(
        child: Text(
          "No More Items Left In The Cart",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey[500],
              fontSize: 20),
        ),
      ),
    );
  }

  Widget picture() {
    return Container(
        alignment: Alignment.center,
        child: Image.network(widget.temp.imgUrl, fit: BoxFit.fill));
  }

  Widget title() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.temp.title,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 35,
                    color: Colors.black),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.temp.desc,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black),
              )
            ],
          )
        ],
      ),
    );
  }

  GestureDetector addingGestureDetector(
      BuildContext context, List<FoodItem> foodItems) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

    addToCart(FoodItem foodItem) {
      bloc.addToList(foodItem);
    }

    return GestureDetector(
      onTap: () {
        addToCart(widget.temp);
        final snackBar = SnackBar(
          content: Text(widget.temp.title + 'added to Cart'),
          duration: Duration(milliseconds: 550),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.local_pizza_sharp),
                SizedBox(width: 10),
                Text("Add to Cart",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 20))
              ]),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Themes.color, borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }
}

class PilihanCrust extends StatefulWidget {
  void Function(String cate) crustSelect;

  bool joko;
  FoodItem foodItem;
  String img, txt, cate;
  PilihanCrust(
      {this.joko,
      this.foodItem,
      this.img,
      this.txt,
      this.cate,
      this.crustSelect});
  @override
  _PilihanCrustState createState() => _PilihanCrustState();
}

class _PilihanCrustState extends State<PilihanCrust> {
  Widget build(BuildContext context) {
    if (widget.foodItem.cate == "food") {
      return GestureDetector(
          onTap: () {
            widget.crustSelect(widget.cate);
          },
          child: Column(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: widget.joko ? Themes.color : Colors.white,
                      width: 5)),
              height: 100,
              child: Image.network(widget.img),
            ),
            SizedBox(height: 5),
            Text(widget.txt,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18))
          ]));
    } else {
      return SizedBox(
        height: 0,
      );
    }
  }
}

class DetailsAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            cartGestureDetector(context)
          ]),
    );
  }

  GestureDetector cartGestureDetector(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Cart()));
      },
      child: Container(
        child: Row(children: <Widget>[
          Icon(Icons.shopping_cart),
          SizedBox(width: 10),
        ]),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Themes.color, borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
