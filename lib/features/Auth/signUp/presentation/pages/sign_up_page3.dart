import 'dart:developer';
import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/core/util/widgets/auth_page_body.dart';
import 'package:clinic/features/Auth/logIn/presentaion/pages/login_page.dart';
import 'package:clinic/features/Auth/signUp/data/repos/auth_repo_impl.dart';
import 'package:clinic/features/Auth/signUp/domain/useCase/auth_usecase.dart';
import 'package:clinic/features/Auth/signUp/presentation/manager/cubit/auth_cubit.dart';
import 'package:clinic/features/Auth/signUp/presentation/manager/cubit/auth_state.dart'
    as clinic_auth;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpPage3 extends StatelessWidget {
  const SignUpPage3({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    TextEditingController firstControl = TextEditingController();
    TextEditingController secondControl = TextEditingController();

    final supabaseClient = Supabase.instance.client;

    final authRepository = AuthRepositoryImpl(supabaseClient);

    return BlocProvider(
      create: (context) => AuthCubit(
        signUpUseCase: SignUpUseCase(authRepository),
        signInUseCase: SignInUseCase(authRepository),
        signOutUseCase: SignOutUseCase(authRepository),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "إنشاء حساب",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Cairo",
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: BlocConsumer<AuthCubit, clinic_auth.AuthState>(
          listener: (context, state) {
            if (state is clinic_auth.AuthSuccess) {
              Moving.navToPage(context: context, page: const LoginPage());
            } else if (state is clinic_auth.AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            if (state is clinic_auth.AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return AuthPageBody(
              hint1: "كلمة السر",
              hint2: "تأكيد كلمة السر",
              signUponTap: () {
                Moving.navToPage(context: context, page: const LoginPage());
              },
              signUp: "سجل دخول",
              nextonTap: () async {
                final password = firstControl.text;
                final confirmPassword = secondControl.text;

                if (password == confirmPassword) {
                  log("بدأت عملية التسجيل");
                  context.read<AuthCubit>().signUp(email, password);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('كلمتا المرور غير متطابقتين')),
                  );
                }
              },
              allredyAccount: 'لديك حساب بالفعل؟',
              textBotton: "أنشئ حساب",
              forgetPassWord: '',
              firstController: firstControl,
              secondController: secondControl,
            );
          },
        ),
      ),
    );
  }
}
