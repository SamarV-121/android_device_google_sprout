#include <system/window.h>
#include <ui/Rect.h>
#include <gui/SurfaceControl.h>

namespace android {

// ---------------------------------------------------------------------------

//android::GraphicBufferMapper::lock(native_handle const*, unsigned int, android::Rect const&, void**, int*, int*)

extern "C" {

    void _ZN7android19GraphicBufferMapper4lockEPK13native_handlejRKNS_4RectEPPvPiS9_(native_handle const*, unsigned int, android::Rect const&, void**, int*, int*);

    void _ZN7android19GraphicBufferMapper4lockEPK13native_handlejRKNS_4RectEPPv(buffer_handle_t handle, uint32_t usage, const android::Rect& bounds, void** vaddr) {
        _ZN7android19GraphicBufferMapper4lockEPK13native_handlejRKNS_4RectEPPvPiS9_(handle, usage, bounds, vaddr, nullptr, nullptr);
    }

}

// ---------------------------------------------------------------------------

}; // namespace android
