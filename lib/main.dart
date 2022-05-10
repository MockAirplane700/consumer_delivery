
import 'package:consumer_delivery/custom_objects/menu.dart';
import 'package:flutter/material.dart';

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

class MySearchTest extends StatefulWidget{
  const MySearchTest({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MySearchTest> createState() => _MySearchTest();
}

class _MySearchTest extends State<MySearchTest> {
  // todo: implement the page here
  
  //the list of menu items : dummy list of database stub
  String _content = '';
  final myController = TextEditingController();
  List<Menu> cart = [] ;
  int count = 0;

  int _selectedIndex = 1;


  // static const List<Widget> _pages = <Widget>[
  //   Icon(
  //     Icons.person,
  //   ),
  //   Icon(Icons.menu),
  //   Icon(Icons.shopping_cart)
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //
  //     if (index == 0) {
  //       //go to order history
  //       Navigator.push(context, MaterialPageRoute(builder: context));
  //     } else if (index == 1) {
  //       // go to menu
  //     } else {
  //       // go to the cart
  //     } //end if-else
  //   });
  // }

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
    cart.add(menuObject);
  }
  
  List<Menu> getCart() {
    return cart;
  }

  List<Menu> menuItems = [
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

  List cartList = [
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

  int _selectedIndex = 2;

  //
  // static const List<Widget> _pages = <Widget>[
  //   Icon(
  //     Icons.person,
  //   ),
  //   Icon(Icons.menu),
  //   Icon(Icons.shopping_cart)
  // ];

  static const snackBar = SnackBar(
    content: Text('Please note this is a demo you cannot purchase anything here, if you like this app please contact us to acquire ut'),
  );
  @override
  Widget build(BuildContext context) {
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
                                cartList.remove(index);
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
                  children: const [
                    Expanded(child: Text('Base')),
                    Expanded(child: Text('\$ 30.99')),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(child: Text('Taxes')),
                    Expanded(child: Text('\$ 0.99')),
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
                  children: const [
                    Expanded(child: Text('Total')),
                    Expanded(child: Text('\$ 42.97' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                  ],
                ),
              ],
            ),
          ),
            ElevatedButton(
                onPressed: () {
                  // call the snackbar to let user know this is a demo
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text('Pay now')
            )
          ],
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

  final List<Menu> _list = [
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

  int _selectedIndex = 0;

  //
  // static const List<Widget> _pages = <Widget>[
  //   Icon(
  //     Icons.person,
  //   ),
  //   Icon(Icons.menu),
  //   Icon(Icons.shopping_cart)
  // ];

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
  List<Menu> searchResults = [
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


class Stub {
  List<Menu> menuItems = [
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

// class CustomBottomNavigationBar extends StatefulWidget {
//   // const CustomBottomNavigationBar({Key? key}) : super(key: key);
//   int _selectedIndex = 0;
//   CustomBottomNavigationBar(this._selectedIndex, {Key? key}) : super(key: key);
//
//   @override
//   _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState(_selectedIndex);
// }

// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   int _selectedIndex = 0;
//
//   _CustomBottomNavigationBarState(int selectedIndex,) {
//     _selectedIndex = selectedIndex;
//   }
//
//   // static const List<Widget> _pages = <Widget>[
//   //   Icon(
//   //     Icons.person,
//   //   ),
//   //   Icon(Icons.menu),
//   //   Icon(Icons.shopping_cart)
//   // ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//
//       if (index == 0) {
//         //go to order history
//         // Navigator.push(context, MaterialPageRoute(builder: context));
//       } else if (index == 1) {
//         // go to menu
//       } else {
//         // go to the cart
//       } //end if-else
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//             icon: Icon(Icons.person), label: 'Order history'),
//         BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
//         BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
//       ],
//       currentIndex: _selectedIndex,
//       onTap: _onItemTapped,
//     );
//   }
// }
