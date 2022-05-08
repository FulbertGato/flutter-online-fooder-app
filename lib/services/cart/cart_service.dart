import 'package:customer_app/models/burger.dart';

import '../../models/cartItem.dart';

class CartService {
  static Map<String, CartItem> cartItemMap = {};
  //caculer le total du panier
  static double getTotal() {
    double total = 0;

    cartItemMap.forEach((key, cartItem) {
      total += cartItem.totalPrice;
    });

    return total;
  }

  //ajouter un item au panier
  static void addItem(Burger burger) {
    CartItem cartItem = CartItem(
      imgPath: "assets/img/burger.png",
      title: burger.title,
      prix: burger.prix,
      duration: burger.duration,
      code: burger.code,
      quantity: 1,
      totalPrice: burger.prix,
    );

    if (cartItemMap.containsKey(burger.code)) {
      //si le code existe dans la Map, on ajoute 1 à la quantité
      cartItemMap[burger.code]!.quantity += 1;
      cartItemMap[burger.code]!.totalPrice =
          cartItemMap[burger.code]!.quantity * burger.prix;
    } else {
      //si le code n'existe pas dans la Map, on ajoute le code et la quantité au Map
      cartItemMap[burger.code] = cartItem;
    }
  }

  //add item to cart by code
  static void addItemByCode(String code) {
    if (cartItemMap.containsKey(code)) {
      //si le code existe dans la Map, on ajoute 1 à la quantité
      cartItemMap[code]!.quantity += 1;
      cartItemMap[code]!.totalPrice =
          cartItemMap[code]!.quantity * cartItemMap[code]!.prix;
    }
  }

//supprimer un item du panier par code
  static void removeItemByCode(String code) {
    if (cartItemMap.containsKey(code)) {
      //si le code existe dans la Map, on enleve 1 à la quantité
      cartItemMap[code]!.quantity -= 1;
      cartItemMap[code]!.totalPrice =
          cartItemMap[code]!.quantity * cartItemMap[code]!.prix;
    }
  }

  //supprimer un item du panier
  static void removeItem(String code) {
    cartItemMap.remove(code);
  }

  //vider le panier
  static void clearCart() {
    cartItemMap.clear();
  }

  //retourner le panier
  static Map<String, CartItem> getCart() {
    return cartItemMap;
  }

  // quantité de produit dans le panier
  static int getCartQuantity() {
    int quantity = 0;
    cartItemMap.forEach((key, cartItem) {
      quantity += cartItem.quantity;
    });
    return quantity;
  }
}
