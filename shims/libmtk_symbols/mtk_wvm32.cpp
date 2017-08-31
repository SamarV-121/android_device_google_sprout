#include <stdint.h>

extern "C" int _ZN7android16MediaBufferGroupC1Ej(unsigned int);
extern "C" int _ZN7android16MediaBufferGroupC1Ev() {
    return _ZN7android16MediaBufferGroupC1Ej(0);
}

extern "C" bool _ZN7android16MediaBufferGroup14acquire_bufferEPPNS_11MediaBufferEb();
extern "C" bool _ZN7android16MediaBufferGroup14acquire_bufferEPPNS_11MediaBufferEb() {
  return _ZN7android16MediaBufferGroup14acquire_bufferEPPNS_11MediaBufferEb();
}
extern "C" void _ZN7android14SurfaceControl8setLayerEj(uint32_t);

extern "C" void _ZN7android14SurfaceControl8setLayerEi(int32_t layer){
       return _ZN7android14SurfaceControl8setLayerEj(static_cast<uint32_t>(layer));
    }

}

