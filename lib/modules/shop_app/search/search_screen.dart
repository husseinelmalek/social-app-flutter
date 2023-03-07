
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/shop_app/search/cubit/search_cubit.dart';
import 'package:untitled/modules/shop_app/search/cubit/search_states.dart';
import 'package:untitled/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var formKey=GlobalKey<FormState>();
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => SearchCubit(),
        child: BlocConsumer<SearchCubit, SearchStates>(
          listener: (context, state) {

          },
          builder: (context, state) {
            return Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultTextField(controller: searchController, label: 'search', prefix: Icons.search, type: TextInputType.text,
                        validate: (value){
                      if(value.isEmpty){
                        return 'please enter an charactrer to search';
                      }else
                        return null;

                        },
                    onChange: (text) {
                        SearchCubit.get(context).getSearch(text);
                    },),
                    if (state is LoadingSearchState)
                    LinearProgressIndicator(),
                    if(state is SuccessSearchState)
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => buildListItem(SearchCubit.get(context).searchModel.data.data[index],
                              context,isOld: false),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount: SearchCubit.get(context).searchModel.data.data.length),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
