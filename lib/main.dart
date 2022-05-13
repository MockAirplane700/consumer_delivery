/*
  TODO: CHECK FOR UPDATED PACKAGE 
  The plugin `flutter_email_sender` uses a deprecated version of the Android embedding.
To avoid unexpected runtime failures, or future build failures, try to see if this plugin supports the Android V2 embedding.
 Otherwise, consider removing it since a future release of Flutter will remove these deprecated APIs
 */


import 'package:consumer_delivery/custom_objects/menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

const snackBar = SnackBar(
  content: Text('Please note this is a demo you cannot purchase anything here, if you like this app please contact us to acquire ut'),
);


void main() {
  runApp(const SearchTest());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// please note that Search test is meant to be named Menu page
class SearchTest extends StatelessWidget {
  const SearchTest({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MySearchTest(title: 'Menu'),
    );
  }
}

//------------------------------------------TEMPORARY CLASSES---------------------------------------
class TemporaryCart {
  static List<Menu> _cart = [];

  static void addToCart(Menu menu) {
    _cart.add(menu);
  }

  static List<Menu> getCart() {
    return _cart;
  }

  static void removeFromCart(int index) {
    _cart.removeAt(index);
  }

  static int getTotal() {
    double total = 0;
    for (int k =0; k< _cart.length; k++) {
      total += _cart[k].price;
    }
    return total.toInt();
  }

  static int getTaxes(){
    double total = 0;
    for (int k =0; k< _cart.length; k++) {
      total += _cart[k].price;
    }
    double result = 0.13 * total;
    return result.toInt();
  }

  static int getTotalAmount(int total, int taxes, int delivery){
    return total + taxes + delivery;
  }
}
class BackendData{
  //todo: get the data of menu items from the server
 static List<Menu> getMenuItems() {
    return <Menu>[
      Menu(
        'https://charismaofindia.ca/wp-content/uploads/2020/12/Butter_Chicken_3_FM.jpg',
        'Some dish',
        90.00,
        'Boneless pieces of baked tandoor chicken, blended with exotic spices',
        'lorem ipsum',
      ),
      Menu(
        'https://charismaofindia.ca/wp-content/uploads/2020/12/Butter_Chicken_3_FM.jpg',
        'Some dish2',
        90.00,
        'Boneless pieces of baked tandoor chicken, blended with exotic spices',
        'lorem ipsum',
      ),
      Menu(
        'https://charismaofindia.ca/wp-content/uploads/2020/12/Butter_Chicken_3_FM.jpg',
        'Some dish3',
        90.00,
        'Boneless pieces of baked tandoor chicken, blended with exotic spices',
        'lorem ipsum',
      ),
    ];
  }

  //todo: place the order at the server, this means decrease the stock amount from server and send confirmation email
}
class TemporaryOrderHist {
  static List<Menu> _orderHistory = [];

  static List<Menu> getOrderHistory(){
    return _orderHistory;
  }

  static void addToHistory(Menu menu) {
    _orderHistory.add(menu);
  }

  static void setNewOrderHistory(List<Menu> value){
    _orderHistory = value;
  }
}
//--------------------------------------------TEMPORARY CLASSES-----------------------------------------
class MySearchTest extends StatefulWidget{
  const MySearchTest({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MySearchTest> createState() => _MySearchTest();
}

class _MySearchTest extends State<MySearchTest>{
  // todo: get the menu data from the server - consumer delivery
  
  //the list of menu items : dummy list of database stub
  String _content = '';
  final myController = TextEditingController();
  List<Menu> cart = [] ;
  int count = 0;

  int _selectedIndex = 1;


  @override
  void initState() {
    //start listening to the changes
    super.initState();
    myController.addListener(_handleChanges);
  }

  void _handleChanges () {
    setState(() {
      _content = myController.text;
    });
  }

  void addToCart(Menu menuObject) {
    int amountToBeSet = count;
    menuObject.set_amount(amountToBeSet);
    TemporaryCart.addToCart(menuObject);
    // cart.add(menuObject);
  }
  
  List<Menu> getCart() {
    return TemporaryCart.getCart();
  }

  List<Menu> menuItems = BackendData.getMenuItems();
  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: () {
            showSearch(
              context: context,
              delegate: MySearchDelegate()
            );
          }, icon: const Icon(Icons.search))
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemBuilder: (context,index){
              final selection = menuItems[index];
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(selection.network_image),
                    Text(selection.name_of_dish),
                    Text(selection.description),
                    Row(
                      //todo: implement the counter input to find out how many orders of the thing they want
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              //decrease the count by 1
                              setState(() {
                                count -=1;
                              });
                            },
                            icon: const Icon(Icons.remove)
                        ),
                        Text(count.toString()),
                        IconButton(
                            onPressed: () {
                              // increment the count
                              setState(() {
                                count+=1;
                              });
                            }, 
                            icon: const Icon(Icons.add)
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              addToCart(menuItems[index]);
                            },
                            child: const Text('add to cart')
                        )
                      ],
                    ),
                    TextField(
                      onChanged: (String value) {
                        setState(() {
                          _content = value;
                          selection.special_instructions = _content;
                        });
                      },
                      autofocus: true,
                    )
                  ],
                ),
              );
            },
          itemCount: menuItems.length,
        )
    ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Order history'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;

            if (index == 0) {
              //go to order history
              Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderHistory()));
            } else if (index == 1) {
              // go to menu
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchTest()));
            } else {
              // go to the cart
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Checkout()));

            } //end if-else
          });
        },
      ),
    );
  }
}

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyCheckout(),
    );
  }

}

