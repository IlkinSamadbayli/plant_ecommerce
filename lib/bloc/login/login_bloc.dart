import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:plant_ecommerce/global/global_failure.dart';
import 'package:plant_ecommerce/model/login_success_model.dart';
import 'package:plant_ecommerce/service/login_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is SendLoginEvent) {
        emit(LoginLoading());
        final result =
            await LoginService.loginService(email:event.email,password: event.password);
        if (result is LoginSuccessModel) {
          emit(LoginSuccess(loginResult: result));
        } else {
          emit(LoginFailure(failure: GlobalFailure()));
        }
      }
    });
  }
}