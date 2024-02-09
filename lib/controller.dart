import 'dart:math';

class Controller {
  Random random = Random();
  String answer = '你為什麼不問問神奇海螺呢?';
  String image = 'ask_the_magic_conch.jpg';
  int randomCase = 0;

  int getRandomCase() {
    int randomCase = random.nextInt(9); //0~9
    return randomCase;
  }

  void getAnswer() {
    randomCase = getRandomCase();
    if (randomCase == 0) {
      answer = "對";
      image = "yes.png";
    } else if (randomCase == 1) {
      answer = "最好別吃";
      image = "better_not.png";
    } else if (randomCase == 2) {
      answer = "不行";
      image = "can't.png";
    } else if (randomCase == 3) {
      answer = "不行";
      image = "can't_2.png";
    } else if (randomCase == 4) {
      answer = "可以";
      image = "can.png";
    } else if (randomCase == 5) {
      answer = "都不吃";
      image = "don't_eat.png";
    }  else if (randomCase == 6) {
      answer = "坐好";
      image = "sit_down.png";
    } else if (randomCase == 7) {
      answer = "坐好";
      image = "sit_down_2.png";
    }
  }
}
