import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/layout/shop_app/shop_layout.dart';
import 'package:untitled/modules/shop_app/shop_login_screen/cubit/cubit.dart';
import 'package:untitled/modules/shop_app/shop_login_screen/cubit/states.dart';
import 'package:untitled/modules/shop_app/shop_register_screen/shop_register_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';

class ShopLoginScreen extends StatelessWidget {
   ShopLoginScreen({Key? key}) : super(key: key);
var formKey=GlobalKey<FormState>();

   var emailController=TextEditingController();
   var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener: (context, state) {
          if(state is ShopLoginSuccessState)
            {
              if(state.loginModel.status){
                print(state.loginModel.message);
                print(state.loginModel.data?.token);
                CacheHelper.saveData(key: 'token', value:state.loginModel.data?.token ).then(
                        (value) {
                          token =state.loginModel.data?.token;
                          navigateAndFinish(context, ShopLayout());
                        });

              }else{
                print(state.loginModel.message);


               showToast(text: state.loginModel.message, state: ToastStates.ERROR);
              }
            }
        },
        builder: (context, state) => Scaffold(
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
                      Text('LOGIN',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Text('login now to browse our hot offers',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 30.0,),
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
                          if(formKey.currentState!.validate()){
                            ShopLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text);
                          }

                        },
                        prefix: Icons.lock_open_outlined,
                        suffix: ShopLoginCubit.get(context).isShow ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        type: TextInputType.visiblePassword,
                        suffixPressed: () {
                          ShopLoginCubit.get(context).changePasswordIcon();
                        },
                        isPassword: ShopLoginCubit.get(context).isShow,
                        validate: (value) {
                          if(value.isEmpty){
                            return 'please enter your Password';
                          }
                        },
                      ),
                      SizedBox(height: 30.0,),


                      ConditionalBuilder(
                       condition: state is !ShopLoginLoadingState,
                        builder: (context) => defaultButton(
                          function: () {
                            if(formKey.currentState!.validate()){
                              ShopLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }


                          },
                          text: 'Loin',
                          isUpperCase: true,
                        ),
                        fallback: (context) => Center(child: CircularProgressIndicator()),
                      ),

                      Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Text('Don\'t Have an acount?'),
                          TextButton(onPressed: () {
                            navigateAndFinish(context, ShopRegisterScreen());
                          }, child: Text('Register Now')),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

      ),
    );
  }
}
