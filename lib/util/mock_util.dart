import 'package:flutter_shopping_app/ui/category/data/model/category_item.dart';

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
              "https://cdn.iconscout.com/icon/free/png-256/cheese-1806482-1534540.png",
          theme: 0xFFE9FBE5),
      CategoryItem(
          title: "Dairy",
          imageUrl:
              "https://i.pinimg.com/originals/fa/07/04/fa0704ba240c7b884b9b7ee94157fb7d.png",
          theme: 0xFFFEFFE5),
      CategoryItem(
          title: "Meat",
          imageUrl: "https://img.icons8.com/emoji/452/cut-of-meat-emoji.png",
          theme: 0xFFFCEFEB),
      CategoryItem(
          title: "Seafood",
          imageUrl: "https://freepngimg.com/thumb/fish/11-fish-png-image-thumb.png",
          theme: 0xFFF9E3FD),
      CategoryItem(
          title: "Starch",
          imageUrl:
              "https://pngimg.com/uploads/corn/corn_PNG98638.png",
          theme: 0xFFF9E3FD),
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
