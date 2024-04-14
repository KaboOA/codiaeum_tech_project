import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

abstract class TransactionsStates {}

class InitialState extends TransactionsStates {}

class CreateTransactionState extends TransactionsStates {}
