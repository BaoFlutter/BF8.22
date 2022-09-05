import 'package:advanced_ui/resources/widgets/button_item.dart';
import 'package:advanced_ui/resources/widgets/description.dart';
import 'package:advanced_ui/resources/widgets/image_cover.dart';
import 'package:advanced_ui/resources/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // image cover
            ImageCover(assetImageUrl: "assets/images/lake.jpeg"),
            //  title
            TitleWidget(
                title: "Oschinen Lake Campground",
                address: "Kandersteg, Switzerland",
                rate: 41),
            // buttons
            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                      child: ButtonItem(
                         onPressed: (){
                           print("Calling");
                         },
                          iconData: Icons.call,
                          textButton: "call",
                          buttonColor: Colors.blue)),
                  Expanded(
                      flex: 1,
                      child: ButtonItem(
                          onPressed: (){
                            print("routing");
                          },
                          iconData: Icons.navigation,
                          textButton: "route",
                          buttonColor: Colors.blue)),
                  Expanded(
                      flex: 1,
                      child: ButtonItem(
                          onPressed: (){
                            print("Sharing");
                          },
                          iconData: Icons.share,
                          textButton: "share",
                          buttonColor: Colors.blue)),
                ],
              ),
            ),

            // description
            Description(text: "Um die ruhige Natur und die Wild- und Nutztiere in der Nacht an Oeschinen zu schützen, existiert ein richterliches Verbot welches das Campieren in der Region Oeschinensee verbietet. Die Ordnungsbusse bei Missachtung beträgt bis zu CHF 2000. Der Oeschinensee-Ranger ist täglich, auch am Abend auf Kontrollgängen im Einsatz, sucht das Gespräch und zieht im Extremfall die Polizei bei. ")
            

          ],
        ),
      ),
    );
  }
}
