#include <fcgi_stdio.h>
#include <stdio.h>

int main() {
  while (FCGI_Accept() >= 0) {
     printf("Content-type: text/html\r\nStatus: 200 OK\
            \r\n\r\n<html>\
            \r\n\t<head>\
            \r\n\t\t<meta charset=\"UTF-8\">\
            \r\n\t\t<title>Mini web server</title>\
            \r\n\t\t<style>\
            \r\n\t\t\th1 {\
            \r\n\t\t\t\tcolor: red;\
            \r\n\t\t\t\tposition: absolute;\
            \r\n\t\t\t\ttop: 45%%;\
            \r\n\t\t\t\tleft: 45%%;\
            \r\n\t\t\t}\
            \r\n\t\t</style>\
            \r\n\t</head>\
            \r\n\t<body>\
            \r\n\t\t<h1>Hello World!</h1>\
            \r\n\t</body>\
            \r\n\t<script>alert(\"И тут тоже Hello World!\")</script>\
            \r\n</html>");
    }

  return 0;
}
