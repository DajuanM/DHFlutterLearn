import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';// iOS风格组件
import 'package:http/http.dart' as http;
import 'dart:convert';

class MoviePage extends StatefulWidget {

  String url;
  MoviePage({Key key, this.url}): super(key: key);
  @override
  _MoviePageState createState() => _MoviePageState();

}

class _MoviePageState extends State<MoviePage> {

  var _scrollController = ScrollController();
  var alpha = 0.0;
  var data;

  @override
    void initState() {
      // TODO: implement initState
      _scrollController.addListener( () {
          var offset = _scrollController.position.pixels;
          setState(() {
              if (offset < 0) {
                alpha = 0;
              }else if (offset >= 450-(54+MediaQuery.of(context).padding.top)) {
                alpha = 1;
              }else {
                alpha = (offset / (450.0-(54+MediaQuery.of(context).padding.top)));
              }
          });
        }
      );
    super.initState();
    fechData();
  }

  Future<Null> fechData() async {
    String url = 'https://api.douban.com/v2/movie/${widget.url}';//26942674
    http.Response response = await http.get(url);
    setState(() {
        data = json.decode(response.body);
    });
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: <Widget>[
            createScrollView(),
            Container(
              color: Colors.blue.withOpacity(alpha),
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 64,
                child: Row(
                  children: <Widget>[
                    CupertinoButton(
                      // child: Image.asset('images/back_black.png'),
                      child: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Expanded(
                      child: Text('电影', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,),
                    ),
                    CupertinoButton(
                      child: Icon(Icons.share),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              height: 54+MediaQuery.of(context).padding.top,
            ),
          ],
        ),
      );
    }


    createScrollView() {
      if (data == null) {
        return Container();
      }
      return SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.blue,
                    child: SafeArea(
                      bottom: false,
                      child: Container(
                        margin: EdgeInsets.only(top: 64),
                        child: Center(
                          child: Image.network(
                            '${data['image']}',
                            width: 240,
                            height: 300,
                          ),
                        ),
                      ),
                    ),
                    height: 450,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                        margin: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('${data['alt_title']}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              Text('${data['attrs']['year'][0]} / ${data['attrs']['country'][0]}'),
                              Text('原名： ${data['title']}'),
                              Text('上映时间：${data['attrs']['pubdate'][0]}'),
                              Text('片长：${data['attrs']['movie_duration']}')
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        width: 80,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey[350],
                              blurRadius: 5
                            )
                          ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('豆瓣评分', style: TextStyle(color: Colors.grey, fontSize: 12)),
                            Text('${data['rating']['average']}', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                            Text('${data['rating']['numRaters']}人', style: TextStyle(color: Colors.grey[400], fontSize: 12))
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.orange, width: 1)
                        ),
                        child: CupertinoButton(child: Text('看过', style: TextStyle(fontSize: 15, color: Colors.orange)), onPressed: (){},padding: EdgeInsets.fromLTRB(20, 0, 20, 0),),
                        height: 40,
                      ),
                      Expanded(
                        child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.orange, width: 1)
                          ),
                          child: CupertinoButton(child: Text('想看', style: TextStyle(fontSize: 15, color: Colors.orange)), onPressed: (){},padding: EdgeInsets.all(0)),
                          height: 40,
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('电影简介', style: TextStyle(fontSize: 13, color: Colors.grey),),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            '${data['summary']}',
                            style: TextStyle(fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('影人', style: TextStyle(fontSize: 13, color: Colors.grey),),
                        Container(
                          height: 150,
                          margin: EdgeInsets.only(top: 10),
                          child: ListView.builder( 
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Column(
                                  children: <Widget>[
                                    Image.network(
                                      'https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1510229457.27.jpg',
                                      width: 80,
                                      height: 100,
                                    ),
                                    Text('温子仁', style: TextStyle(fontSize: 15)),
                                    Text('导演', style: TextStyle(fontSize: 13, color: Colors.grey),)
                                  ],
                                ),
                                width: 80,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
    }
}


// CustomScrollView(
//               slivers: <Widget>[
//                 SliverToBoxAdapter(
                //   child: Container(
                //     color: Colors.blue,
                //     child: SafeArea(
                //       bottom: false,
                //       child: Container(
                //         margin: EdgeInsets.only(top: 64),
                //         child: Center(
                //           child: Image.network(
                //             'https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p32853.jpg',
                //           ),
                //         ),
                //       ),
                //     ),
                //     height: 450,
                //   ),
                // ),
//                 SliverToBoxAdapter(
                  // child: Row(
                  //   children: <Widget>[
                  //     Expanded(
                  //       child: Container(
                  //       margin: EdgeInsets.all(16),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: <Widget>[
                  //             Text('海王', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  //             Text('2018 / 美国 / 澳大利亚 / 动作'),
                  //             Text('原名： Aquaman'),
                  //             Text('上映时间：2018-12-07'),
                  //             Text('片长：143分钟')
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       margin: EdgeInsets.only(right: 16),
                  //       width: 80,
                  //       height: 90,
                  //       decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         boxShadow: <BoxShadow>[
                  //           BoxShadow(
                  //             color: Colors.grey[350],
                  //             blurRadius: 5
                  //           )
                  //         ]
                  //       ),
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: <Widget>[
                  //           Text('豆瓣评分', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  //           Text('7.9', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  //           Text('2000人', style: TextStyle(color: Colors.grey[400], fontSize: 12))
                  //         ],
                  //       ),
                  //     )
                  //   ],
                  // ),
//                 ),
//                 SliverToBoxAdapter(
                  // child: Row(
                  //   children: <Widget>[
                  //     Container(
                  //       margin: EdgeInsets.all(16),
                  //       alignment: Alignment.center,
                  //       decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(8),
                  //         border: Border.all(color: Colors.orange, width: 1)
                  //       ),
                  //       child: CupertinoButton(child: Text('看过', style: TextStyle(fontSize: 15, color: Colors.orange)), onPressed: (){},padding: EdgeInsets.fromLTRB(20, 0, 20, 0),),
                  //       height: 40,
                  //     ),
                  //     Expanded(
                  //       child: Container(
                  //       alignment: Alignment.center,
                  //       margin: EdgeInsets.only(right: 16),
                  //       decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           borderRadius: BorderRadius.circular(8),
                  //           border: Border.all(color: Colors.orange, width: 1)
                  //         ),
                  //         child: CupertinoButton(child: Text('想看', style: TextStyle(fontSize: 15, color: Colors.orange)), onPressed: (){},padding: EdgeInsets.all(0)),
                  //         height: 40,
                  //       ),
                  //     )
                  //   ],
                  // ),
//                 ),
//                 SliverToBoxAdapter(
                  // child: Container(
                  //   margin: EdgeInsets.all(16),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: <Widget>[
                  //       Text('电影简介', style: TextStyle(fontSize: 13, color: Colors.grey),),
                  //       Text(
                  //         '少女伊西亚（塞伊拉·沃西 Zaira Wasim 饰）拥有着一副天生的好嗓子，对唱歌充满了热爱的她做梦都想成为一名歌星。然而，伊西亚生活在一个不自由的家庭之中，母亲娜吉玛（梅·维贾 Meher Vij 饰）常常遭到性格爆裂独断专横的父亲法鲁克（拉杰·阿晶 Raj Arjun 饰）的拳脚相向，伊西亚知道，想让父亲支持自己的音乐梦想是完全不可能的事情。 某日，母亲卖掉了金项链给伊西亚买了一台电脑，很快，伊西亚便发现，虽然无法再现实里实现梦想，但是网络中存在着更广阔的舞台。伊西亚录制了一段蒙着脸自弹自唱的视屏上传到了优兔网上，没想到收获了异常热烈的反响，著名音乐人夏克提（阿米尔·汗 Aamir Khan 饰）亦向她抛出了橄榄枝。',
                  //         style: TextStyle(fontSize: 15),
                  //       )
                  //     ],
                  //   ),
                  // ),
//                 ),
//                 SliverToBoxAdapter(
                  // child: Container(
                  //   margin: EdgeInsets.all(16),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: <Widget>[
                  //       Text('影人', style: TextStyle(fontSize: 13, color: Colors.grey),),
                  //       Container(
                  //         height: 150,
                  //         margin: EdgeInsets.only(top: 10),
                  //         child: ListView.builder( 
                  //           itemCount: 5,
                  //           scrollDirection: Axis.horizontal,
                  //           itemBuilder: (context, index) {
                  //             return Container(
                  //               child: Column(
                  //                 children: <Widget>[
                  //                   Image.network(
                  //                     'https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1510229457.27.jpg',
                  //                     width: 80,
                  //                     height: 100,
                  //                   ),
                  //                   Text('温子仁', style: TextStyle(fontSize: 15)),
                  //                   Text('导演', style: TextStyle(fontSize: 13, color: Colors.grey),)
                  //                 ],
                  //               ),
                  //               width: 80,
                  //             );
                  //           },
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
//                 )
//               ],
//             ),