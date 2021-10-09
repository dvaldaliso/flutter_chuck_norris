import '../models/Category.dart';

class Utils {
  static List<Category> get categorias {
    return [
      Category(
        tipo: 'animal',
        image: 'animal',
      ),
      Category(tipo: 'career', image: 'career'),
      Category(tipo: 'celebrity', image: 'celebrity'),
      Category(tipo: 'dev', image: 'dev'),
      Category(tipo: 'explicit', image: 'explicit'),
      Category(tipo: 'fashion', image: 'fashion'),
      Category(tipo: 'food', image: 'food'),
      Category(tipo: 'history', image: 'history'),
      Category(tipo: 'money', image: 'money'),
      Category(tipo: 'movie', image: 'movie'),
      Category(tipo: 'music', image: 'music'),
      Category(tipo: 'political', image: 'political'),
      Category(tipo: 'religion', image: 'religion'),
      Category(tipo: 'science', image: 'science'),
      Category(tipo: 'travel', image: 'travel')
    ];
  }
}