class MyCheckout extends StatefulWidget {
  const MyCheckout({Key? key}) : super(key: key);

  @override
  _MyCheckoutState createState() => _MyCheckoutState();
}

class _MyCheckoutState extends State<MyCheckout> {

  List cartList = TemporaryCart.getCart();

  int _selectedIndex = 2;
  
  final _recipentController = TextEditingController(
    text: 'mthandazo99@gmail.com'
  );
  
  final _subjectController = TextEditingController(
    text: 'Order: 21453'
  );
  
  final _bodyController = TextEditingController(
    text: 'Order placed at 17:50'
        'Order: Some dish '
        'Quantity: 1'
        'Price: \$ 15.00'
  );
  
  Future<void> send() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipentController.text],
      isHTML: false
    );
    
    String platformResponse;
    
    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    }catch (error) {
      if (kDebugMode) {
        print(error);
      }
      platformResponse = error.toString();
    }
    
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(platformResponse))
    );
  }

  static const snackBar = SnackBar(
    content: Text('Please note this is a demo you cannot purchase anything here, if you like this app please contact us to acquire ut'),
  );
  @override
  Widget build(BuildContext context) {
    String total = 'v';
    if (TemporaryCart.getCart() == null ){
      total = ' ';
    }else{
      total = TemporaryCart.getTotal().toString();

    }
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Cart'),
        actions: [
          IconButton(onPressed: () {
            showSearch(
                context: context,
                delegate: MySearchDelegate()
            );
          }, icon: const Icon(Icons.search))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height/2,
                child: ListView.builder(
                  itemCount: cartList.length,
                    itemBuilder: (context, index) {
                      Menu menuItem = cartList[index];
                      return Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.network(menuItem.network_image),
                            ),
                            Expanded(child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Name: ' + menuItem.name_of_dish.toString()),
                                Text('Price: \$' + menuItem.price.toString() ),
                                Text('Quantity: ' + menuItem.amount.toString())
                              ],
                            )),
                            Expanded(child: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                // display dialogue box to enter new amount
                              },
                            )),
                            Expanded(child: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                //delete the list item
                                setState(() {
                                  TemporaryCart.removeFromCart(index);
                                });
                              },
                            ))
                          ],
                        ),
                      );
                    }),
              ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(child: Text('Base')),
                      Expanded(child: Text('\$ ' + total)),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(child: Text('Taxes')),
                      Expanded(child: Text('\$ + ' + TemporaryCart.getTaxes().toString())),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Expanded(child: Text('Delivery fee')),
                      Expanded(child: Text('\$ 10.99')),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(child: Text('Total')),
                      Expanded(child: Text('\$ + ' + TemporaryCart.getTotalAmount(TemporaryCart.getTotal(), TemporaryCart.getTaxes(), 10).toString() , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                    ],
                  ),
                ],
              ),
            ),
              ElevatedButton(
                  onPressed: () {
                    // call the snackbar to let user know this is a demo
                    TemporaryOrderHist.setNewOrderHistory(TemporaryCart.getCart());
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    send();
                  },
                  child: const Text('Pay now')
              )
            ],
          ),
        ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Order history'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;

            if (index == 0) {
              //go to order history
              Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderHistory()));
            } else if (index == 1) {
              // go to menu
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchTest()));
            } else {
              // go to the cart
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Checkout()));

            } //end if-else
          });
        },
      ),
      );
  }
}



class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyOrderHistory(),
    );
  }
}


class MyOrderHistory extends StatefulWidget {
  const MyOrderHistory({Key? key}) : super(key: key);

  @override
  _MyOrderHistoryState createState() => _MyOrderHistoryState();
}

