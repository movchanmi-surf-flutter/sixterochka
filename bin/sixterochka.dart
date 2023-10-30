void main(List<String> arguments) {
  ProductFilter(products: data);
}

class RawProductItem {
  RawProductItem(
      {required this.name,
      required this.categoryName,
      required this.subcategoryName,
      required this.expirationDate,
      required this.qty});
  final String name;
  final String categoryName;
  final String subcategoryName;
  final DateTime expirationDate;
  final int qty;
}

class ProductFilter {
  ProductFilter({required this.products}) {
    products = removeExpired(products: products);
    prepareData();
  }
  List<RawProductItem> products;
  Set<String> categories = {};
  Set<String> subCategories = {};
  List<RawProductItem> removeExpired({required List<RawProductItem> products}) {
    return products.where((prod) {
      categories.add(prod.categoryName);
      subCategories.add(prod.subcategoryName);
      return prod.expirationDate.isAfter(DateTime.now()) && prod.qty > 0;
    }).toList();
  }

  void prepareData() {
    var data = [];
    for (final category in categories) {
      var categoryMap = {category: []};
      var subCatMaps = [];
      for (final subCat in subCategories) {
        var subCatMap = {
          subCat: products
              .where((e) => e.subcategoryName == subCat)
              .toList()
              .getProducts()
        };
        subCatMaps.add(subCatMap);
      }
      categoryMap[category] = subCatMaps;
      data.add(categoryMap);
    }
    print(data);
  }
}

extension on List<RawProductItem> {
  List<String> getProducts() {
    var productsNames = <String>[];
    for (final product in this) {
      productsNames.add(product.name);
    }
    return productsNames;
  }
}

final data = [
  RawProductItem(
    name: 'Персик',
    categoryName: 'Растительная пища',
    subcategoryName: 'Фрукты',
    expirationDate: DateTime(2024, 12, 22),
    qty: 5,
  ),
  RawProductItem(
    name: 'Молоко',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Напитки',
    expirationDate: DateTime(2024, 12, 22),
    qty: 5,
  ),
  RawProductItem(
    name: 'Кефир',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Напитки',
    expirationDate: DateTime(2024, 12, 22),
    qty: 5,
  ),
  RawProductItem(
    name: 'Творог',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Не напитки',
    expirationDate: DateTime(2024, 12, 22),
    qty: 0,
  ),
  RawProductItem(
    name: 'Творожок',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Не напитки',
    expirationDate: DateTime(2024, 12, 22),
    qty: 0,
  ),
  RawProductItem(
    name: 'Творог',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Не напитки',
    expirationDate: DateTime(2024, 12, 22),
    qty: 0,
  ),
  RawProductItem(
    name: 'Гауда',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Сыры',
    expirationDate: DateTime(2024, 12, 22),
    qty: 3,
  ),
  RawProductItem(
    name: 'Маасдам',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Сыры',
    expirationDate: DateTime(2024, 12, 22),
    qty: 2,
  ),
  RawProductItem(
    name: 'Яблоко',
    categoryName: 'Растительная пища',
    subcategoryName: 'Фрукты',
    expirationDate: DateTime(2024, 12, 4),
    qty: 4,
  ),
  RawProductItem(
    name: 'Морковь',
    categoryName: 'Растительная пища',
    subcategoryName: 'Овощи',
    expirationDate: DateTime(2024, 12, 23),
    qty: 51,
  ),
  RawProductItem(
    name: 'Черника',
    categoryName: 'Растительная пища',
    subcategoryName: 'Ягоды',
    expirationDate: DateTime(2024, 12, 25),
    qty: 0,
  ),
  RawProductItem(
    name: 'Курица',
    categoryName: 'Мясо',
    subcategoryName: 'Птица',
    expirationDate: DateTime(2024, 12, 18),
    qty: 2,
  ),
  RawProductItem(
    name: 'Говядина',
    categoryName: 'Мясо',
    subcategoryName: 'Не птица',
    expirationDate: DateTime(2024, 12, 17),
    qty: 0,
  ),
  RawProductItem(
    name: 'Телятина',
    categoryName: 'Мясо',
    subcategoryName: 'Не птица',
    expirationDate: DateTime(2024, 12, 17),
    qty: 0,
  ),
  RawProductItem(
    name: 'Индюшатина',
    categoryName: 'Мясо',
    subcategoryName: 'Птица',
    expirationDate: DateTime(2024, 12, 17),
    qty: 0,
  ),
  RawProductItem(
    name: 'Утка',
    categoryName: 'Мясо',
    subcategoryName: 'Птица',
    expirationDate: DateTime(2024, 12, 18),
    qty: 0,
  ),
  RawProductItem(
    name: 'Гречка',
    categoryName: 'Растительная пища',
    subcategoryName: 'Крупы',
    expirationDate: DateTime(2024, 12, 22),
    qty: 8,
  ),
  RawProductItem(
    name: 'Свинина',
    categoryName: 'Мясо',
    subcategoryName: 'Не птица',
    expirationDate: DateTime(2024, 12, 23),
    qty: 5,
  ),
  RawProductItem(
    name: 'Груша',
    categoryName: 'Растительная пища',
    subcategoryName: 'Фрукты',
    expirationDate: DateTime(2024, 12, 25),
    qty: 5,
  ),
];
