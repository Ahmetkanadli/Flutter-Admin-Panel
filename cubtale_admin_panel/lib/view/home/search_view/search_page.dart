
import 'package:cubtale_admin_panel/core/Theme/bloc/theme_bloc.dart';
import 'package:cubtale_admin_panel/core/repository/search/search_repository.dart';
import 'package:cubtale_admin_panel/view/home/search_view/search_bloc/search_bloc.dart';
import 'package:cubtale_admin_panel/view/home/search_view/search_bloc/search_states.dart';
import 'package:cubtale_admin_panel/view/home/search_view/search_widget/search_widget.dart';
import 'package:cubtale_admin_panel/view/home/widget/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
    required this.searchType,
    required this.searchTitle});

  final String searchType;
  final String searchTitle;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool sucsess = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    TextEditingController _controller = TextEditingController();

    return BlocBuilder<ThemeBloc,ThemeMode>(
      builder: (context,state) {
        final themeBloc = context.read<ThemeBloc>().state;
        return BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {

            return Scaffold(
              backgroundColor: themeBloc == ThemeMode.light ? Colors.white :Color(0xff101c34),
              body: Stack(
                children: [
                  HomeAppBarWidget(context),
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 120,
                          ),
                          Container(
                            width: width < 850 ? 400 : width / 2.5,
                            height: height < 1000 ? 500 : 300,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                                border: Border.all(
                                    color: const Color(0xffd7f1ed), width: 2)),
                            child: Column(
                              children: [
                                const SizedBox(height: 50),
                                SizedBox(
                                  width: width < 850 ? 350 : width / 2.8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          widget.searchType,
                                          style: GoogleFonts.aBeeZee(
                                              textStyle: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: ThemeBloc == ThemeMode.light ?Colors.black
                                                      .withOpacity(0.6) : Colors.white)),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "  ${widget.searchTitle}",
                                        style: GoogleFonts.aBeeZee(
                                            textStyle : TextStyle(
                                                fontWeight: FontWeight.bold,
                                              color: themeBloc == ThemeMode.light ? Colors.black.withOpacity(0.5) : Colors.white,
                                            )
                                        ),
                                      ),
                                      Row(
                                        children: [

                                          SizedBox(
                                            width: width < 855 ? 200 : width / 4,
                                            child: TextField(
                                              controller: _controller,
                                              onChanged: (value) {},
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
                                          ),
                                          const Spacer(),
                                          ElevatedButton(
                                              onPressed: () async {
                                                await Search().userSearch(
                                                    userInfo: _controller.text,
                                                    searchType:
                                                    widget.searchTitle == "Email" ?
                                                        "email" : widget.searchTitle == "ID" ?
                                                            "acc_id" : "acc_creation_date",

                                                    context: context);
                                              },
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all<Color>(themeBloc == ThemeMode.light ? Color(0xffb8e6db) : Color(0xff204c5c),),
                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(10.0),
                                                          side: const BorderSide(color: Colors.transparent)
                                                      )
                                                  )
                                              ),
                                              child: Text(
                                                  "Search",
                                                style:GoogleFonts.aBeeZee(
                                                  textStyle : TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: ThemeBloc == ThemeMode.light ?Colors.black.withOpacity(0.5) : Colors.white
                                                  )
                                                ) ,
                                              ))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      if (state.result!.isNotEmpty)
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: SizedBox(
                                                  width: 90,
                                                  height: 90,
                                                  child: Image.asset(
                                                      "assets/profile_image_light.png")),
                                            ),
                                            const SizedBox(height: 30,),

                                            SearcByIdWiddget(
                                                "Name :",
                                                state.result!.first.acc_name,
                                                "Email :",
                                                state.result!.first.acc_mail,
                                                context
                                            ),
                                            SearcByIdWiddget(
                                                "Surname :",
                                                state.result!.first.acc_surname,
                                                "Creation Date :",
                                                state.result!.first.acc_creation_date,
                                                context
                                            ),
                                            SearcByIdWiddget(
                                                "Verified :",
                                                state.result!.first.acc_verified ? "Yes" : "No",
                                                "Account Id : :",
                                                state.result!.first.acc_id,
                                                context
                                            )
                                          ],
                                        )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
