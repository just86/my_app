import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  print('Выберите действие:');
  print('   1. Проверка на парное число');
  print('   2. Угадай число от 1 до 10');
  print('   3. Работа со списками');

  print('   0. Выход');
  int numberFromConsole = parseline(stdin.readLineSync() ?? "");

  if (numberFromConsole == -1) {
    print("Вы ввели не число :-(");
  } else {
    switch (numberFromConsole) {
      case 0:
        print('До встречи');
        break;
      case 1:
        print('Введите число:');
        pairedNumbers();
        break;
      case 2:
        print('Я загадал целое число от 1 до 10. Попробуй угадать:');
        guessTheNumber();
        break;
      case 3:
          workWithLists();
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
    answer = -1;
  } else {
    answer = numberfromconsole;
  }

  return answer;
}

//проверка числа на парность
void pairedNumbers() {
  String answer = '';
  int numberToCheck = parseline(stdin.readLineSync() ?? "");

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
    if (numberToCheck == 999666999) {
      exitFrom = false;
    } else if (numberToCheck > randomNumber) {
      print(
          'Ваше число больше загаданного. Попробуйте еще раз или напишите exit');
    } else if (numberToCheck < randomNumber) {
      print(
          'Ваше число меньше загаданного. Попробуйте еще раз или напишите exit');
    } else if (numberToCheck == randomNumber) {
      print('Поздравляю вы угадали число $numberToCheck с $attempt попытки');
      exitFrom = false;
    }
    attempt++;
  }
}

//работа со списками
void workWithLists() {
  print('Введите числа через запятую для первого списка:');
  final stringOfNumbers1 = stdin.readLineSync() ?? "";
  List listFromConsole1 = (stringOfNumbers1.split(','));

  print('Введите числа через запятую для второго списка:');
  final stringOfNumbers2 = stdin.readLineSync() ?? "";
  List listFromConsole2 = (stringOfNumbers2.split(','));

  print('''Что необходимо сделать с введенными списками?
  1. Объединить
  2. Показать различие
  3. Показать общие элементы''');
}
