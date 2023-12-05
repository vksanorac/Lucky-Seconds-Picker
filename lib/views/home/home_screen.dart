import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kjbn_test/views/home/cubit/home_screen_cubit.dart';
import 'package:kjbn_test/views/home/cubit/home_screen_state.dart';
import 'package:kjbn_test/widgets/home_card.dart';
import 'package:kjbn_test/widgets/success_animation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final homeCubit = context.read<HomeScreenCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Lucky Seconds Picker", style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      backgroundColor: Colors.deepOrangeAccent,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20),
        child:
        BlocBuilder<HomeScreenCubit, HomeScreenState>(
            bloc: homeCubit,
            builder: (context, state){
              if(state.homeScreenStateProgress == HomeScreenStateProgress.Loaded ||
                  state.homeScreenStateProgress == HomeScreenStateProgress.Success){
                return ListView(
                  children: [
                    HomeCard(
                        height: height * 0.5,
                        width: width,
                        backgroundColor: Colors.white,
                        child: Center(
                            child:
                            state.homeScreenStateProgress == HomeScreenStateProgress.Success?
                            SuccessWidget(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("${state.message} ${state.randomNumber}", style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12
                                    )),
                                      SizedBox(height: 20,),
                                      Text("Count: ${state.successCount}", style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12
                                      ))
                                  ],
                                )
                            ):
                            Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text("${state.message}",  style: TextStyle(
                                   color: Colors.orange,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 20
                               )),
                             ],
                          ))),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: HomeCard(
                              height: height * 0.2,
                              width: width * 0.4,
                              backgroundColor: Colors.white,
                              child: Center(child: Text("Click\nHere",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18,
                              color: Colors.green, fontWeight: FontWeight.bold),))),
                          onTap: (){
                            homeCubit.getRandomNumber();
                          },
                        ),
                        HomeCard(
                            height: height * 0.2,
                            width: width * 0.4,
                            backgroundColor: Colors.white,
                            child: Center(
                                child: Text("${state.randomNumber}",
                                style: TextStyle(color: Colors.orange,
                                fontSize: 18, fontWeight: FontWeight.bold),))),
                      ],
                    )
                  ],
                );
              }
              else
                return Center(child: CircularProgressIndicator());
            })

      ),
    );
  }
}