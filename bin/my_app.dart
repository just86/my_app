import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  print('Выберите действие:');
  print('   1. Проверка на парное число');
  print('   2. Угадай число от 1 до 10');

  Random random = new Random();
  int randomNumber = random.nextInt(10) + 1;

  int numberFromConsole = parseline(stdin.readLineSync() ?? "");

  if (numberFromConsole == 0) {
    print("Вы ввели не число :-(");
  } else {
    switch (numberFromConsole) {
      case 1:
        print('Введите число:');

        pairedNumbers(parseline(stdin.readLineSync() ?? ""));

        break;
      case 2:
        print('Я загадал целое число от 1 до 10. Попробуй угадать:');
     
        guessTheNumber();
       
        break;

      default:
        print('Вы ввели число больше чем предложенные варианты');
    }
  }
}

//чтение строки из терминала и возврат числа
int parseline(String line) {
  int answer;
  final numberfromconsole = int.tryParse(line);

  if (line == 'exit') {
    answer = 999666999;
  } else if (numberfromconsole == null) {
    answer = 0;
  } else {
    answer = numberfromconsole;
  }

  return answer;
}

//проверка числа на парность
void pairedNumbers(int numberToCheck) {
  String answer = '';
  if (numberToCheck % 2 == 0) {
    answer = 'парное';
  } else {
    answer = 'не парное';
  }
  print('Вы ввели число $numberToCheck. Данное число $answer');
}

//угадай число
void guessTheNumber() {
  Random random = new Random();
  int randomNumber = random.nextInt(10) + 1;
  int attempt = 1;
  bool exitFrom = true;

  while (exitFrom) {
    int numberToCheck = parseline(stdin.readLineSync() ?? "");

    String res = '';
    if (numberToCheck > randomNumber) {
      print(
          'Ваше число больше загаданного. Попробуйте еще раз или напишите exit');
    } else if (numberToCheck < randomNumber) {
      print(
          'Ваше число меньше загаданного. Попробуйте еще раз или напишите exit');
    } else if (numberToCheck == randomNumber) {
      print('Поздравляю вы угадали число $numberToCheck с $attempt попытки');
      exitFrom = false;
    } else if (numberToCheck == 999666999) {
      exitFrom = false;
    }
    attempt++;
  }
}
