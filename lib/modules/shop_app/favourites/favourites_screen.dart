
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/cubit/shop_cubit.dart';
import 'package:untitled/layout/shop_app/cubit/shop_states.dart';
import 'package:untitled/models/shop_app/favorites_data_model.dart';
import 'package:untitled/modules/shop_app/shop_register_screen/cubit/cubit.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/styles/colors.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
      },
      builder:(context, state) {
        return ConditionalBuilder(
          condition: state is! ShopLoadingGetFavState,
          builder: (context) =>
              ListView.separated(
                  itemBuilder: (context, index) =>
                      buildFavItem(ShopCubit
                          .get(context)
                          .favDataModel!
                          .data
                          .data[index], context),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: ShopCubit
                      .get(context)
                      .favDataModel!
                      .data
                      .data
                      .length),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },

    ) ;
  }

  Widget buildFavItem(FavoritesData favoritesData,context) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: 120.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(image: NetworkImage(favoritesData.product.image),
                width: 120.0,
                height: 120.0,
              ),
              if(favoritesData.product.discount !=0)
                Container(
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text('DISCOUNT',
                    style: TextStyle(
                      fontSize: 8.0,
                      color: Colors.white,
                    ),
                  ),
                )
            ],
          ),
          SizedBox(width: 20.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  favoritesData.product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                    height: 1.3,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      '${favoritesData.product.price}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: defaultColor,
                      ),
                    ),
                    SizedBox(width: 5.0,),
                    if(favoritesData.product.oldPrice !=0)
                      Text(
                        '${favoritesData.product.oldPrice}',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Spacer(),
                    IconButton(
                        onPressed: (){
                          ShopCubit.get(context).changeFavorites(favoritesData.product.id);

                        },
                        icon:CircleAvatar(
                          backgroundColor:ShopCubit.get(context).favorites[favoritesData.product.id] ==true ? defaultColor : Colors.grey,
                          //ShopCubit.get(context).favorites[model.id] ==true ? defaultColor : Colors.grey,
                          child: Icon(Icons.favorite_border,
                            size: 14.0,
                            color: Colors.white,
                          ),
                        )
                    ),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    ),
  );
}
