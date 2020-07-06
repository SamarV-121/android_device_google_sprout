/*
 * Copyright (C) 2017 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <stdint.h>
#include <string>
#include <ui/GraphicBuffer.h>
#include "include/GraphicBuffer.h"
#include <gui/IGraphicBufferConsumer.h>
#include <media/stagefright/MediaBuffer.h>
#include <cutils/native_handle.h>

#ifdef __cplusplus
extern "C"
{
#endif

#if defined(__LP64__)
extern void _ZN7android13GraphicBufferC1EPK13native_handleNS0_16HandleWrapMethodEjjijmj(
		void *self, const native_handle_t* handle,
        android::GraphicBuffer::HandleWrapMethod method,
        uint32_t width, uint32_t height, android::PixelFormat format,
        uint32_t layerCount, uint64_t usage, uint32_t stride);

void _ZN7android13GraphicBufferC1EP19ANativeWindowBufferb(
		void *self, ANativeWindowBuffer* buffer, bool keepOwnership)
{
	_ZN7android13GraphicBufferC1EPK13native_handleNS0_16HandleWrapMethodEjjijmj(
		self, buffer->handle,
		keepOwnership ? android::GraphicBuffer::TAKE_HANDLE : android::GraphicBuffer::WRAP_HANDLE,
		buffer->width, buffer->height, buffer->format, (uint32_t)buffer->layerCount,
		buffer->usage, buffer->stride);
}
#else
extern void _ZN7android13GraphicBufferC1EPK13native_handleNS0_16HandleWrapMethodEjjijyj(
		void *self, const native_handle_t* handle,
        android::GraphicBuffer::HandleWrapMethod method,
        uint32_t width, uint32_t height, android::PixelFormat format,
        uint32_t layerCount, uint64_t usage, uint32_t stride);

void _ZN7android13GraphicBufferC1EP19ANativeWindowBufferb(
		void *self, ANativeWindowBuffer* buffer, bool keepOwnership)
{
	_ZN7android13GraphicBufferC1EPK13native_handleNS0_16HandleWrapMethodEjjijyj(
		self, buffer->handle,
		keepOwnership ? android::GraphicBuffer::TAKE_HANDLE : android::GraphicBuffer::WRAP_HANDLE,
		buffer->width, buffer->height, buffer->format, buffer->layerCount,
		buffer->usage, buffer->stride);
}
#endif

extern void _ZN7android11BufferQueue17createBufferQueueEPNS_2spINS_22IGraphicBufferProducerEEEPNS1_INS_22IGraphicBufferConsumerEEEb(
		void* outProducer, void* outConsumer, bool consumerIsSurfaceFlinger);

void _ZN7android11BufferQueue17createBufferQueueEPNS_2spINS_22IGraphicBufferProducerEEEPNS1_INS_22IGraphicBufferConsumerEEERKNS1_INS_19IGraphicBufferAllocEEE(
		void* outProducer, void* outConsumer, void* allocator __unused, bool consumerIsSurfaceFlinger)
{
	_ZN7android11BufferQueue17createBufferQueueEPNS_2spINS_22IGraphicBufferProducerEEEPNS1_INS_22IGraphicBufferConsumerEEEb(
		outProducer, outConsumer, consumerIsSurfaceFlinger);
}

int _ZNK7android11MediaBuffer8refcountEv(android::MediaBuffer *self)
{
	return self->refcount();
}

#ifdef __cplusplus
}
#endif

//
extern "C" {
#ifdef __LP64__
    void _ZN7android18BufferItemConsumerC2ERKNS_2spINS_22IGraphicBufferConsumerEEEmib(const android::sp<android::IGraphicBufferConsumer>&, uint64_t, int, bool);

    void _ZN7android18BufferItemConsumerC1ERKNS_2spINS_22IGraphicBufferConsumerEEEjib(const android::sp<android::IGraphicBufferConsumer>& consumer, uint32_t consumerUsage, int bufferCount, bool controlledByApp) {
        _ZN7android18BufferItemConsumerC2ERKNS_2spINS_22IGraphicBufferConsumerEEEmib(consumer, static_cast<uint64_t>(consumerUsage), bufferCount, controlledByApp);
    }
#else
    void _ZN7android18BufferItemConsumerC2ERKNS_2spINS_22IGraphicBufferConsumerEEEyib(const android::sp<android::IGraphicBufferConsumer>&, uint64_t, int, bool);

    void _ZN7android18BufferItemConsumerC1ERKNS_2spINS_22IGraphicBufferConsumerEEEjib(const android::sp<android::IGraphicBufferConsumer>& consumer, uint32_t consumerUsage, int bufferCount, bool controlledByApp) {
        _ZN7android18BufferItemConsumerC2ERKNS_2spINS_22IGraphicBufferConsumerEEEyib(consumer, static_cast<uint64_t>(consumerUsage), bufferCount, controlledByApp);
    }
#endif
void _ZN7android12ConsumerBase7setNameERKNS_7String8E(const android::String8& name);

void _ZN7android18BufferItemConsumer7setNameERKNS_7String8E(const android::String8& name) {
    _ZN7android12ConsumerBase7setNameERKNS_7String8E(name);
}

}

namespace android {
    extern "C" void _ZN7android13GraphicBuffer4lockEjPPvPiS3_(uint32_t inUsage, void** vaddr, int32_t* outBytesPerPixel, int32_t* outBytesPerStride);

    extern "C" void _ZN7android13GraphicBuffer4lockEjPPv(uint32_t inUsage, void** vaddr) {
        _ZN7android13GraphicBuffer4lockEjPPvPiS3_(inUsage, vaddr, nullptr, nullptr);
    }
}

extern "C" void _ZN7android13GraphicBufferC1EjjijjjP13native_handleb(
        const native_handle_t* handle,
        android::GraphicBuffer::HandleWrapMethod method,
        uint32_t width,
        uint32_t height,
        int format,
        uint32_t layerCount,
        uint64_t usage,
        uint32_t stride);

extern "C" void _ZN7android13GraphicBufferC1EjjijjP13native_handleb(
        uint32_t inWidth,
        uint32_t inHeight,
        int inFormat,
        uint32_t inUsage,
        uint32_t inStride,
        native_handle_t* inHandle,
        bool keepOwnership)
{
    android::GraphicBuffer::HandleWrapMethod inMethod =
        (keepOwnership ? android::GraphicBuffer::TAKE_HANDLE : android::GraphicBuffer::WRAP_HANDLE);
    _ZN7android13GraphicBufferC1EjjijjjP13native_handleb(inHandle, inMethod, inWidth, inHeight,
        inFormat, static_cast<uint32_t>(1), static_cast<uint64_t>(inUsage), inStride);
}

extern "C" {
    void _ZN7android13GraphicBufferC1EjjijNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEE(
            void *(pthis), uint32_t inWidth, uint32_t inHeight, int inFormat,
            uint32_t inUsage, std::string requestorName);

    void _ZN7android13GraphicBufferC1Ejjij(void *(pthis), uint32_t inWidth, uint32_t inHeight, int inFormat, uint32_t inUsage) {
        _ZN7android13GraphicBufferC1EjjijNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEE(
            pthis, inWidth, inHeight, inFormat, inUsage, "<Unknown>");
    }
}