class _MyOrderHistoryState extends State<MyOrderHistory> {
  //todo: save the order history on the device storage, use firebase for login information
  final List<Menu> _list = TemporaryOrderHist.getOrderHistory();

  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Order History'),
        actions: [
          IconButton(onPressed: () {
            showSearch(
                context: context,
                delegate: MySearchDelegate()
            );
          }, icon: const Icon(Icons.search))
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemBuilder: (context,index) {
              Menu menuObject = _list[index];
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Expanded(child: Text('Name ')),
                        Expanded(child: Text(menuObject.name_of_dish))
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(child: Text('Quantity ')),
                        Expanded(child: Text(menuObject.amount.toString()))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              TemporaryCart.addToCart(_list[index]);
                            },
                            child: const Text('Reorder')
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          itemCount: _list.length,
        ),
      ),
      bottomNavigationBar:  BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Order history'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;

            if (index == 0) {
              //go to order history
              Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderHistory()));
            } else if (index == 1) {
              // go to menu
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchTest()));
            } else {
              // go to the cart
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Checkout()));

            } //end if-else
          });
        },
      ),
    );
  }
}




class MySearchDelegate extends SearchDelegate {
  
  //list of search results or data to be searched
  List<Menu> searchResults = BackendData.getMenuItems();
  int count = 0;
  String _content = "Enter special instructions";
  
  String geDishNameFromMenu(String item) {
    for (int value = 0; searchResults.length < value; value++){
      if (searchResults[value].name_of_dish.toLowerCase() == (item.toLowerCase())) {
        return searchResults[value].name_of_dish;
      }else{
        return "";
      }
    }
    return "";
  }

  String geDishNetImageFromMenu(String item) {
    for (int value = 0; searchResults.length < value; value++){
      if (searchResults[value].network_image.toLowerCase() == (item.toLowerCase())) {
        return searchResults[value].network_image;
      }else{
        return "";
      }
    }
    return "";
  }

  String geDishDescriptFromMenu(String item) {
    for (int value = 0; searchResults.length < value; value++){
      if (searchResults[value].description.toLowerCase() == (item.toLowerCase())) {
        return searchResults[value].description;
      }else{
        return "";
      }
    }
    return "";
  }

  String geDishPriceFromMenu(String item) {
    for (int value = 0; searchResults.length < value; value++){
      if (searchResults[value].price.toString().toLowerCase() == (item.toLowerCase())) {
        return searchResults[value].price.toString();
      }else{
        return "";
      }
    }
    return "";
  }

  String geDishAmountMenu(String item) {
    for (int value = 0; searchResults.length < value; value++){
      if (searchResults[value].amount.toString().toLowerCase() == (item.toLowerCase())) {
        return searchResults[value].amount.toString();
      }else{
        return "";
      }
    }
    return "";
  }

  String geDishSpecialInstructionsMenu(String item) {
    for (int value = 0; searchResults.length < value; value++){
      if (searchResults[value].special_instructions.toLowerCase() == (item.toLowerCase())) {
        return searchResults[value].special_instructions;
      }else{
        return "";
      }
    }
    return "";
  }
  @override
  List<Widget>? buildActions(BuildContext context) => [IconButton(
      onPressed: () {query = '';},
      icon: const Icon(Icons.clear) )];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back));
  //todo: query can only be a string hence use the name to id the menu item in the list and display that
  @override
  Widget buildResults(BuildContext context) => Center(
    child:  Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(geDishNetImageFromMenu(query)),
          Text(geDishDescriptFromMenu(query)),
          Row(
            //todo: implement the counter input to find out how many orders of the thing they want
            crossAxisAlignment:  CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    //decrease the count by 1
                    count -=1;
                  },
                  icon: const Icon(Icons.remove)
              ),
              Text(count.toString()),
              IconButton(
                  onPressed: () {
                    // increment the count
                    count+=1;
                  },
                  icon: const Icon(Icons.add)
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Text('add to cart')
              )
            ],
          ),
          TextField(
            onChanged: (String value) {
              _content = value;
              //todo : set special instructions
            },
            autofocus: true,
          )
        ],
      ),
    ),
  );

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<Menu> suggestions = searchResults.where((searchResult) {
      final result = searchResult.name_of_dish.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    //we return a list view builder
    return ListView.builder(
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          //we build each suggestion as a list tile
          return ListTile(
            title:  Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(suggestion.network_image),
                  Text(suggestion.description),
                  Row(
                    //todo: implement the counter input to find out how many orders of the thing they want
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            //decrease the count by 1
                              count -=1;
                          },
                          icon: const Icon(Icons.remove)
                      ),
                      Text(count.toString()),
                      IconButton(
                          onPressed: () {
                            // increment the count
                              count+=1;
                          },
                          icon: const Icon(Icons.add)
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                          //todo: add snack bar
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                          child: const Text('add to cart')
                      )
                    ],
                  ),
                  TextField(
                    onChanged: (String value) {
                        _content = value;
                        suggestion.special_instructions = _content;
                    },
                    autofocus: true,
                  )
                ],
              ),
            ),
            onTap: () {
              query = suggestions[index].name_of_dish;
              showResults(context);
            },

          );
        },
      itemCount: suggestions.length,
    );
  }
  
}





