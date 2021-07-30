import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstatem/aplication_color.dart';
import 'aplication_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ApplicationColor>(
        create: (BuildContext context) => ApplicationColor(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Consumer<ApplicationColor>(
                builder: (context, appllicationColor, _) => Text(
                      "Provider state management",
                      style: TextStyle(color: appllicationColor.color),
                    )),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<ApplicationColor>(
                  builder: (context, applicationColosr, _) => AnimatedContainer(
                    margin: EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    color: applicationColosr.color,
                    duration: Duration(milliseconds: 500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(margin: EdgeInsets.all(5), child: Text("AB")),
                    Consumer<ApplicationColor>(
                        builder: (context, applicationColors, _) => Switch(
                            value: applicationColors.isLightBlue,
                            onChanged: (newValue) {
                              applicationColors.isLightBlue = newValue;
                            })),
                    Container(margin: EdgeInsets.all(5), child: Text("LB")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
