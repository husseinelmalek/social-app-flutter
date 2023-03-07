
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/cubit/shop_cubit.dart';
import 'package:untitled/layout/shop_app/cubit/shop_states.dart';
import 'package:untitled/models/shop_app/setting_model.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants.dart';

class SettingsScreen extends StatelessWidget {
   SettingsScreen({Key? key}) : super(key: key);
   var formKey=GlobalKey<FormState>();
  var  userNameController =TextEditingController();
  var gmailController =TextEditingController();
   var phoneController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var model= ShopCubit.get(context).salah?.data;
        userNameController.text=model!.name;
        gmailController.text= model.email;
        phoneController.text=model.phone;

        return ConditionalBuilder(
          condition: ShopCubit.get(context).salah != null,
          builder: (context) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    if (state is ShopLoadingGetUpdateUserState)
                    LinearProgressIndicator(),
                SizedBox(
                height: 30.0,
              ),
                    defaultTextField(
                      controller: userNameController,
                      label: 'user Name',
                      prefix: Icons.person,
                      type: TextInputType.name,
                      validate: (value) {
                        if(value.isEmpty){
                          return 'name must not be empty';
                        }
                        return null;
                      },),
                    SizedBox(
                      height: 30.0,
                    ),
                    defaultTextField(
                      controller: gmailController,
                      label: 'gmail',
                      prefix: Icons.email,
                      type: TextInputType.emailAddress,
                      validate: (value) {
                        if(value.isEmpty){
                          return 'email must not be empty';
                        }
                        return null;
                      },),
                    SizedBox(
                      height: 30.0,
                    ),
                    defaultTextField(
                      controller: phoneController,
                      label: 'phone',
                      prefix: Icons.phone,
                      type: TextInputType.phone,
                      validate: (value) {
                        if(value.isEmpty){
                          return 'phone must not be empty';
                        }
                        return null;
                      },),
                    SizedBox(height: 30.0,),
                    defaultButton(
                        function: () => logOut(context),
                        text: 'LogOut'),
                    SizedBox(height: 30.0,),
                    defaultButton(
                        function: (){
                          if(formKey.currentState!.validate()){
                            ShopCubit.get(context).
                            getUpdateData(
                                name: userNameController.text,
                                email: gmailController.text,
                                phone: phoneController.text);
                          }
                        },
                        text: 'Edit')
                  ],
                ),
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),

        );
 },
    );
  }
}
