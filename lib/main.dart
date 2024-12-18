import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/services.dart';
class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: "MY Calculator",
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey.shade800,
              centerTitle: true,
              shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)))),
          // Define the default brightness and colors.
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            // ···
            brightness: Brightness.dark,
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(color: Colors.white, fontSize: 25),
            bodyMedium: TextStyle(color: Colors.white, fontSize: 22),
          )),
      home: const FirstScreen(),
    );
  }
}

void main() {

  runApp(const Main());
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController T = TextEditingController();
  bool LastCharIsNumber = false;
  bool HasDot = false;

  @override
  Widget build(BuildContext context) {
    double Swidth=MediaQuery.of(context).size.width;
    double Shight=MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Calculator App"),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
                  child: TextField(
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                    maxLines: 5,
                    minLines: 1,
                    controller: T,
                    cursorColor: Colors.white,
                    enabled: false,
                    decoration: InputDecoration(
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 8, bottom: 8, top: 8),
                        child: Text("=", style: TextStyle(fontSize: 40)),
                      ),
                      fillColor: Colors.grey.shade800,
                      focusColor: Colors.grey.shade800,
                      hoverColor: Colors.grey.shade800,
                      filled: true,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                ),
                 SizedBox(height: Shight*0.15,),
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(50)),
                          color: Colors.grey.shade800),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (T.text[T.text.length - 1] == '.') {
                                      HasDot = false;
                                    }
                                    T.text =
                                        T.text.substring(0, T.text.length - 1);
                                    LastCharIsNumber = !LastCharIsNumber;
                                  },
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black87,
                                    child: Text(
                                      "D",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.lightBlue),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    LastCharIsNumber = true;
                                    T.text = "${T.text}7";
                                  },
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black87,
                                    child: Text(
                                      "7",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    LastCharIsNumber = true;

                                    T.text = "${T.text}4";
                                  },
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black87,
                                    child: Text(
                                      "4",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    LastCharIsNumber = true;

                                    T.text = "${T.text}1";
                                  },
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black87,
                                    child: Text(
                                      "1",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    LastCharIsNumber = true;

                                    T.text = "${T.text}0";
                                  },
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black87,
                                    child: Text(
                                      "0",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (T.text.isNotEmpty && LastCharIsNumber) {
                                      T.text = "${T.text}/";
                                      LastCharIsNumber = false;
                                      HasDot=false;

                                    }
                                  },
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black87,
                                    child: Text(
                                      "/",
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.lightBlue,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    LastCharIsNumber = true;

                                    T.text = "${T.text}8";
                                  },
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black87,
                                    child: Text(
                                      "8",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    LastCharIsNumber = true;

                                    T.text = "${T.text}5";
                                  },
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black87,
                                    child: Text(
                                      "5",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    LastCharIsNumber = true;

                                    T.text = "${T.text}2";
                                  },
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black87,
                                    child: Text(
                                      "2",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    LastCharIsNumber = true;

                                    T.text = "${T.text}000";
                                  },
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black87,
                                    child: Text(
                                      "000",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (T.text.isNotEmpty && LastCharIsNumber) {
                                      T.text = "${T.text}*";
                                      LastCharIsNumber = false;
                                      HasDot=false;

                                    }
                                  },
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black87,
                                    child: Text(
                                      "X",
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.lightBlue,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    LastCharIsNumber = true;

                                    T.text = "${T.text}9";
                                  },
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black87,
                                    child: Text(
                                      "9",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    LastCharIsNumber = true;

                                    T.text = "${T.text}6";
                                  },
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black87,
                                    child: Text(
                                      "6",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    LastCharIsNumber = true;

                                    T.text = "${T.text}3";
                                  },
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black87,
                                    child: Text(
                                      "3",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    if (T.text.isNotEmpty &&
                                        LastCharIsNumber &&
                                        !HasDot) {
                                      T.text = "${T.text}.";
                                      LastCharIsNumber = false;
                                      HasDot = true;

                                    }
                                  },
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black87,
                                    child: Text(
                                      ".",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    T.clear();
                                    LastCharIsNumber=false;
                                    HasDot=false;
                                  },
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black87,
                                    child: Text(
                                      "AC",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.lightBlue),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    if (T.text.isNotEmpty) {
                                      LastCharIsNumber = true;
                                      HasDot=false;

                                      T.text = "${T.text}-";
                                    }
                                  },
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black87,
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.lightBlue),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    if (T.text.isNotEmpty) {
                                      LastCharIsNumber = true;
                                      HasDot=false;

                                      T.text = "${T.text}+";
                                    }
                                  },
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black87,
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.lightBlue),
                                    ),
                                  ),
                                ),
                                InkWell(onTap: (){
                                  String expression = T.text;
                                  Parser p = Parser();
                                  Expression exp = p.parse(expression);
                                  double result = exp.evaluate(EvaluationType.REAL, ContextModel());
                                  T.text=result.toString();
                                  HasDot=true;
                                },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.lightBlue,
                                        borderRadius: BorderRadius.circular(50)),
                                    height: 130,
                                    // color: Colors.blue,
                                    width: 60,
                                    child: const Center(
                                        child: Text(
                                      "=",
                                      style: TextStyle(fontSize: 30),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                )
              ],
            )));
  }
}
// CustomScrollView(
// slivers: [
// SliverList(
// delegate: SliverChildListDelegate([
// // Other widgets
// OtherWidget1(),
// OtherWidget2(),
// ]),
// ),
// SliverFillRemaining(
// child: LastElementThatTakesRemainingSpace(),
// ),
// ],
// )
