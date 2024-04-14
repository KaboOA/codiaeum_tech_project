abstract class TransactionsStates {}

class InitialState extends TransactionsStates {}

class CreateTransactionState extends TransactionsStates {}

class GetLoadingTransactionState extends TransactionsStates {}

class GetSuccessTransactionState extends TransactionsStates {}

class GetFailedTransactionState extends TransactionsStates {}
