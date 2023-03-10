
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/cubit/shop_cubit.dart';
import 'package:untitled/layout/shop_app/cubit/shop_states.dart';
import 'package:untitled/models/shop_app/categories_model.dart';
import 'package:untitled/models/shop_app/home_model.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/styles/colors.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {
        if(state is ShopSuccessFavoritesState){
          if(state.model.status == false){
            showToast(text: state.model.message!, state: ToastStates.ERROR);
          }

        }


      },
    builder: (context, state) {
      return ConditionalBuilder(
        condition: ShopCubit.get(context).homeModel != null && ShopCubit.get(context).categoriesModel != null,
        builder: (context) => productsBuilder(ShopCubit.get(context).homeModel!,ShopCubit.get(context).categoriesModel!,context),
        fallback: (context) => Center(child: CircularProgressIndicator()),
      );
    },
    );
  }
  Widget productsBuilder(HomeModel model, CategoriesModel categoriesModel,context) =>SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
            items: model.data.banners.map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),

                        ),
                        child: Image(
                          image: NetworkImage(e.image),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            ).toList(),
            options:CarouselOptions(
              height: 200.0,
              initialPage: 0,
              reverse: false,
              viewportFraction: 1.0,

              scrollDirection: Axis.horizontal,
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayInterval: Duration(seconds: 3),
              autoPlayCurve:Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
            ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Categories',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),

                    itemBuilder: (context, index) => buildCategoriesItem(categoriesModel.data.data[index]),
                    separatorBuilder: (context, index) => SizedBox(width: 10.0,),
                    itemCount: categoriesModel.data.data.length),
              ),

              SizedBox(
                height: 20.0,
              ),
              Text('New Categories',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(

          child: GridView.count(crossAxisCount: 2,
          shrinkWrap: true,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          childAspectRatio: 1 / 1.72,
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(model.data.products.length, (index) =>
          buildGridProduct(model.data.products[index],context),

          ),
          ),
        ),
      ],
    ),
  );

  Widget buildCategoriesItem(CatModel data) =>Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Image(image: NetworkImage(data.image),
        height: 100.0,
        width:100.0 ,
        fit: BoxFit.cover,
      ),
      Container(
        width: 100.0,
        color: Colors.black87.withOpacity(.6),
        padding: EdgeInsets.all(3.0),
        child: Text(
          
          data.name,
          textAlign: TextAlign.center,
          maxLines: 1,
          
          overflow: TextOverflow.ellipsis,
          style: TextStyle(

            color: Colors.white,
          ),
        ),
      ),
    ],
  );

  Widget buildGridProduct(ProductModel model, context) =>Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(image: NetworkImage(model.image),
              width: double.infinity,
              height: 200.0,
            ),
            if(model.discount !=0)
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
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                model.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14.0,
                height: 1.3,
              ),
              ),
              Row(
                children: [
                  Text(
                    '${model.price.round()}',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: defaultColor,
                    ),
                  ),
                  SizedBox(width: 5.0,),
                  if(model.discount !=0)
                    Text(
                    '${model.oldPrice.round()}',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: (){
                        ShopCubit.get(context).changeFavorites(model.id);

                      },
                      icon:CircleAvatar(
                        backgroundColor: ShopCubit.get(context).favorites[model.id] ==true ? defaultColor : Colors.grey,
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
  );

}
