import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../common/exceptions.dart';
import '../../../data/repo/auth_repository.dart';
// import 'package:rajaee_web_app/data/repo/cart_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository authRepository;
  // final CartRepository cartRepository;
  bool isLoginMode;
  AuthBloc(this.authRepository,
      {this.isLoginMode = true})
      : super(AuthInitial(isLoginMode)) {
    on<AuthEvent>((event, emit) async {
      try {
        if (event is AuthButtonIsClicked) {
          emit(AuthLoading(isLoginMode));
          if (isLoginMode) {
            await authRepository.login(event.username, event.password);
            // await cartRepository.count();
            emit(AuthSuccess(isLoginMode));
          } else {
            // await authRepository.signUp(event.username, event.password);
            emit(AuthSuccess(isLoginMode));
          }
        } else if (event is AuthModeChangeIsClicked) {
          isLoginMode = !isLoginMode;
          emit(AuthInitial(isLoginMode));
        }
      } on AppException catch(e) {
        emit(AuthError(isLoginMode, e));
      } catch (e) {
        emit(AuthError(isLoginMode, AppException()));
      }
    });
  }
}
