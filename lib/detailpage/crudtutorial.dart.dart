import 'package:cloud_firestore/cloud_firestore.dart';

class Crudtutorial {
  final CollectionReference obj =
      FirebaseFirestore.instance.collection('hungergo');

  
  Future<void> OrderNaw(
    String name,
    String product,
    String productname,
    String city,
    String village,
    String number,
  ) {
    return obj.add({
      'NameAttribute': name,
      'ProductAttribute': product,
      'ProductnameAttribute': productname,
      'CityAttribute': city,
      'VillageAttribute': village,
      'NumberAttribute': number, 
    });
  }

  
  Stream<QuerySnapshot> CardScreen() {
    return obj.snapshots();
  }

  /// Update order by ID
  Future<void> Update(
    String id,
    String name,
    String product,
    String productname,
    String city,
    String village,
    String number,
  ) {
    return obj.doc(id).update({
      'NameAttribute': name,
      'ProductAttribute': product,
      'ProductnameAttribute': productname,
      'CityAttribute': city,
      'VillageAttribute': village,
      'NumberAttribute': number,
    });
  }

  /// Delete order by ID
  Future<void> Delete(String id) {
    return obj.doc(id).delete();
  }
}
