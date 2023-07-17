import 'package:response/src/bank/models/historic_model.dart';
import 'package:response/src/bank/utils/custom_print.dart';

import '../models/user_model.dart';
import '../utils/custom_input.dart';
import '../validators/confirm_password_validator.dart';

void accountStatement(UserModel user) {
  customInput(
    'Digite a senha: ',
    (value) => confirmPasswordValidator(value, user),
  );

  for (final element in user.account.historic) {
    switch(element.operationType){
      case OperationType.deposit: 
        printSuccess('${element.executedAt} - ${element.data}');
      case OperationType.withdraw: 
      case OperationType.transfer: 
        printError('${element.executedAt} - ${element.data}');
      default:
        printWarning('${element.executedAt} - ${element.data}');
    }
  }
}
