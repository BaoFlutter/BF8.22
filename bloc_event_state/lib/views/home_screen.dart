
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/timer_bloc/timer.dart';
import '../resources/utils/ticker.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Đếm ngược"),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: BlocProvider(
            create: (context)=> TimerBloc(ticker: Ticker()),
            child: BlocBuilder<TimerBloc, TimerState>(
              builder: (context, state){
                final String minutesStr =
                ((state.duration / 60) % 60).floor().toString().padLeft(2, '0');
                final String secondsStr =
                (state.duration % 60).floor().toString().padLeft(2, '0');
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // timer
                      Text('$minutesStr:$secondsStr',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60),
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: buttonWidgets(state, context),
                      )

                    ],
                  ),
                );

              },

            ),

          ),
        )
    );
  }

  buttonWidgets(state, context)
  {
    final TimerBloc timerBloc = BlocProvider.of<TimerBloc>(context);
    if(state is InitialState){
      return [
        FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed:()=> timerBloc.add(StartEvent(state.duration))  )      ];
    }
    else if(state is RunningState)
    {
      return [
        FloatingActionButton(
          child: Icon(Icons.pause),
          onPressed: () => timerBloc.add(PauseEvent()),
        ),

        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () => timerBloc.add(ResetEvent()),
        ),
      ];
    }
    else if(state is PauseState){
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () => timerBloc.add(ResumeEvent()),
        ),
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () => timerBloc.add(ResetEvent()),
        )
      ];
    }
    else if(state is CompletedState)
    {
      return [
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () => timerBloc.add(ResetEvent()),
        )
      ];
    }
  }

}
