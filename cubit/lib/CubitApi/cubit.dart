import 'dart:convert';
import 'package:cubit/CubitApi/models%C4%B1n%C4%B1f%C4%B1.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
// Model sınıflarının tanımlandığı dosya

abstract class Mystate {}

class InitialState extends Mystate {}

class LoadedState extends Mystate {
  List<Product> products;
  LoadedState({required this.products});
}

class ErrorState extends Mystate {
  String error;
  ErrorState({required this.error});
}

class CubitApiExample extends Cubit<Mystate> {
  CubitApiExample() : super(InitialState());

  Future<void> getDate() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products'));
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        List<Product> products = (result['products'] as List)
            .map((data) => Product.fromJson(data))
            .toList();
        emit(LoadedState(products: products));
      } else {
        emit(ErrorState(error: 'Failed to load products'));
      }
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
