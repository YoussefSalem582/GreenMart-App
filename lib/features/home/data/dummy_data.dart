import 'package:greenmart/features/home/data/product_model.dart';

List<ProductModel> offers = [
  ProductModel(
    id: '1',
    categoryId: '1',
    image:
        'https://www.vhv.rs/dpng/d/425-4254380_apples-png-image-apple-fruit-transparent-png.png',
    name: 'Apple',
    price: 10.0,
    quantityForPrice: "1kg",
  ),
  ProductModel(
    id: '2',
    categoryId: '1',
    image:
        'https://i.pinimg.com/originals/38/1f/ae/381fae890b6d2e3aef851949e261a13a.png',
    name: 'Banana',
    price: 20.0,
    quantityForPrice: "1kg",
  ),
  ProductModel(
    id: '3',
    categoryId: '1',
    image:
        'https://www.vhv.rs/dpng/d/425-4254380_apples-png-image-apple-fruit-transparent-png.png',
    name: 'Orange',
    price: 30.0,
    quantityForPrice: "1kg",
  ),

  ProductModel(
    id: '4',
    categoryId: '1',
    image:
        'https://static.vecteezy.com/system/resources/thumbnails/020/943/780/small/three-fresh-orange-carrots-isolated-with-clipping-path-and-shadow-in-file-format-close-up-of-healthy-vegetable-root-with-full-focus-png.png',
    name: 'Carrot',
    price: 10.0,
    quantityForPrice: "1kg",
  ),
];

List<ProductModel> bestSelling = [
  ProductModel(
    id: '2',
    categoryId: '1',
    image:
        'https://i.pinimg.com/originals/38/1f/ae/381fae890b6d2e3aef851949e261a13a.png',
    name: 'Banana',
    price: 20.0,
    quantityForPrice: "1kg",
  ),

  ProductModel(
    id: '3',
    categoryId: '1',
    image: 'https://pngimg.com/d/orange_PNG777.png',
    name: 'Orange',
    price: 30.0,
    quantityForPrice: "1kg",
  ),

  ProductModel(
    id: '4',
    categoryId: '1',
    image:
        'https://static.vecteezy.com/system/resources/thumbnails/020/943/780/small/three-fresh-orange-carrots-isolated-with-clipping-path-and-shadow-in-file-format-close-up-of-healthy-vegetable-root-with-full-focus-png.png',
    name: 'Carrot',
    price: 10.0,
    quantityForPrice: "1kg",
  ),
  ProductModel(
    id: '1',
    categoryId: '1',
    image:
        'https://www.vhv.rs/dpng/d/425-4254380_apples-png-image-apple-fruit-transparent-png.png',
    name: 'Apple',
    price: 10.0,
    quantityForPrice: "1kg",
  ),
];

List<ProductModel> allProducts = [
  ProductModel(
    id: '3',
    categoryId: '1',
    image: 'https://pngimg.com/d/orange_PNG777.png',
    name: 'Orange',
    price: 30.0,
    quantityForPrice: "1kg",
  ),
  ProductModel(
    id: '2',
    categoryId: '1',
    image:
        'https://i.pinimg.com/originals/38/1f/ae/381fae890b6d2e3aef851949e261a13a.png',
    name: 'Banana',
    price: 20.0,
    quantityForPrice: "1kg",
  ),

  ProductModel(
    id: '1',
    categoryId: '1',
    image:
        'https://www.vhv.rs/dpng/d/425-4254380_apples-png-image-apple-fruit-transparent-png.png',
    name: 'Apple',
    price: 10.0,
    quantityForPrice: "1kg",
  ),

  ProductModel(
    id: '4',
    categoryId: '2',
    image:
        'https://static.vecteezy.com/system/resources/thumbnails/020/943/780/small/three-fresh-orange-carrots-isolated-with-clipping-path-and-shadow-in-file-format-close-up-of-healthy-vegetable-root-with-full-focus-png.png',
    name: 'Carrot',
    price: 10.0,
    quantityForPrice: "1kg",
  ),
];

// get products by category id and return list of products that belongs to the category id
List<ProductModel> getProductsByCategoryId(String categoryId) {
  // convert search key to lowercase to make the search case insensitive
  return allProducts
      .where((product) => product.categoryId == categoryId)
      .toList();
  // List<ProductModel> filteredProducts = [];

  // for (var product in allProducts) {
  //   if (product.categoryId == categoryId) {
  //     filteredProducts.add(product);
  //   }
  // }
  // return filteredProducts;
}

// search products by name and return list of products that contains the search key in their name
List<ProductModel> getProductsByName(String searchKey) {
  // convert search key to lowercase to make the search case insensitive
  return allProducts
      .where((product) => product.name.toLowerCase().contains(searchKey))
      .toList();
}
