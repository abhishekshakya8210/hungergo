import 'package:flutter/material.dart';
import 'package:mind/detailpage/crudtutorial.dart.dart';

class Delete extends StatelessWidget {String id;
 Delete({super.key,
 required this.id,
 });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
         Crudtutorial().Delete(id);

    }, icon: Icon(Icons.delete,color: Colors.red,));
  }
}