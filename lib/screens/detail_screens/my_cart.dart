import 'package:e_commerce_app/constants/color_constants.dart';
import 'package:e_commerce_app/helper_classes/custom_widget.dart';
import 'package:e_commerce_app/helper_classes/my_text_styles.dart';
import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      child: Scaffold(
          backgroundColor: ColorsConstants.bgLightColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            ColorsConstants.wholeBgColor)),
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const ImageIcon(
                                  AssetImage("assets/icons/ic_left_arrow.png"),
                                  size: 15,
                                )),
                            wSpacer(mWidth: size.width * 0.25),
                            Text(
                              "My Cart",
                              style: mTextStyle16(
                                  mFontColor:
                                      ColorsConstants.mainTitleFontColor,
                                  mWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        hSpacer(),
                        ListView.builder(
                            itemCount: 4,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: ListTile(
                                  key: ValueKey(index),
                                  minVerticalPadding: 0,
                                  horizontalTitleGap: 5,
                                  dense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 8),
                                  visualDensity: const VisualDensity(
                                      horizontal: 4, vertical: 4),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  tileColor: ColorsConstants.wholeBgColor,
                                  leading: Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.zero,
                                        color: ColorsConstants.bgLightColor,
                                        width: 80,
                                        height: 80,
                                      ),
                                      Positioned(
                                        top: 10,
                                        left: 10,
                                        bottom: 10,
                                        right: 10,
                                        child: Image.network(
                                          "https://images.freeimages.com/images/large-previews/3c5/rainbow-flag-1144037.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    ],
                                  ),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Name of product",
                                        style: mTextStyle12(
                                            mFontColor: ColorsConstants
                                                .mainTitleFontColor,
                                            mWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const ImageIcon(
                                            AssetImage(
                                                "assets/icons/ic_delete.png"),
                                            size: 15,
                                            color: Colors.red,
                                          ))
                                    ],
                                  ),
                                  subtitle: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Subtitle",
                                            style: mTextStyle12(),
                                          )
                                        ],
                                      ),
                                      hSpacer(mHeight: 2),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$ 120",
                                            style: mTextStyle12(
                                                mFontColor: ColorsConstants
                                                    .mainTitleFontColor),
                                          ),
                                          Container(
                                            width: 110,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: ColorsConstants
                                                    .bgLightColor,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border:
                                                    const Border.fromBorderSide(
                                                        BorderSide(
                                                  color: ColorsConstants
                                                      .wholeBgColor,
                                                ))),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  padding: EdgeInsets.zero,
                                                  onPressed: () {
                                                    setState(() {
                                                      if (_itemCount > 0) {
                                                        _itemCount--;
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                                    content: Text(
                                                                        "item should be grater then 0")));
                                                      }
                                                    });
                                                    print(
                                                        "tap on remove items ");
                                                  },
                                                  icon: const Icon(
                                                    Icons.remove,
                                                    fill: 1.0,
                                                    size: 12,
                                                    color: ColorsConstants
                                                        .mainTitleFontColor,
                                                  ),
                                                ),
                                                Text(
                                                  "$_itemCount",
                                                  textAlign: TextAlign.center,
                                                  style: mTextStyle12(
                                                      mFontColor: ColorsConstants
                                                          .mainTitleFontColor,
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
                                                    size: 12,
                                                    color: ColorsConstants
                                                        .mainTitleFontColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              )),
              hSpacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: size.width,
                  height: size.height / 4,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: ColorsConstants.wholeBgColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "SubTotal",
                              style: mTextStyle12(
                                  mFontColor:
                                      ColorsConstants.descriptionFontColor,
                                  mWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$ 120.00",
                              style: mTextStyle12(
                                  mFontColor:
                                      ColorsConstants.mainTitleFontColor,
                                  mWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "SubTotal",
                              style: mTextStyle16(
                                  mFontColor:
                                      ColorsConstants.mainTitleFontColor,
                                  mWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$ 120.00",
                              style: mTextStyle16(
                                  mFontColor:
                                      ColorsConstants.mainTitleFontColor,
                                  mWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
