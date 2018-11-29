#include <stdint.h>
#include <media/IMediaSource.h>
#include <media/stagefright/MediaSource.h>

extern "C"{
    extern void _ZNK7android11MediaSource11ReadOptions9getSeekToEPxPNS1_8SeekModeE(void * obj, int64_t time_us, android::MediaSource::ReadOptions::SeekMode mode) {
        android::IMediaSource::ReadOptions *rop = static_cast<android::IMediaSource::ReadOptions *>(obj);
        rop->setSeekTo(time_us, mode);
    }

    extern bool _ZNK7android11MediaSource11ReadOptions14getNonBlockingEv(void * obj) {
        android::IMediaSource::ReadOptions *rop = static_cast<android::IMediaSource::ReadOptions *>(obj);
        return rop->getNonBlocking();
    }
}

extern "C" {
int _ZN7android16MediaBufferGroupC1Ej();
int _ZN7android16MediaBufferGroupC1Ev() {
    return _ZN7android16MediaBufferGroupC1Ej();
   }
}

extern "C" {
bool _ZN7android16MediaBufferGroup14acquire_bufferEPPNS_11MediaBufferEb();
bool _ZN7android16MediaBufferGroup14acquire_bufferEPPNS_11MediaBufferEb() {
  return _ZN7android16MediaBufferGroup14acquire_bufferEPPNS_11MediaBufferEb();
   }
}
