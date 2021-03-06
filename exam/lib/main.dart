import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

// import 'mpu_API.dart';

// import 'news.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


class httpParse{
  
  String? htmlToParse;


  void _getresponse() async{
    var response = await http.get(Uri.parse("https://new.mospolytech.ru/news/"));
    if(response.statusCode == 200){
      htmlToParse = response.body;
    }
  }

  void _getHtml(){
    _getresponse();
    if (htmlToParse != null){
      print(htmlToParse);
    }
  }
}



void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isBlock = false;

  httpParse html = new httpParse();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(html);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lebedev Exam"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isBlock = false;
                  print(isBlock);
                });
              },
              icon: const Icon(Icons.arrow_back_ios)),
          IconButton(
              onPressed: () {
                setState(() {
                  isBlock = true;
                  print(isBlock);
                });
              },
              icon: const Icon(Icons.arrow_forward_ios)),
        ],
      ),
      body: Container(
        child: isBlock == false ?
          ListView(
            children: [
              horizNews(),
              horizNews(),
              horizNews(),
              horizNews(),
              horizNews(),
              horizNews(),
              horizNews(),
              horizNews(),
              horizNews(),
              horizNews(),
            ],
          )
        :
        GridView.count(
            crossAxisCount: 2,
            children: [
              horizNews(),
              horizNews(),
              horizNews(),
              horizNews(),
              horizNews(),
              horizNews(),
              horizNews(),
              horizNews(),
              horizNews(),
              horizNews(),
            ],
          )
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(top: 35),
                child: Text('?????????? ????????????????',
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.normal)),
              ),
            ),
            Container(
              child: const Text(
                  '?????????????????????????????? ?????????????? ???? ???????????????????? \"???????????????????? ???????????????????? ?????????????????? ????????????????????\", ???????????????????? ?????????????? 12 ???????????? 2021 ??.',
                  style: TextStyle(
                    fontSize: 24,
                  )),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                color: Color(0xffffff),
                image: DecorationImage(
                  image: AssetImage("logo.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(top: 25),
              child: Text("??????????: lanton.1999@mail.ru"),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 25),
              child: ListTile(
                leading: const Text(
                  'link',
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () async {
                  await launch(
                      'https://github.com/alyumi/mobile_exam');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class horizNews extends StatefulWidget {
  const horizNews({ Key? key }) : super(key: key);

  @override
  _horizNewsState createState() => _horizNewsState();
}

class _horizNewsState extends State<horizNews> {
  


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('logo.jpg'),
          fit: BoxFit.fitHeight,
          alignment: Alignment.centerRight,
        ),
        border: Border(
          top: BorderSide(width: 1.0, color: Colors.purple),
          left: BorderSide(width: 1.0, color: Colors.purple),
          right: BorderSide(width: 1.0, color: Colors.purple),
          bottom: BorderSide(width: 1.0, color: Colors.purple),
        )
      ),
      child: Column(
        children: [
          Text('NAME'),
          Text('Content'),
        ],
      ),
    );
  }
}


class blockNews extends StatefulWidget {
  const blockNews({ Key? key }) : super(key: key);

  @override
  _blockNewsState createState() => _blockNewsState();
}

class _blockNewsState extends State<blockNews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}


// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   static const appTitle = 'Lebedev Exam';

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: appTitle,
//       home: MyHomePage(title: appTitle),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title)),
//       body: NewsContainer(),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Padding(
//                 padding: EdgeInsetsDirectional.only(top: 35),
//                 child: Text('?????????? ????????????????',
//                     style:
//                         TextStyle(fontSize: 35, fontWeight: FontWeight.normal)),
//               ),
//             ),
//             Container(
//               child: const Text(
//                   '?????????????????????????????? ?????????????? ???? ???????????????????? \"???????????????????? ???????????????????? ?????????????????? ????????????????????\", ???????????????????? ?????????????? 12 ???????????? 2021 ??.',
//                   style: TextStyle(
//                     fontSize: 24,
//                   )),
//             ),
//             Container(
//               height: 100,
//               width: 100,
//               decoration: const BoxDecoration(
//                 color: Color(0xffffff),
//                 image: DecorationImage(
//                   image: AssetImage("logo.jpg"),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsetsDirectional.only(top: 25),
//               child: Text("??????????: lanton.1999@mail.ru"),
//             ),
//             Padding(
//               padding: EdgeInsetsDirectional.only(top: 25),
//               child: ListTile(
//                 leading: const Text(
//                   'link',
//                   style: TextStyle(color: Colors.blue),
//                 ),
//                 onTap: () async {
//                   await launch(
//                       'https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NewsContainer extends StatefulWidget {
//   const NewsContainer({Key? key}) : super(key: key);

//   @override
//   _NewsContainerState createState() => _NewsContainerState();
// }

// class _NewsContainerState extends State<NewsContainer> {
//   bool isBlock = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Row(
//               children: [
//                 Expanded(
//                   child: ListTile(
//                     leading: const Icon(Icons.dangerous),
//                     onTap: () {
//                       setState(() {
//                         isBlock = false;
//                       });
//                     },
//                   ),
//                 ),
//                 Expanded(
//                   child: ListTile(
//                     leading: const Icon(Icons.access_alarm),
//                     onTap: () {
//                       setState(() {
//                         isBlock = true;
//                       });
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             child: isBlock == false ? listNews() : blockNews(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class listNews extends StatefulWidget {
//   const listNews({Key? key}) : super(key: key);

//   @override
//   _listNewsState createState() => _listNewsState();
// }

// class _listNewsState extends State<listNews> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: EdgeInsets.zero,
//       children: [
//         Card(
//           child: ListTile(
//             title: const Text('Item 1'),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         Card(
//           child: ListTile(
//             title: const Text('Item 1'),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// class blockNews extends StatefulWidget {
//   const blockNews({Key? key}) : super(key: key);

//   @override
//   _blockNewsState createState() => _blockNewsState();
// }

// class _blockNewsState extends State<blockNews> {
//   @override
//   Widget build(BuildContext context) {
//     return GridView(
//       children: [

//       ],
//     ),
//     );
//   }
// }
