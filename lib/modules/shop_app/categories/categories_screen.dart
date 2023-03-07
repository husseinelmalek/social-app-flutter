
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/cubit/shop_cubit.dart';
import 'package:untitled/layout/shop_app/cubit/shop_states.dart';
import 'package:untitled/models/shop_app/categories_model.dart';
import 'package:untitled/shared/components/components.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {

      },
      builder:(context, state) =>  ListView.separated(
          itemBuilder:(context, index) => buildCatItem(ShopCubit.get(context).categoriesModel!.data.data[index]),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: ShopCubit.get(context).categoriesModel!.data.data.length),

    ) ;
  }
  Widget buildCatItem(CatModel model)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(image: NetworkImage(model.image),
          height: 100.0,
          width: 100.0,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 20,),
        Expanded(
          child: Text(model.name,
            

            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,

            ),
          ),
        ),

        IconButton(onPressed:(){}, icon: Icon(Icons.arrow_forward_ios)),
      ],
    ),
  );
}
