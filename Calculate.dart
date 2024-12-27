import 'dart:async';
import 'dart:io';
class Calculate{
    double add(double a, double b){
      return (a+b);
    }
    double subtract(double a , double b){
        return (a-b);
    }
    double multiply(double a, double b){
      return(a*b);
    }
    double divide(double a, double b){
      if (b==0){
        throw Exception('division by zero is invalid.');
      }
      return (a/b);
    }

  }

bool isValidNumber(String str){
  return double.tryParse(str) !=null;
}


Future<void>delay(double a, double b, String operator )async{
  Calculate calc= Calculate();
  double result;
  try{
    switch(operator){
      case '+':
          result= calc.add(a,b);
          break;
      case '-':
          result= calc.subtract(a,b);
          break;
      case '*':
          result= calc.multiply(a,b);
          break;
      case '/':
          result= calc.divide(a,b);
          break;
      default:
          throw Exception('Invalid operator choice');
    }
    print('Calculating....');
    await Future.delayed(Duration(seconds:5));
    print('Result: $a $operator $b = $result');
  } catch(e){
    print('Error: ${e.toString()}');
  }
}
void main(){
  Calculate calc= Calculate();
  print('Enter the numbers: ');
  String a= stdin.readLineSync()!;
  String b= stdin.readLineSync()!;
  print('Enter the operation(+, - , * , /)');
  String operator = stdin.readLineSync()!;
  if (a==null || b==null || operator==null){
    print("Null input is entered.");
    return;  
  }
  if(!isValidNumber(a) || !isValidNumber(b)){
    print("invalid input in numbers.");
    return;
  }

  if(!['+','-','*','/'].contains(operator)){
    print('Invalid input in operator.');
    return;
  }

  double num1= double.parse(a);
  double num2=double.parse(b);
  delay(num1, num2, operator);

}

