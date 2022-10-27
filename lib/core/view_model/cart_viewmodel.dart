import 'package:wideal_app_flutter/core/service/database/cart_database_helper.dart';
import 'package:wideal_app_flutter/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;
  var dbHelper = CartDatabaseHelper.db;

  CartViewModel() {
    getAllProduct();
    // deleteProduct(int i);
  }

  getAllProduct() async {
    _loading.value = true;

    // var dbHelper = CartDatabaseHelper.db;
    _cartProductModel = await dbHelper.getAllProduct();
    print(_cartProductModel.length);
    _loading.value = false;
    getTotalPrice();
    update();
  }

  deleteAllProduct() async {
    _loading.value = false;

    // var dbHelper = CartDatabaseHelper.db;
    _cartProductModel = await dbHelper.deleteOptionTable();
    // print(_cartProductModel.length);
    //_loading.value = true;
    //getTotalPrice();
    update();
    getAllProduct();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quantity);
      print(_totalPrice);
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        // update();
        return;
      }
    }

    //var dbHelper = CartDatabaseHelper.db;
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totalPrice +=
        (double.parse(cartProductModel.price) * cartProductModel.quantity);
    update();
  }

  deleteProduct(CartProductModel cartProductModel) async {
    _loading.value = false;

    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        update();
        _cartProductModel = await dbHelper.udProduct(cartProductModel);

        return;
      }
    }
    // var dbHelper = CartDatabaseHelper.db;
    //_cartProductModel = await dbHelper.udProduct(index);

    //_totalPrice -= (double.parse(_cartProductModel[index].price));
    //await dbHelper.updateProduct(_cartProductModel[i]);
    update();
    getAllProduct();
    //_loading.value = true;

    // var dbHelper = CartDatabaseHelper.db;
    _cartProductModel = await dbHelper.getAllProduct();
    // print(_cartProductModel.length);
    update();
    getAllProduct();
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity++;
    _totalPrice += (double.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    _cartProductModel[index].quantity--;
    _totalPrice -= (double.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);

    update();
  }
}
