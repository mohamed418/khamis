import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khames/constants/commponents.dart';

import '../../logic/auth_bloc/auth_cubit.dart';
import '../../logic/auth_bloc/auth_states.dart';

class MessagesWidget extends StatelessWidget {
  const MessagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, states) {},
      builder: (context, states) {
        var cubit = AuthCubit.get(context);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cubit.num.toString(),
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  cubit.startIncrementTimer();
                },
                child: Container(
                  height: screenHeight(context, .2),
                  width: screenWidth(context, .3),
                  child: const Text('play stream'),
                ),
              ),
              // TFF(action: action, type: type, isPrefix: isPrefix, underlineBorder: underlineBorder,validator: (){})
            ],
          ),
        );
      },
    );
  }
}
