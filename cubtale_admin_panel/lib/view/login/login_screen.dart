import 'package:cubtale_admin_panel/core/Theme/bloc/theme_bloc.dart';
import 'package:cubtale_admin_panel/core/failure/login/login_repository_failure.dart';
import 'package:cubtale_admin_panel/core/repository/Login/login_repository.dart';
import 'package:cubtale_admin_panel/view/home/home_page.dart';
import 'package:cubtale_admin_panel/view/login/Error/error_view.dart';
import 'package:cubtale_admin_panel/view/login/bloc/login_bloc.dart';
import 'package:cubtale_admin_panel/view/login/bloc/login_events.dart';
import 'package:cubtale_admin_panel/view/login/bloc/login_states.dart';
import 'package:cubtale_admin_panel/view/login/widget/appBar_widget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Bu değişken AppBar widgetinin yüksekliğinin diğer appbar bileşenlerinin
    // responsive oranları için kullanılmıştır


    double width =  MediaQuery.of(context).size.width;
    double height =  MediaQuery.of(context).size.height;


    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();




    return BlocBuilder<ThemeBloc,ThemeMode>(
      builder: (context,state) {
        final themeBloc = context.read<ThemeBloc>().state;
        return BlocBuilder<LoginBloc,LoginState>(

          builder: (context,state) {

            return Scaffold(
              backgroundColor: themeBloc == ThemeMode.light ? Colors.white : Color(0xff101c34),
              body: Stack(

                children: [
                  AppBarWidget(context),
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 120,),
                        Container(
                          width: width < 850 ? 400 : width/2.5 ,
                          height: height < 1000 ? 500 : 300,
                          decoration:  BoxDecoration(
                            color: themeBloc == ThemeMode.light ?Color(0xffd7f1ed) : Color(0xff182c3c),
                            borderRadius:const  BorderRadius.all(Radius.circular(30))
                          ),
                          child: AspectRatio(
                            aspectRatio: 1/5,
                            child: Column(
                              children: [
                                const SizedBox(height: 50),
                                SizedBox(
                                  width: 300,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "UserName",
                                        style: GoogleFonts.aBeeZee(
                                            textStyle : TextStyle(
                                                fontSize:18,
                                                fontWeight: FontWeight.bold,
                                                color: themeBloc == ThemeMode.light ? Colors.black.withOpacity(0.6): Colors.white
                                            )
                                        ),
                                      ),
                                      const SizedBox(height: 30,),
                                      TextField(
                                        controller: usernameController,
                                        onChanged: (value){
                                          context.read<LoginBloc>().add(EmailEvent(value));
                                        },
                                        decoration:  InputDecoration(
                                          filled: true,

                                          fillColor: themeBloc == ThemeMode.light ? Color(0xffb8e6db) : Color(0xff204c5c),
                                          border:   OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: themeBloc == ThemeMode.light ? Color(0xffb8e6db) : Color(0xff204c5c),
                                            ),
                                            borderRadius:const BorderRadius.all(Radius.circular(15))
                                          ),
                                          enabledBorder:  OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: themeBloc == ThemeMode.light ? Color(0xffb8e6db) : Color(0xff204c5c),
                                              ),
                                              borderRadius:const  BorderRadius.all(Radius.circular(15))
                                          ),
                                        ),
                                        style: TextStyle(
                                          color: themeBloc == ThemeMode.light ? Colors.black.withOpacity(0.5) : Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 50,),
                                      Text(
                                        "Password",
                                        style: GoogleFonts.aBeeZee(
                                            textStyle : TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: themeBloc == ThemeMode.light ? Colors.black.withOpacity(0.6): Colors.white

                                            )
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                      TextField(
                                        controller: passwordController,
                                        onChanged: (value){
                                          context.read<LoginBloc>().add(PasswordEvent(value));
                                        },
                                        decoration:  InputDecoration(
                                          filled: true,

                                          fillColor: themeBloc == ThemeMode.light ? Color(0xffb8e6db) : Color(0xff204c5c),
                                          border:   OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: themeBloc == ThemeMode.light ? Color(0xffb8e6db) : Color(0xff204c5c),
                                              ),
                                              borderRadius:const BorderRadius.all(Radius.circular(15))
                                          ),
                                          enabledBorder:  OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: themeBloc == ThemeMode.light ? Color(0xffb8e6db) : Color(0xff204c5c),
                                              ),
                                              borderRadius:const  BorderRadius.all(Radius.circular(15))
                                          ),
                                        ),
                                        style: TextStyle(
                                          color: themeBloc == ThemeMode.light ? Colors.black.withOpacity(0.5) : Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 50),
                                Row(
                                  children: [
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: (){
                                        Future<Either<LoginRepositoryFailure, bool>> isLogin = LoginRepository().login(email: state.email, password: state.password);
                                        isLogin.then((value) {
                                          if (value.isLeft()) {
                                            showDialog(context: context, builder: (BuildContext context){
                                                return ErrorView(errorMessage: "HATA");});
                                          }
                                          else{
                                            return Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                                          }
                                        }
                                        );

                                      },
                                      child: Container(
                                        width: 90,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            color:  themeBloc == ThemeMode.light ? Color(0xffb8e6db) : Color(0xff204c5c),
                                            borderRadius:const  BorderRadius.all(Radius.circular(15))
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Login",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.aBeeZee(
                                                textStyle : TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: themeBloc == ThemeMode.light ? Colors.black.withOpacity(0.6): Colors.white
                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: width/20,)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      }
    );
  }
}
