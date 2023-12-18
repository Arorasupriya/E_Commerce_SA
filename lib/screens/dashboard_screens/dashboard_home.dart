import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/api_helper/api_helper.dart';
import 'package:e_commerce_app/api_helper/app_variables.dart';
import 'package:e_commerce_app/constants/color_constants.dart';
import 'package:e_commerce_app/helper_classes/custom_widget.dart';
import 'package:e_commerce_app/helper_classes/my_text_styles.dart';
import 'package:e_commerce_app/models/dashboard_models/banner_model.dart';
import 'package:e_commerce_app/models/dashboard_models/categories_list_model.dart';
import 'package:e_commerce_app/models/dashboard_models/latest_product_mpdel.dart';
import 'package:e_commerce_app/screens/dashboard_screens/category.dart';
import 'package:e_commerce_app/screens/dashboard_screens/like_products.dart';
import 'package:e_commerce_app/screens/dashboard_screens/user_profile.dart';
import 'package:e_commerce_app/screens/detail_screens/my_cart.dart';
import 'package:e_commerce_app/screens/detail_screens/product_detail.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  //TODO Variable Declaration
  int currentIndex = 0;

  final CarouselController controller = CarouselController();

  late Future<List<BannerModel>?> gvBannerModel;
  late Future<List<CategoriesListModel>?> gvCategoriesListModel;
  List<Widget> imageSliders = [];
  List<Color> colorsList = [
    Colors.black,
    Colors.blueGrey,
    Colors.orange,
    Colors.pink
  ];

  late Future<LatestProductModel> gvLatestProductModel;
  LatestProductModel? latestProductModel;
  FloatingActionButtonLocation fabLocation =
      FloatingActionButtonLocation.centerDocked;

  @override
  void initState() {
    super.initState();
    gvBannerModel = getBannerApiData();
    gvCategoriesListModel = getCategoryApiData();
    gvLatestProductModel = getLatestProductListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                ColorsConstants.bgLightColor)),
                        color: ColorsConstants.mainTitleFontColor,
                        onPressed: () {},
                        icon: const ImageIcon(
                          AssetImage("assets/icons/ic_menu_dots.png"),
                          size: 15,
                        )),
                    IconButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                ColorsConstants.bgLightColor)),
                        color: ColorsConstants.mainTitleFontColor,
                        onPressed: () {},
                        icon: const ImageIcon(
                          AssetImage("assets/icons/ic_notification.png"),
                          size: 15,
                        ))
                  ],
                ),
                hSpacer(),
                SizedBox(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: mTextStyle12(),
                      filled: true,
                      fillColor: ColorsConstants.bgLightColor,
                      prefixIcon: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            print("tap on Search button");
                          },
                          child: const Icon(Icons.search)),
                      suffixIcon: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            print("tap on Filter");
                          },
                          child: const Icon(Icons.filter_list)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: ColorsConstants.bgLightColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: ColorsConstants.bgLightColor)),
                    ),
                  ),
                ),
                hSpacer(),
                FutureBuilder(
                  future: gvBannerModel,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      print("data is loading");
                      /*return const Align(
                          alignment: Alignment.topCenter,
                          child: CircularProgressIndicator());*/
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      var bannerModel = snapshot.data;
                      return Column(
                        children: [
                          CarouselSlider(
                            carouselController: controller,
                            items: createImageView(bannerModel),
                            options: CarouselOptions(
                                viewportFraction: 1.0,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                aspectRatio: 14 / 6,
                                //16/9
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                }),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: bannerModel!.asMap().entries.map((e) {
                              return GestureDetector(
                                onTap: () => controller.animateToPage(e.key),
                                child: Container(
                                  width: 10.0,
                                  height: 10.0,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorsConstants.buttonThemeColor
                                          .withOpacity(currentIndex == e.key
                                              ? 0.9
                                              : 0.3)),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
                hSpacer(mHeight: 5),
                FutureBuilder(
                  future: gvCategoriesListModel,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      var categoryListModel = snapshot.data;
                      return SizedBox(
                        height: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              itemCount: categoryListModel == null
                                  ? 0
                                  : categoryListModel.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  radius: 30,
                                  borderRadius: BorderRadius.circular(21),
                                  onTap: () {
                                    print(
                                        "Tap on Category in dashboard $index");
                                  },
                                  child: SizedBox(
                                    width: 80,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundColor:
                                              Colors.black.withOpacity(0.1),
                                          backgroundImage: NetworkImage(
                                              "${AppVariables.baseUrls!.categoryImageUrl}/${categoryListModel![index].icon}"),
                                        ),
                                        hSpacer(mHeight: 5),
                                        Expanded(
                                          child: Text(
                                            "${categoryListModel[index].name}",
                                            maxLines: 2,
                                            style: mTextStyle12(
                                                mWeight: FontWeight.bold,
                                                mFontColor: ColorsConstants
                                                    .mainTitleFontColor),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
                hSpacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Special for you",
                        style: mTextStyle16(
                            mWeight: FontWeight.bold,
                            mFontColor: ColorsConstants.mainTitleFontColor),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "see all",
                          style: mTextStyle12(
                              mWeight: FontWeight.bold,
                              mFontColor: Colors.blueGrey),
                        ),
                      ),
                    ],
                  ),
                ),
                hSpacer(),
                FutureBuilder(
                  future: gvLatestProductModel,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      print("data is loading ");
                      /*return const Align(
                          alignment: Alignment.bottomCenter,
                          child: CircularProgressIndicator());*/
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      LatestProductModel data = snapshot.data!;
                      List<Products>? productList = data.products;
                      return SizedBox(
                        height: 900,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                          ),
                          itemBuilder: (context, index) {
                            return productDisplayCard(productList!, index);
                          },
                        ),
                      );
                    }
                    return Container();
                  },
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: fabLocation,
      floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: ColorsConstants.buttonThemeColor,
          elevation: 1,
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
          child: ImageIcon(
            AssetImage("assets/icons/ic_home.png"),
            size: 20,
            color: ColorsConstants.bgLightColor,
          )),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        notchMargin: 6,
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(2),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoryScreen()));
              },
              child: const ImageIcon(
                AssetImage("assets/icons/ic_menu.png"),
                size: 24,
                color: ColorsConstants.descriptionFontColor,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(2),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LikeProductScreen()));
              },
              child: const ImageIcon(
                AssetImage("assets/icons/ic_heart.png"),
                size: 24,
                color: ColorsConstants.descriptionFontColor,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(2),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyCart()));
              },
              child: const ImageIcon(
                AssetImage("assets/icons/ic_cart.png"),
                size: 24,
                color: ColorsConstants.descriptionFontColor,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(2),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserProfile()));
              },
              child: const ImageIcon(
                AssetImage("assets/icons/ic_user.png"),
                size: 24,
                color: ColorsConstants.descriptionFontColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  //TODO Private Methods
  Future<List<BannerModel>?> getBannerApiData() async {
    var data = await ApiHelper.getApiWithParameterRequest(
        strUrl: AppVariables.bannerURL, query: 'main_banner');
    List bannerDataInList = data as List;
    List<BannerModel> bannerModel = [];
    bannerModel = bannerDataInList.map((e) => BannerModel.fromJson(e)).toList();
    return bannerModel;
  }

  Future<List<CategoriesListModel>?> getCategoryApiData() async {
    var data =
        await ApiHelper.getApiRequest(strUrl: AppVariables.categoryListURL);
    List listData = data as List; //getData as list List<dynamic>
    List<CategoriesListModel> categoryListModel = [];
    categoryListModel =
        listData.map((e) => CategoriesListModel.fromJson(e)).toList();
    return categoryListModel;
  }

  Future<LatestProductModel> getLatestProductListApi() async {
    var data = await ApiHelper.getApiWithParameterSearch(
        strUrl: AppVariables.productBasePath,
        categoryName: "latest",
        limitValue: 10,
        offsetValue: 1);
    latestProductModel = LatestProductModel.fromJson(data);
    return latestProductModel!;
  }

  List<Widget> createImageView(List<BannerModel>? bannerModel) {
    if (bannerModel != null) {
      imageSliders = bannerModel
          .map((item) => Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(21)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          "${AppVariables.baseUrls!.bannerImageUrl}/${item.photo}",
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
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
                    )),
              ))
          .toList();
    }
    return imageSliders;
  }

  Widget productDisplayCard(List<Products> productList, int index) {
    return InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(
                        getTappedIndexNumber: index,
                      )));
          print("Tap Index Number ===> $index");
        },
        child: Card(
            color: ColorsConstants.bgLightColor,
            child: Column(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(11),
                  onTap: () {
                    print("tap on like");
                  },
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                            color: ColorsConstants.buttonThemeColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(11))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/icons/ic_heart.png",
                            width: 20,
                            height: 20,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(
                        "${AppVariables.baseUrls!.productThumbnailUrl}/${productList[index].thumbnail.toString()}",
                        height: 50,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    hSpacer(mHeight: 11),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        productList[index].name.toString(),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: mTextStyle12(
                            mWeight: FontWeight.bold,
                            mFontColor: ColorsConstants.mainTitleFontColor),
                      ),
                    ),
                    hSpacer(mHeight: 11),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "\$${productList[index].purchasePrice.toString()}",
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 12,
                              color: ColorsConstants.mainTitleFontColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: colorsList
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: CircleAvatar(
                                      radius: 6, backgroundColor: e),
                                ),
                              )
                              .toList(),
                        )
                      ],
                    )
                  ],
                ),
              ],
            )));
  }
}
