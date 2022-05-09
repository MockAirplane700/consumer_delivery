// todo: create a menu object that holds the relevent information to make a selection

// import 'package:flutter/material.dart';

class Menu {
  //the string elements of the object
  String network_image = '', name_of_dish = '',description = '',special_instructions= '';
  double  price = 0.00; int amount = 1;

   Menu(String network_image, String name_of_dish,double price,String description,String special_instructions){
      this.network_image = network_image;
      this.name_of_dish = name_of_dish;
      this.description = description;
      this.special_instructions = special_instructions;
      this.price = price;
  }

  //getter and setter methods
  double get_price() {
     return price;
  }

  void set_amount(int amount) {
    this.amount = amount;
  }


}