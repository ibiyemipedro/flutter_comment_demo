import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:schoolable_demo/res/colors.dart';
import 'package:schoolable_demo/res/sizes.dart';
import 'package:intl/intl.dart';



class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final inputController = TextEditingController();
  List<String> commentsList = [];
  ScrollController _scrollController = ScrollController();

  final String school = 'Vintage Height';
  final String date = '5 January 2020';

  @override
  Widget build(BuildContext context) {

    // screenWidth = WidgetsBinding.instance.window.physicalSize.width;
    // screenHeight = WidgetsBinding.instance.window.physicalSize.height;
    
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 0.12 * screenHeight,
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.arrow_back, color: Colors.black),
                Spacer(),
              ],
            ),
          ),
          Flexible(
            flex: 5,
            fit: FlexFit.loose,
            child: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Container(
                // margin: EdgeInsets.fromLTRB(0, 0.12 * screenHeight, 0, 0),
                height: 0.75 * screenHeight,
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Container(
                        height: 0.4 * screenHeight,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: screenWidth, 
                                child: AutoSizeText(
                                  'PTA Meeting',
                                  style: TextStyle(
                                    fontSize: textheadsize,
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                              ),
                              SizedBox(height:0.01 * screenHeight),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: backgroundColor,
                                      child: Icon(Icons.person, color: iconColor, size: 20),
                                    ),
                                  ),
                                  SizedBox(width:0.02 * screenWidth),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Text(school),
                                            SizedBox(width:0.03 * screenWidth),
                                            Container(
                                              height: 15,
                                              width: 1,
                                              color: iconColor,
                                            ),
                                            SizedBox(width:0.03 * screenWidth),
                                            Text(date)

                                          ],
                                        ),
                                        Text(
                                          'To You (Tolulope Saba)'
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height:0.02 * screenHeight),
                               Container(
                                width: screenWidth, 
                                child: Text(
                                  '1. We convert tuition payment from a yearly/termly commitment to a monthly subscription for parents while for schools.',
                                  style: TextStyle(
                                    fontSize: textbodysizesm,
                                  ),
                                )
                              ),
                              SizedBox(height:0.01 * screenHeight),
                               Container(
                                width: screenWidth, 
                                child: Text(
                                  '2. Schoolable combines school fees collection, expense management and online business banking all in one place.',
                                  style: TextStyle(
                                    fontSize: textbodysizesm,
                                  ),
                                )
                              ),
                              SizedBox(height:0.02 * screenHeight),
                              Container(
                                width: 0.5 * screenWidth,
                                decoration: BoxDecoration(
                                  color: backgroundColor2,
                                  borderRadius: BorderRadius.all( Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.calendar_today, color: themeColor,),
                                      SizedBox(width:0.03 * screenWidth),
                                      Text('Add to Calender', style: TextStyle(color: themeColor,),)
                                  ],
                                  ),
                                )
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverAppBar(
                      pinned: true,
                      elevation: 0.0,
                      backgroundColor: backgroundColor2,
                      actions: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Comments (' + commentsList.length.toString() + ')',
                            style: TextStyle(
                                color: iconColor, fontSize: textbodysize),
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                        var format = DateFormat.yMMMMd("en_US");
                        var now = format.format(DateTime.now());
                        if (index % 2 == 0) {
                          return _buildResponderComment(commentsList[index], school, now.toString());
                        } else {
                          return _buildUserComment(commentsList[index], 'You', now.toString());
                        }
                      }, childCount: commentsList.length))
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: backgroundColor,
              // margin: EdgeInsets.fromLTRB(0, 0.87 * screenHeight, 0, 0),
              height: 0.16 * screenHeight,
              child: Column(
                children: <Widget>[
                  SizedBox(height:0.01 * screenHeight),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 0.05 * screenWidth),
                      Container(
                        // padding: const EdgeInsets.only(left: 20.0, right: 10.0, top: 10.0),
                        width: 0.75 * screenWidth,
                        decoration: BoxDecoration(
                            color: backgroundColor2, //new Color.fromRGBO(255, 0, 0, 0.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            )),
                        child: TextField(
                          controller: inputController,
                          keyboardType: TextInputType.text,
                          style: TextStyle(fontSize: textbodysizesm),
                          decoration: InputDecoration(
                              hintText: 'Leave a comment',
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 10.0),
                        width: 0.2 * screenWidth,
                        child: GestureDetector(
                          onTap: () {
                            if (inputController.text.isNotEmpty) {
                              print(inputController.text);
                              setState(() {
                                commentsList.add(inputController.text);
                              });
                              inputController.text = '';
                              FocusScopeNode currentFocus = FocusScope.of(context);
                              currentFocus.unfocus();
                              Timer(
                                Duration(milliseconds: 300),
                                () => _scrollController
                                    .jumpTo(_scrollController.position.maxScrollExtent)
                              );
                            }
                          },
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: themeColor,
                            child: Icon(
                              Icons.near_me,
                              color: backgroundColor,
                              size: sendIconSize,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  // SizedBox(height:0.04 * screenHeight),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildUserComment(String message, String sender, String date) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Row(
        children: <Widget>[
          SizedBox(width: 0.25 * screenWidth),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(commentBorder),
                  topLeft: Radius.circular(commentBorder),
                  topRight: Radius.circular(commentBorder),
              ),
            ),
            child: Container(
              // height: 0.13 * screenHeight,
              width: 0.65 * screenWidth,
              decoration: BoxDecoration(
                color: themeColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(commentBorder),
                  topLeft: Radius.circular(commentBorder),
                  topRight: Radius.circular(commentBorder),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                    child: Text(
                      message,
                      style: TextStyle(fontSize: textinfosizesm, 
                      color: backgroundColor2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: backgroundColor,
                            child: Icon(Icons.person, color: backgroundColor2, size: 10),
                          ),
                        ),
                        SizedBox(width: 3),
                        Expanded(
                          child: AutoSizeText(
                            sender,
                            maxLines: 2,
                            style: TextStyle(fontSize: textinfosizesm,color: backgroundColor2),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: AutoSizeText(
                            date,
                            style: TextStyle(fontSize: textinfosizesm, color: backgroundColor2),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildResponderComment(String message, String sender, String date) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Row(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(commentBorder),
                  topLeft: Radius.circular(commentBorder),
                  topRight: Radius.circular(commentBorder),
              ),
            ),
            child: Container(
              width: 0.65 * screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                    child: Text(
                      message,
                      style: TextStyle(fontSize: textinfosizesm),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: backgroundColor,
                            child: Icon(Icons.person, color: iconColor, size: 10),
                          ),
                        ),
                        SizedBox(width: 3),
                        Expanded(
                          child: AutoSizeText(
                            sender,
                            maxLines: 2,
                            style: TextStyle(fontSize: textinfosizesm),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: AutoSizeText(
                            date,
                            style: TextStyle(fontSize: textinfosizesm),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 0.25 * screenWidth),
        ],
      ),
    );
  }
}
