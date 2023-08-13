#include "s21_math.h"

#include <limits.h>

// вычисляет абсолютное значение целого числа
int s21_abs(int x) { return x < 0 ? x *= (-1) : x; }

// возвращает ближайшее целое число, не меньшее заданного значения
long double s21_ceil(double x) {
  long double x1 = x, result;
  if (x1 == s21_INF || x1 == -s21_INF) {
    result = x1;
  } else if (x1 == (int)x1) {
    result = x1;
  } else if (x1 < (int)x1) {
    result = (int)x1;
  } else {
    result = (int)x1 + 1;
  }
  return x1 != x1 ? s21_NAN : result;
}

// возвращает значение e, возведенное в заданную степень
long double s21_exp(double x) {
  long int i = 1;
  long double result = 1, stepen = x, fact = 1;
  if (x > s21_EXP_MAX) {
    result = s21_INF;
  } else if (x < s21_EXP_MIN) {
    result = 0.0;
  } else {
    while (i < 1000) {
      result += stepen / fact;
      stepen *= x;
      fact *= (i + 1);
      ++i;
    }
  }
  return result;
}

// вычисляет абсолютное значение числа с плавающей точкой
long double s21_fabs(double x) {
  long double m = x;
  return m < 0 ? m *= -1 : m;
}

// возвращает ближайшее целое число, не превышающее заданное значение
long double s21_floor(double x) {
  long double x1 = x, result;
  if (x1 == s21_INF || x1 == -s21_INF) {
    result = x1;
  } else if (x1 == (int)x1) {
    result = x1;
  } else if (x1 < (int)x1) {
    result = (int)x1 - 1;
  } else {
    result = (int)x1;
  }
  return x1 != x1 ? s21_NAN : result;
}

// остаток операции деления с плавающей точкой
long double s21_fmod(double x, double y) {
  long double buf = s21_NAN;
  double del = 0.0;
  if (y != 0.0 || x != s21_INF || x != -s21_INF) {
    del = (long long int)(x / y);
    buf = x - del * y;
  }
  return buf;
}

// вычисляет натуральный логарифм
long double s21_log(double x) {
  int i = 2;
  long double result = x - 1, stepen = x - 1, vrem = x;
  if (x < 0) {
    result = s21_NAN;
  } else if (x == 0) {
    result = -s21_INF;
  } else if (x < 2.0 + s21_EPS) {
    x = x - 1;

    while (s21_fabs(stepen / i) > s21_EPS) {
      stepen *= -1 * x;
      result += stepen / i;
      ++i;
    }
  } else {
    int count = 0;
    while (vrem > 1.0) {
      vrem /= 10;
      count++;
    }
    result = s21_log(vrem) + count * s21_LN10;
  }
  return result;
}

// возводит число в заданную степень
long double s21_pow(double base, double exp) {
  long double number;
  if (base < 0) {
    if ((long int)exp == exp) {
      if (exp > 0) {
        number = base;
        for (long int i = 0; i < (long int)exp - 1; i++) {
          number *= base;
        }
      } else if (exp == 0) {
        number = 1;
      } else {
        number = 1 / base;
        for (long int i = 0; i < (long int)exp * (-1) - 1; i++) {
          number /= base;
        }
      }
    } else {
      if (exp == -s21_INF || exp == s21_INF) {
        if (base * (-1) < 1) {
          number = 0;
        } else if (base * (-1) == 1) {
          number = 1;
        } else {
          if (exp == -s21_INF) {
            number = 0;
          } else {
            number = s21_INF;
          }
        }
      } else {
        number = -s21_NAN;
      }
    }
  } else if (base == 0) {
    if (exp == 0) {
      number = 1;
    } else {
      number = 0;
    }
  } else if (base == 1) {
    number = 1;
  } else {
    if ((long int)exp == exp) {
      if (exp > 0) {
        number = base;
        for (long int i = 0; i < (long int)exp - 1; i++) {
          number *= base;
        }
      } else if (exp == 0) {
        number = 1;
      } else {
        number = 1 / base;
        for (long int i = 0; i < (long int)exp * (-1) - 1; i++) {
          number /= base;
        }
      }
    } else {
      number = s21_exp(exp * s21_log(base));
    }
  }
  return number;
}

// вычисляет синус
long double s21_sin(double x) {
  x = s21_fmod(x, 2 * s21_PI);
  double n = x, sum = 0.0;
  int i = 1;

  do {
    sum += n;
    n *= -x * x / (2 * i * (2 * i + 1));
    i++;
  } while (s21_fabs(n) > s21_EPS);

  return sum;
}

// вычисляет квадратный корень
long double s21_sqrt(double x) {
  long double result = 4;
  if (x < 0) {
    result = -s21_NAN;
  } else {
    long double temp = 0;
    while (s21_fabs(result - temp) > s21_EPS) {
      temp = result;
      result = (temp + x / temp) / 2;
    }
  }
  return result;
}

// вычисляет косинус
long double s21_cos(double x) {
  long double x1 = x;
  return s21_sin(s21_PI / 2 - x1);
}

// вычисляет арккосинус
long double s21_acos(double x) {
  long double res;
  if (x < -1 || x > 1 || (x != x))
    res = s21_NAN;
  else if (s21_fabs(x - 1.) < s21_EPS)
    res = 0;
  else if (s21_fabs(x + 1.) < s21_EPS)
    res = s21_PI;
  else
    res = (s21_PI / 2 - s21_asin(x));
  return res;
}

// вычисляет арктангенс
long double atan_range(double x) {
  long double result = x, temp = x, i = 1;
  while (s21_fabs(result) > s21_EPS) {
    result *= -1 * s21_pow(x, 2) * (2 * i - 1) / (2 * i + 1);
    i += 1;
    temp += result;
  }
  return temp;
}

long double s21_atan(double x) {
  long double temp = 0;
  if ((x >= (double)LLONG_MAX || x <= (double)LLONG_MIN) || x != x)
    temp = x;
  else if (x == 0)
    temp = 0;
  else if (x < 1 && x > -1)
    temp = atan_range(x);
  else if (x == 1)
    temp = s21_PI / 4;
  else if (x == -1)
    temp = -s21_PI / 4;
  else if (x > 1)
    temp = s21_PI / 2 - atan_range(1 / x);
  else if (x < -1)
    temp = -s21_PI / 2 - atan_range(1 / x);
  return temp;
}

// вычисляет тангенс
long double s21_tan(double x) { return s21_sin(x) / s21_cos(x); }

// вычисляет арксинус
long double s21_asin(double x) {
  double tmp = x, result = x;

  if (x < -1 || x > 1 || (int)(x != x)) {
    result = s21_NAN;
  } else if (x == -1 || x == 1) {
    result = s21_PI / 2 * x;
  } else {
    for (double count = 1; s21_fabs(tmp) > s21_EPS; count++) {
      tmp *= ((x * x) * (2 * count - 1) * (2 * count - 1)) /
             ((2 * count) * (2 * count + 1));
      result += tmp;
    }
  }
  return result;
}
