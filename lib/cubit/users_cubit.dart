import 'package:bloc/bloc.dart';
import 'package:block_app1/repo/User_repo.dart';
import 'package:equatable/equatable.dart';

import '../Models/User_Model.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersRepo usersRepo;

  UsersCubit(this.usersRepo) : super(UsersLoadingState());

  onloaduser() async {
    try {
      emit(UsersLoadingState());
      var data = await usersRepo.getUser();
      emit(UsersLoadedState(data));
    } catch (e) {
      UsersErrorState(e.toString());
    }
  }
}
