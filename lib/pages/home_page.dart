import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttermytrip/dao/home_dao.dart';
import 'package:fluttermytrip/model/home_model_entity.dart';

const APPBAR_SCROLL_OFFSET = 100;
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double appBarAlpha = 0;
  String resultString = "";

  @override
  void initState(){
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {


    List _imageUrl = [
      "http://www.devio.org/io/flutter_app/img/banner/100h10000000q7ght9352.jpg",
      "https://dimg04.c-ctrip.com/images/300h0u000000j05rnD96B_C_500_280.jpg",
      "http://pages.ctrip.com/hotel/201811/jdsc_640es_tab1.jpg",
      "https://dimg03.c-ctrip.com/images/fd/tg/g1/M03/7E/19/CghzfVWw6OaACaJXABqNWv6ecpw824_C_500_280_Q90.jpg",
    ];



    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(context: context,
              removeTop: true,
              child: NotificationListener(
                onNotification: (scrollNotification){
                  //滚动且是列表滚动的时候
                  if(scrollNotification is ScrollNotification &&
                      scrollNotification.depth == 0){
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                  return;
                },
                child:ListView(
                  children: <Widget>[
                    Container(
                      height: 200 ,
                      child: Swiper(
                        itemCount: _imageUrl.length,
                        autoplay: true,
                        itemBuilder: (BuildContext context,int index){
                          return Image.network(
                            _imageUrl[index],
                            fit: BoxFit.fill ,
                          );
                        },
                        pagination: SwiperPagination(),
                      ),
                    )
                    ,Container(
                      height: 800,
                      child: ListTile(title: Text(resultString),),
                    )
                  ],
                ), )
          ),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(padding: EdgeInsets.only(top: 20),
                child: Text('首页'),),
            ),
          ),
          )
        ],
      )
    );
  }

  void _onScroll(double pixels) {
//    print(pixels);
    double alpha = pixels/APPBAR_SCROLL_OFFSET;
    if(alpha<0){
      alpha=0;
    }else if(alpha>1){
      alpha=1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(alpha);

  }

  void loadData() async{
//    HomeDao.fetch().then((result){
//      setState(() {
//        resultString = json.encode(result);
//      });
//    }).catchError((e){
//      setState(() {
//        resultString = e.toString();
//      });
//    });

   try{
     HomeModelEntity model = await HomeDao.fetch();
     setState(() {
       resultString = json.encode(model.config);
     });
   }catch(e){
     setState(() {
       resultString = e.toString();
     });
   }
  }


}
