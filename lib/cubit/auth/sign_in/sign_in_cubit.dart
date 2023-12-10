import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../common/utils/rx_utils.dart';
import '../../../exception/error_value.dart';
import '../../../model/request/auth_request.dart';
import '../../../model/user.dart';
import '../../../repository/auth_repository.dart';
import '../../loading/loading_cubit.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState>{

  final AuthRepository authRepo;
  final LoadingCubit loadingCubit;

  SignInCubit({required this.authRepo, required this.loadingCubit}) : super(SignInInitial());

  final _email = BehaviorSubject<String>.seeded('@');
  final _password = BehaviorSubject<String>.seeded('');

  Stream<String> get email => _email.stream.transform(validateEmail);
  Sink<String> get sinkEmail => _email.sink;

  Stream<String> get password => _password.stream.transform(validatePassword);
  Sink<String> get sinkPassword => _password.sink;

  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (e, p) => true);

  void doLogin() {
    var email = _email.value.toString();
    var password = _password.value.toString();
    var request = AuthRequest.loginRequest(userName: email, password: password);
    loadingCubit.show();
    authRepo.login(request)
        .listen((response) {
          loadingCubit.hide();
          emit(SignInSuccess(response));
    }, onError: (e) {
      loadingCubit.hide();
      var error = ErrorValue.extract(e);
      emit(SignInError(error.message));
    });
  }

  dispose() {
    _email.close();
    _password.close();
  }

}