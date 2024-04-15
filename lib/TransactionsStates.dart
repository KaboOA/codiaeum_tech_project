abstract class TransactionsStates {}

class InitialState extends TransactionsStates {}

class CreateTransactionState extends TransactionsStates {}
// Transactions States

class GetLoadingTransactionState extends TransactionsStates {}

class GetSuccessTransactionState extends TransactionsStates {}

class GetFailedTransactionState extends TransactionsStates {}

class GetFailedBalanceState extends TransactionsStates {}

class GetSuccessBalanceState extends TransactionsStates {}

class GetLoadingBalanceState extends TransactionsStates {}

class ComboBoxState extends TransactionsStates {}
