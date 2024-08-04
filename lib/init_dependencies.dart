import 'package:assignment/core/common/network/connection_checker.dart';
import 'package:assignment/src/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:assignment/src/authentication/data/repositories/auth_repo_impl.dart';
import 'package:assignment/src/authentication/domain/repository/authentication_repository.dart';
import 'package:assignment/src/authentication/domain/usecases/get_current_user.dart';
import 'package:assignment/src/authentication/domain/usecases/send_code.dart';
import 'package:assignment/src/authentication/domain/usecases/verify_code.dart';
import 'package:assignment/src/authentication/presentaion/bloc/auth_bloc.dart';
import 'package:assignment/src/user/data/data_source/user_remote_data_source.dart';
import 'package:assignment/src/user/data/repository/user_repository_impl.dart';
import 'package:assignment/src/user/domain/repository/user_repository.dart';
import 'package:assignment/src/user/domain/usecases/get_user_data.dart';
import 'package:assignment/src/user/domain/usecases/save_user_info.dart';
import 'package:assignment/src/user/domain/usecases/update_data.dart';
import 'package:assignment/src/user/presentation/bloc/user_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'init_dependencies_main.dart';
