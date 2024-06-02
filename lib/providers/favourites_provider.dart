import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavouriteMealsNotifier() : super([]);
  bool toggleMealFavouriteStatus(Meal meal){
    final exists = state.contains(meal);
    if(exists){
      state = state.where((m) => meal.id!=m.id).toList();
      return false;
    }
    else{
      state = [...state,meal];
      return true;
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavouriteMealsNotifier,List<Meal>>((ref){
  return FavouriteMealsNotifier();
});