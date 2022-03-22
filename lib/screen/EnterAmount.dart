import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screen/Navbar.dart';
import 'package:flutter_application_1/screen/SearchPage.dart';
import 'package:http/http.dart';

class EnterAmount extends StatelessWidget {
  const EnterAmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //     debugShowCheckedModeBanner: false,

      /*     home: */
      body: Container(
        child: Calculator(),
      ),
    );
  }
}

dynamic re = '0';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic displaytxt = 20;
  //Button Widget
  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          calculation(btntxt);
        },
        child: Text(
          '$btntxt',
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        //     shape: CircleBorder(),
        shape: RoundedRectangleBorder(),

        color: btncolor,
        padding: EdgeInsets.all(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Calculator
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Navbar(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        backgroundColor: primaryColor,
        title: Image.asset(
          "assets/images/RakutenPay.jpg",
          fit: BoxFit.cover,
          height: 30,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Calculator display
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '$text',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 100,
                      ),
                    ),
                  ),
                  /*    Center(
                    child: Text(
                      "Pay " + contact.toString(),
                      style: TextStyle(
                          color: Colors
                              .black), // put this at the top with some changes and we will know whom we are paying to
                    ), // DELETE THIS CHILD IF IT DOESNT WORK
                  ), */
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            width: 150,
                            height: 60,
                            child: FloatingActionButton.extended(
                              onPressed: () {
                                //               calculation('=');
                                Navigator.of(context).pushNamed(
                                    // "/ConfirmPayment" /* Name of the page from the routes used  */
                                    "/ConfirmPayment");
                              },
                              backgroundColor: Colors.red,
                              extendedTextStyle: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                              label: Text("Pay"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('C', Colors.white, Colors.black),
                calcbutton('0', Colors.white, Colors.black),
                calcbutton('.', Colors.white, Colors.black),
//                calcbutton('/', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('1', Colors.white, Colors.black),
                calcbutton('2', Colors.white, Colors.black),
                calcbutton('3', Colors.white, Colors.black),
                //              calcbutton('x', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('4', Colors.white, Colors.black),
                calcbutton('5', Colors.white, Colors.black),
                calcbutton('6', Colors.white, Colors.black),
                //               calcbutton('-', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('7', Colors.white, Colors.black),
                calcbutton('8', Colors.white, Colors.black),
                calcbutton('9', Colors.white, Colors.black),
                //              calcbutton('+', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  //Calculator logic
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    if (btnText == 'C') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
    } else if (btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
    print("printing....");
    print(text);
    res = text;
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }

    return result;
  }
}
