
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/shop_layout.dart';
import 'package:untitled/modules/shop_app/shop_login_screen/cubit/cubit.dart';
import 'package:untitled/modules/shop_app/shop_login_screen/shop_login_screen.dart';
import 'package:untitled/modules/shop_app/shop_register_screen/cubit/cubit.dart';
import 'package:untitled/modules/shop_app/shop_register_screen/cubit/states.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';

class ShopRegisterScreen extends StatelessWidget {
  ShopRegisterScreen({Key? key}) : super(key: key);
  var formKey=GlobalKey<FormState>();
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var phoneController=TextEditingController();
  var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) =>ShopRegisterCubit (),
      child: BlocConsumer<ShopRegisterCubit , ShopRegisterStates>(
        listener: (context, state) {
          if(state is ShopRegisterSuccessState)
          {
            if(state.registerModel.status){
              //print(state.registerModel.data?.token);
              CacheHelper.saveData(key: 'token', value:state.registerModel.data?.token ).then(
                      (value) {
                        print('hussein said elmalek');
                    token =state.registerModel.data?.token;
                        //state.registerModel.data?.token;
                    navigateAndFinish(context, ShopLayout());
                  });

            }else{
              //print(state.loginModel.message);


              showToast(text: state.registerModel.message, state: ToastStates.ERROR);
            }
          }
        },
        builder:(context, state) {
          return  Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('REGISTER',
                          style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15.0,),
                        Text('Register now to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 30.0,),
                        defaultTextField(
                          controller: nameController,
                          label: 'User Name',
                          prefix: Icons.person,
                          type: TextInputType.name,
                          validate: (value) {
                            if(value.isEmpty){
                              return 'please enter your name';
                            }
                          },
                        ),
                        SizedBox(height: 15.0,),
                        defaultTextField(
                          controller: emailController,
                          label: 'Email Adress',
                          prefix: Icons.email_outlined,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if(value.isEmpty){
                              return 'please enter your email adress';
                            }
                          },
                        ),
                        SizedBox(height: 15.0,),
                        defaultTextField(
                          controller: passwordController,
                          label: 'Password',
                          onSubmit: (value) {

                          },
                          prefix: Icons.lock_open_outlined,
                          suffix: ShopRegisterCubit.get(context).isShow ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          type: TextInputType.visiblePassword,
                          suffixPressed: () {
                            ShopRegisterCubit.get(context).changePasswordIcon();
                          },
                          isPassword: ShopRegisterCubit.get(context).isShow,
                          validate: (value) {
                            if(value.isEmpty){
                              return 'please enter your Password';
                            }
                          },
                        ),
                        SizedBox(height: 15.0,),
                        defaultTextField(
                          controller: phoneController,
                          label: 'Phone',
                          prefix: Icons.phone,
                          type: TextInputType.phone,
                          validate: (value) {
                            if(value.isEmpty){
                              return 'please enter your phone';
                            }
                          },
                        ),

                        SizedBox(height: 30.0,),


                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if(formKey.currentState!.validate()){
                                ShopRegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone:phoneController.text,

                                );
                              }


                            },
                            text: 'Register',
                            isUpperCase: true,
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator()),
                        ),

                        Row(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            Text('I Have an acount?'),
                            TextButton(onPressed: () {
                              navigateAndFinish(context, ShopLoginScreen());
                            }, child: Text('LOGIN Now')),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
