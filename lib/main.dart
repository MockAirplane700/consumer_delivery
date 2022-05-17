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

const primaryColor = Colors.deepPurple;

const primaryColorCard = Colors.white10;

const String dialogText = '';

const String about = '';

 void launchContact() {
  //todo: add url launcher function to contact the store
}

void main() {
  runApp(const MenuPage());
}

// please note that Search test is meant to be named Menu page
class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

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
  int count = 1;

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
        backgroundColor: primaryColor,
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
                              menuItems[index].set_amount(count);
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
                      autofocus: false,
                      decoration: const InputDecoration.collapsed(hintText: 'Special instructions'),
                    )
                  ],
                ),
                color: primaryColorCard,
              );
            },
          itemCount: menuItems.length,
        )
    ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: primaryColor),
                child: CircleAvatar(child: Icon(Icons.person, size: MediaQuery.of(context).size.width/5,))
            ),
            ListTile(
              title: const Text('Contact help'),
              onTap: () {
                //use url launcher to text help line
                launchContact();
                Navigator.pop(context,'');
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                // go to about page or show about dialog box
                Navigator.pop(context,'');
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Alert dialogue'),
                      content: const Text(about),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context, 'Cancel'), child: const Text('Cancel')),
                        TextButton(onPressed: () => Navigator.pop(context,'OK'),child: const Text('Ok'),)
                      ],
                    )
                );

              },
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuPage()));
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
        backgroundColor: primaryColor,
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
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Image.network(menuItem.network_image),
                              fit: FlexFit.loose,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width/40,
                            ),
                            Flexible(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text( menuItem.name_of_dish.toString()),
                                Text('Price: \$' + menuItem.price.toString() ),
                                Text('Quantity: ' + menuItem.amount.toString())
                              ],
                            ),
                              fit: FlexFit.loose,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width/10,
                            ),
                            Flexible(
                                child: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                // display dialogue box to enter new amount
                              },
                            ),
                              fit: FlexFit.loose,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width/10,
                            ),
                            Flexible(
                                child: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                //delete the list item
                                setState(() {
                                  TemporaryCart.removeFromCart(index);
                                });
                              },
                            ),
                              fit: FlexFit.loose,
                            )
                          ],
                        ),
                        color: primaryColorCard,
                      );
                    }),
              ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Flexible(
                              child: Text('Base'),
                            fit: FlexFit.loose,
                          ),
                          Flexible(child: Text('      \$' + total), fit: FlexFit.loose),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          const Flexible(child: Text('Taxes'), fit: FlexFit.loose,),
                          Flexible(child: Text('      \$' + TemporaryCart.getTaxes().toString()),fit: FlexFit.loose),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,

                        children: const [
                          Flexible(child: Text('Delivery fee'),fit: FlexFit.loose),
                          Flexible(child: Text('      \$10.99'),fit: FlexFit.loose),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          const Flexible(child: Text('Total'),fit: FlexFit.loose),
                          Flexible(child: Text('      \$' + TemporaryCart.getTotalAmount(TemporaryCart.getTotal(), TemporaryCart.getTaxes(), 10).toString() , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),fit: FlexFit.loose),
                        ],
                      ),
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
                    //show a dialog box that shows a message informing the user of the state
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Alert dialogue'),
                          content: const Text('Alert'),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(context, 'Cancel'), child: const Text('Cancel')),
                            TextButton(onPressed: () => Navigator.pop(context,'OK'),child: const Text('Ok'),)
                          ],
                        )
                    );
                    send();
                  },
                  child: const Text('Pay now')
              )
            ],
          ),
        ),
        ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(color: primaryColor),
                child: CircleAvatar(child: Icon(Icons.person, size: MediaQuery.of(context).size.width/5,))
            ),
            ListTile(
              title: const Text('Contact help'),
              onTap: () {
                //use url launcher to text help line
                launchContact();
                Navigator.pop(context,'');
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                // go to about page or show about dialog box
                Navigator.pop(context,'');
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Alert dialogue'),
                      content: const Text(about),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context, 'Cancel'), child: const Text('Cancel')),
                        TextButton(onPressed: () => Navigator.pop(context,'OK'),child: const Text('Ok'),)
                      ],
                    )
                );

              },
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuPage()));
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
        backgroundColor: primaryColor,
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
                color:primaryColorCard,
              );
            },
          itemCount: _list.length,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(color: primaryColor),
                child: CircleAvatar(child: Icon(Icons.person, size: MediaQuery.of(context).size.width/5,))
            ),
            ListTile(
              title: const Text('Contact help'),
              onTap: () {
                //use url launcher to text help line
                launchContact();
                Navigator.pop(context,'');
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                // go to about page or show about dialog box
                Navigator.pop(context,'');
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Alert dialogue'),
                      content: const Text(about),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context, 'Cancel'), child: const Text('Cancel')),
                        TextButton(onPressed: () => Navigator.pop(context,'OK'),child: const Text('Ok'),)
                      ],
                    )
                );

              },
            )
          ],
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuPage()));
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





