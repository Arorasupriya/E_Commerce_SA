import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/api_helper/api_helper.dart';
import 'package:e_commerce_app/api_helper/app_variables.dart';
import 'package:e_commerce_app/bloc/cart_bloc/cart_bloc.dart';
import 'package:e_commerce_app/constants/color_constants.dart';
import 'package:e_commerce_app/helper_classes/custom_widget.dart';
import 'package:e_commerce_app/helper_classes/my_text_styles.dart';
import 'package:e_commerce_app/models/dashboard_models/latest_product_mpdel.dart';
import 'package:e_commerce_app/models/detail_screens_model/add_cart%20_model.dart';
import 'package:e_commerce_app/screens/detail_screens/my_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatefulWidget {
  int getTappedIndexNumber = 0;

  ProductDetailsScreen({super.key, required this.getTappedIndexNumber});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with TickerProviderStateMixin {
  bool isAddToCartTapped = false;

  List<Widget> imageSliders = [];
  List<Color> availableColorList = [
    Colors.black,
    Colors.red,
    Colors.blueGrey,
    Colors.blue,
    Colors.cyan
  ];
  List<String> tabTitleList = ["Descriptions", "specifications", "Reviews"];

  final CarouselController controller = CarouselController();
  int currentIndex = 0;
  int currentIndexColor = 0;
  int selectedButtonIndex = 0;
  int _itemCount = 0;

  List<Products>? getProductList;

  Future<LatestProductModel>? getLatestProductList;

  late AnimationController sController =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat(reverse: true);
  late Animation<double> animation =
      CurvedAnimation(parent: sController, curve: Curves.fastOutSlowIn);

  @override
  void initState() {
    super.initState();
    getLatestProductList = getLatestProductListApi();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsConstants.bgLightColor,
      body: SafeArea(
        bottom: false,
        child: FutureBuilder(
          future: getLatestProductList,
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Align(
                alignment: Alignment.topCenter,
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              var getProductModel = snapshot.data;
              getProductList = getProductModel!.products;
              return Stack(children: [
                Positioned(
                  top: 0,
                  child: Container(
                    width: size.width,
                    height: size.height / 2,
                    decoration:
                        BoxDecoration(color: ColorsConstants.bgLightColor),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 8, bottom: 0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          ColorsConstants.wholeBgColor)),
                                  color: ColorsConstants.mainTitleFontColor,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const ImageIcon(
                                    AssetImage(
                                        "assets/icons/ic_left_arrow.png"),
                                    size: 15,
                                  )),
                              Row(
                                children: [
                                  IconButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  ColorsConstants
                                                      .wholeBgColor)),
                                      color: ColorsConstants.mainTitleFontColor,
                                      onPressed: () {},
                                      icon: const ImageIcon(
                                        AssetImage("assets/icons/ic_share.png"),
                                        size: 15,
                                      )),
                                  IconButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  ColorsConstants
                                                      .wholeBgColor)),
                                      color: ColorsConstants.mainTitleFontColor,
                                      onPressed: () {},
                                      icon: const ImageIcon(
                                        AssetImage(
                                            "assets/icons/ic_search.png"),
                                        size: 15,
                                      )),
                                  Stack(children: [
                                    IconButton(
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    ColorsConstants
                                                        .wholeBgColor)),
                                        color:
                                            ColorsConstants.mainTitleFontColor,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const MyCart()));
                                        },
                                        icon: const ImageIcon(
                                          AssetImage(
                                              "assets/icons/ic_cart.png"),
                                          size: 20,
                                        )),
                                    isAddToCartTapped == true
                                        ? ScaleTransition(
                                            scale: animation,
                                            child: CircleAvatar(
                                              radius: 10,
                                              backgroundColor: ColorsConstants
                                                  .buttonThemeColor,
                                              child: Text(
                                                "$_itemCount",
                                                style: mTextStyle12(
                                                    mFontColor: ColorsConstants
                                                        .wholeBgColor),
                                              ),
                                            ),
                                          )
                                        : CircleAvatar(
                                            radius: 10,
                                            backgroundColor: ColorsConstants
                                                .buttonThemeColor,
                                            child: Text(
                                              "$_itemCount",
                                              style: mTextStyle12(
                                                  mFontColor: ColorsConstants
                                                      .wholeBgColor),
                                            ),
                                          )
                                  ]),
                                ],
                              )
                            ],
                          ),
                          hSpacer(),
                          Stack(
                            children: [
                              CarouselSlider(
                                carouselController: controller,
                                items: createImageView(
                                    getProductList![widget.getTappedIndexNumber]
                                        .images),
                                options: CarouselOptions(
                                    viewportFraction: 0.8,
                                    autoPlay: false,
                                    enlargeCenterPage: true,
                                    aspectRatio: 16 / 9,
                                    //16/9
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        currentIndex = index;
                                      });
                                    }),
                              ),
                              Positioned(
                                bottom: 10,
                                left: MediaQuery.of(context).size.width * 0.4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: getProductList![
                                          widget.getTappedIndexNumber]
                                      .images!
                                      .asMap()
                                      .entries
                                      .map((e) {
                                    return GestureDetector(
                                      onTap: () =>
                                          controller.animateToPage(e.key),
                                      child: Container(
                                        width: 10.0,
                                        height: 10.0,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 4.0),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: ColorsConstants
                                                .mainTitleFontColor
                                                .withOpacity(
                                                    currentIndex == e.key
                                                        ? 0.9
                                                        : 0.3)),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                      width: size.width,
                      height: size.height / 1.75,
                      decoration: const BoxDecoration(
                          color: ColorsConstants.wholeBgColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 75),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  getProductList![widget.getTappedIndexNumber]
                                      .name
                                      .toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: mTextStyle16(
                                      mFontColor:
                                          ColorsConstants.mainTitleFontColor,
                                      mWeight: FontWeight.bold),
                                ),
                              ),
                              hSpacer(mHeight: 5),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "\$ ${getProductList![widget.getTappedIndexNumber].purchasePrice}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: mTextStyle16(
                                      mFontColor:
                                          ColorsConstants.mainTitleFontColor,
                                      mWeight: FontWeight.bold),
                                ),
                              ),
                              hSpacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: ColorsConstants.buttonThemeColor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 16,
                                          color: ColorsConstants.wholeBgColor,
                                        ),
                                        Text(
                                          "${getProductList![widget.getTappedIndexNumber].reviewsCount}",
                                          style: mTextStyle12(
                                              mFontColor:
                                                  ColorsConstants.wholeBgColor,
                                              mWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  wSpacer(mWidth: 5),
                                  Text(
                                    "(${getProductList![widget.getTappedIndexNumber].reviewsCount} Review)",
                                    style: mTextStyle12(
                                        mFontColor: ColorsConstants
                                            .descriptionFontColor),
                                  ),
                                ],
                              ),
                              hSpacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Seller:",
                                    style: mTextStyle12(
                                        mFontColor:
                                            ColorsConstants.mainTitleFontColor,
                                        mWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    " Name of seller ",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: mTextStyle12(
                                        mFontColor:
                                            ColorsConstants.mainTitleFontColor,
                                        mWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              hSpacer(mHeight: 5),
                              Text(
                                "Color",
                                style: mTextStyle16(
                                    mFontColor:
                                        ColorsConstants.mainTitleFontColor,
                                    mWeight: FontWeight.bold),
                              ),
                              Row(
                                children: availableColorList
                                    .asMap()
                                    .entries
                                    .map((e) => InkWell(
                                          onTap: () {
                                            print("${e.key}");
                                            currentIndexColor = e.key;
                                            setState(() {});
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  currentIndexColor == e.key
                                                      ? Colors.grey
                                                      : Colors.white,
                                              radius: 13,
                                              child: CircleAvatar(
                                                backgroundColor: e.value,
                                                radius: 10,
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                              hSpacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: tabTitleList
                                    .asMap()
                                    .entries
                                    .map((e) => ElevatedButton(
                                        style: ButtonStyle(
                                            elevation: MaterialStateProperty
                                                .all<double>(0),
                                            backgroundColor:
                                                selectedButtonIndex ==
                                                        e.key
                                                    ? MaterialStateProperty.all<
                                                            Color>(
                                                        ColorsConstants
                                                            .buttonThemeColor)
                                                    : MaterialStateProperty.all<
                                                            Color>(
                                                        ColorsConstants
                                                            .wholeBgColor)),
                                        onPressed: () {
                                          print("taped button => ${e.key}");
                                          selectedButtonIndex = e.key;
                                          setState(() {});
                                        },
                                        child: Text(
                                          e.value,
                                          style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: ColorsConstants
                                                  .mainTitleFontColor),
                                        )))
                                    .toList(),
                              ),
                              Text(
                                  "${getProductList![widget.getTappedIndexNumber].metaDescription}",
                                  textAlign: TextAlign.left,
                                  style: mTextStyle12(
                                      mFontColor:
                                          ColorsConstants.descriptionFontColor,
                                      mWeight: FontWeight.w400))
                              /*Container(
                                child: Html(
                                    data: getProductList![
                                            widget.getTappedIndexNumber]
                                        .details),
                              )*/
                            ],
                          ),
                        ),
                      )),
                ),
              ]);
            }
            return Container();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Container(
          width: size.width,
          height: 50,
          decoration: BoxDecoration(
              color: ColorsConstants.mainTitleFontColor,
              borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 130,
                  height: 40,
                  decoration: BoxDecoration(
                      color: ColorsConstants.mainTitleFontColor,
                      borderRadius: BorderRadius.circular(30),
                      border: const Border.fromBorderSide(BorderSide(
                        color: ColorsConstants.wholeBgColor,
                      ))),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              if (_itemCount > 0) {
                                _itemCount--;
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "item should be grater then 0")));
                              }
                            });
                            print("tap on remove items ");
                          },
                          icon: const Icon(
                            Icons.remove,
                            fill: 1.0,
                            color: ColorsConstants.wholeBgColor,
                            size: 14,
                          ),
                        ),
                        Text(
                          _itemCount.toString(),
                          style: mTextStyle12(
                              mFontColor: ColorsConstants.wholeBgColor,
                              mWeight: FontWeight.bold),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              _itemCount++;
                            });
                            print("tap on add items ");
                          },
                          icon: const Icon(
                            Icons.add,
                            fill: 1.0,
                            color: ColorsConstants.wholeBgColor,
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return ElevatedButton(
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(150, 40)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                ColorsConstants.buttonThemeColor)),
                        onPressed: _itemCount == 0
                            ? null
                            : () {
                                print("tap add to cart ");
                                var productId =
                                    getProductList![widget.getTappedIndexNumber]
                                        .id;
                                Map<String, dynamic> bodyParameter = {
                                  "id": productId!.toString(),
                                  "quantity": _itemCount.toString()
                                };
                                context.read<CartBloc>().add(GetCartResponse(
                                    bodyParameter: bodyParameter));
                                if (state is CartLoadedState) {
                                  AddToCartModel data;
                                  data = state.addToCartModel;
                                  if (data.status == 0) {
                                    isAddToCartTapped = false;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor: ColorsConstants
                                                .buttonThemeColor,
                                            content: Text(
                                              data.message.toString(),
                                              maxLines: 2,
                                            )));
                                    _itemCount = 0;
                                    setState(() {});
                                  } else if (data.status == 1) {
                                    isAddToCartTapped = true;
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Text(
                                      data.message.toString(),
                                      maxLines: 2,
                                    )));
                                  }
                                  setState(() {});
                                }
                                if (state is CartErrorState) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                    state.msgError.toString(),
                                    maxLines: 2,
                                  )));
                                }
                              },
                        child: Text(
                          "Add to Cart",
                          style: mTextStyle12(
                              mFontColor: ColorsConstants.wholeBgColor,
                              mWeight: FontWeight.bold),
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<LatestProductModel> getLatestProductListApi() async {
    LatestProductModel? latestProductModel;
    var data = await ApiHelper.getApiWithParameterSearch(
        strUrl: AppVariables.productBasePath,
        categoryName: "latest",
        limitValue: 10,
        offsetValue: 1);
    latestProductModel = LatestProductModel.fromJson(data);
    return latestProductModel;
  }

  List<Widget> createImageView(List<String>? imageList) {
    imageSliders = imageList!
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: Stack(
                children: <Widget>[
                  //set filtered Color here
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        availableColorList[currentIndexColor], BlendMode.hue),
                    child: Image.network(
                      "${AppVariables.baseUrls!.productImageUrl}/$item",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  /* Positioned(
                             bottom: 0.0,
                             left: 0.0,
                             right: 0.0,
                             child: Container(
                               decoration: const BoxDecoration(
                                 gradient: LinearGradient(
                                   colors: [
                                     Color.fromARGB(200, 0, 0, 0),
                                     Color.fromARGB(0, 0, 0, 0)
                                   ],
                                   begin: Alignment.bottomCenter,
                                   end: Alignment.topCenter,
                                 ),
                               ),
                               padding: const EdgeInsets.symmetric(
                                   vertical: 10.0, horizontal: 20.0),
                               child: Text(
                                 'No. ${imgList.indexOf(item)} image',
                                 style: const TextStyle(
                                   color: Colors.white,
                                   fontSize: 20.0,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                             ),
                           ),*/
                ],
              ),
            ))
        .toList();
    return imageSliders;
  }
}
