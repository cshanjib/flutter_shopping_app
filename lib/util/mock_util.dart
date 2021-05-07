import 'package:flutter_shopping_app/ui/category/data/model/category_item.dart';
import 'package:flutter_shopping_app/ui/common/item/data/model/product_item.dart';

abstract class MockUtil {
  static List<CategoryItem> getMockAppCategories() {
    return [
      CategoryItem(
          title: "Fruits",
          imageUrl:
              "https://i.pinimg.com/originals/fa/07/04/fa0704ba240c7b884b9b7ee94157fb7d.png",
          theme: 0xFFF9E3FD),
      CategoryItem(
          title: "Vegetables",
          imageUrl:
              "https://www.pngjoy.com/pngl/123/2510559_funny-emoji-apple-emoji-broccoli-png-download.png",
          theme: 0xFFE9FBE5),
      CategoryItem(
          title: "Dairy",
          imageUrl:
              "https://cdn.iconscout.com/icon/free/png-256/cheese-1806482-1534540.png",
          theme: 0xFFFEFFE5),
      CategoryItem(
          title: "Meat",
          imageUrl: "https://img.icons8.com/emoji/452/cut-of-meat-emoji.png",
          theme: 0xFFFCEFEB),
      CategoryItem(
          title: "Seafood",
          imageUrl:
              "https://freepngimg.com/thumb/fish/11-fish-png-image-thumb.png",
          theme: 0xFFF9E3FD),
      CategoryItem(
          title: "Starch",
          imageUrl: "https://pngimg.com/uploads/corn/corn_PNG98638.png",
          theme: 0xFFF9E3FD),
    ];
  }

  static List<ProductItem> getTrendingItems() {
    return [
      ProductItem(
          name: "Cabbages",
          imageUrl:
              "https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/1502591/cabbage-clipart-md.png",
          currency: 9.9,
          currencyType: "\$",
          sellingUnit: "per piece",
          discount: 10),
      ProductItem(
          name: "Tomatoes",
          imageUrl: "https://pngimg.com/uploads/tomato/tomato_PNG12594.png",
          currency: 7.9,
          currencyType: "\$",
          sellingUnit: "per kg",
          discount: 10),
      ProductItem(
          name: "Potatoes",
          imageUrl:
              "https://www.freeiconspng.com/uploads/slice-of-potato-png-5.png",
          currency: 9.9,
          currencyType: "\$",
          sellingUnit: "per kg",
          discount: 10),
      ProductItem(
          name: "Strawberries",
          imageUrl: "https://www.freeiconspng.com/uploads/strawberry-png-9.png",
          currency: 9.9,
          currencyType: "\$",
          sellingUnit: "per kg",
          discount: 10)
    ];
  }

  static List<ProductItem> getFeaturedItems() {
    return [
      ProductItem(
          name: "Carrots",
          imageUrl:
              "https://www.transparentpng.com/thumb/carrot/71HwEm-fresh-carrot-photos.png",
          currency: 19.9,
          currencyType: "\$",
          sellingUnit: "per kg",
          discount: 10),
      ProductItem(
          name: "Banana",
          imageUrl:
              "https://www.pngkey.com/png/full/1009-10099133_banana-png-free-commercial-use-image-.png",
          currency: 7.9,
          currencyType: "\$",
          sellingUnit: "per kg",
          discount: 10),
      ProductItem(
          name: "Beef",
          imageUrl:
              "https://www.pngkey.com/png/full/36-368340_beef-transparent-background.png",
          currency: 49.9,
          currencyType: "\$",
          sellingUnit: "per kg",
          discount: 10),
      ProductItem(
          name: "Pineapple",
          imageUrl:
              "https://www.pngkey.com/png/full/6-67795_free-png-pineapple-png-images-transparent-pineapple-png.png",
          currency: 7,
          currencyType: "\$",
          sellingUnit: "per piece",
          discount: 5)
    ];
  }

  static List<ProductItem> getTopSellingItems() {
    return [
      ProductItem(
          name: "Peas",
          imageUrl: "http://pngimg.com/uploads/pea/small/pea_PNG24285.png",
          currency: 17.9,
          currencyType: "\$",
          sellingUnit: "per kg",
          discount: 7),
      ProductItem(
          name: "Chips",
          imageUrl:
              "http://www.pngall.com/wp-content/uploads/4/Potato-Chips-PNG-Clipart.png",
          currency: 7.9,
          currencyType: "\$",
          sellingUnit: "per kg",
          discount: 12),
      ProductItem(
          name: "Corn",
          imageUrl: "https://freepngimg.com/thumb/categories/951.png",
          currency: 49.9,
          currencyType: "\$",
          sellingUnit: "per kg",
          discount: 15),
      ProductItem(
          name: "Spinach",
          imageUrl:
              "https://dehatisabji.com/wp-content/uploads/2020/11/Spinach-All-Green-600x469-1.jpg",
          currency: 7,
          currencyType: "\$",
          sellingUnit: "per piece",
          discount: 5)
    ];
  }

  static List<String> getOfferBanners() {
    return [
      "https://www.kenresearch.com/uploads/posts/images/Herbal%20Products%20Market.jpg",
      "https://images.unsplash.com/photo-1506617564039-2f3b650b7010?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Z3JvY2VyeXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
      "https://apnafamilystore.com/shop-online-banner.jpg",
    ];
  }
}

// {
// "title": "Dairy",
// "imageUrl":
// "https://cdn.iconscout.com/icon/free/png-256/cheese-1806482-1534540.png",
// "theme": 0xFFFEFFE5
// },
// {
// "title": "Meat",
// "imageUrl": "https://img.icons8.com/emoji/452/cut-of-meat-emoji.png",
// "theme": 0xFFFCEFEB
// },
// {
// "title": "Vegetables",
// "imageUrl":
// "https://i.pinimg.com/originals/fa/07/04/fa0704ba240c7b884b9b7ee94157fb7d.png",
// "theme": 0xFFF9E3FD
// },
// {
// "title": "Dairy",
// "imageUrl":
// "https://cdn.iconscout.com/icon/free/png-256/cheese-1806482-1534540.png",
// "theme": 0xFFFEFFE5
// },
// {
// "title": "Meat",
// "imageUrl": "https://img.icons8.com/emoji/452/cut-of-meat-emoji.png",
// "theme": 0xFFFCEFEB
// }
