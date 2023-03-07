import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    // Product(
    //   id: 'p5',
    //   title: 'Afferguson',
    //   description: 'Firm by PWC',
    //   price: 99.99,
    //   imageUrl:
    //       'https://affco.com.pk/Content/PublicLayout/img/AFFCO-new-Logo1.png',
    // ),
  ];

  //var _showFavoritesOnly = false; //provider use

  List<Product> get items {
    //provider use
    // if(_showFavoritesOnly){
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItem {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    //previous implement in product detail screen
    return _items.firstWhere((prod) => prod.id == id);
  }
//.........for provider use
// void showFavoritesOnly() {
//   _showFavoritesOnly=true;
//   notifyListeners();
// }

// void showAll() {
//   _showFavoritesOnly = false;
//   notifyListeners();
// }

  void addProduct(Product product) {
    // _items.add(value);
    final newProduct = Product(
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      id: DateTime.now().toString(),
    );
    _items.add(newProduct);
    //_items.insert(0,newProduct);  // at the start of the list
    notifyListeners();
  }
  void updateProduct(String id, Product newProduct){
    final prodIndex = _items.indexWhere((prod) => prod.id== id );
    if(prodIndex >=0){
       _items[prodIndex] = newProduct;
       notifyListeners();
    }else{
      print('....');
    }
  }

  void deleteProduct(String id){
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}