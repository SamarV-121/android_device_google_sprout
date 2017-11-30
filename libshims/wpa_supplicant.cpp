#include <pthread.h>

extern "C" long SSL_CTX_ctrl() {
  return 1;
}
