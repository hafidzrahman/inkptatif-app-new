import 'package:flutter_riverpod/flutter_riverpod.dart';

class StorageNotifier extends StateNotifier<Map<dynamic, dynamic>> {
  StorageNotifier() : super({});

  void setData(Map<dynamic, dynamic> data) {
    state = {...data};
  }

  void addData(String key, dynamic value) {
    state = {...state, key : value};
  }

}

final storageProvider = StateNotifierProvider<StorageNotifier, Map<dynamic,dynamic>>((ref) {
    return StorageNotifier();
});

class IndexBottomNavBarNotifier extends StateNotifier<int> {
  IndexBottomNavBarNotifier() : super(0);

  void setIndex(int index) {
    state = index;
  }
}

final indexBottomNavBarNotifierProvider = StateNotifierProvider<IndexBottomNavBarNotifier, int>((ref) {
  return IndexBottomNavBarNotifier();
});


class StorageNilai extends StateNotifier<Map<dynamic, dynamic>> {
  StorageNilai() : super({});

  void addData(String key, dynamic value) {
    state = {...state, key : value};
  }

}

final storageNilaiProvider = StateNotifierProvider<StorageNilai, Map<dynamic, dynamic>>((ref) {
  return StorageNilai();
});
