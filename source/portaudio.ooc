use portaudio
include portaudio



PA: enum {
    noError: extern(paNoError)
    notInitialized: extern(paNotInitialized)
    unanticipatedHostError: extern(paUnanticipatedHostError)
    invalidChannelCount: extern(paInvalidChannelCount)
    invalidSampleRate: extern(paInvalidSampleRate)
    invalidDevice: extern(paInvalidDevice)
    invalidFlag: extern(paInvalidFlag)
    sampleFormatNotSupported: extern(paSampleFormatNotSupported)
    badIODeviceCombination: extern(paBadIODeviceCombination)
    insufficientMemory: extern(paInsufficientMemory)
    bufferTooBig: extern(paBufferTooBig)
    bufferTooSmall: extern(paBufferTooSmall)
    nullCallback: extern(paNullCallback)
    badStreamPtr: extern(paBadStreamPtr)
    timedOut: extern(paTimedOut)
    internalError: extern(paInternalError)
    deviceUnavailable: extern(paDeviceUnavailable)
    incompatibleHostApiSpecificStreamInfo: extern(paIncompatibleHostApiSpecificStreamInfo)
    streamIsStopped: extern(paStreamIsStopped)
    streamIsNotStopped: extern(paStreamIsNotStopped)
    inputOverflowed: extern(paInputOverflowed)
    outputUnderflowed: extern(paOutputUnderflowed)
    hostApiNotFound: extern(paHostApiNotFound)
    invalidHostApi: extern(paInvalidHostApi)
    canNotReadFromACallbackStream: extern(paCanNotReadFromACallbackStream)
    canNotWriteToACallbackStream: extern(paCanNotWriteToACallbackStream)
    canNotReadFromAnOutputOnlyStream: extern(paCanNotReadFromAnOutputOnlyStream)
    canNotWriteToAnInputOnlyStream: extern(paCanNotWriteToAnInputOnlyStream)
    incompatibleStreamHostApi: extern(paIncompatibleStreamHostApi)
    badBufferPtr: extern(paBadBufferPtr)
}

_DeviceInfo: cover from PaDeviceInfo {

    structVersion: extern Int
    name: extern const CString
    hostApi: extern Int

    maxInputChannels: extern Int
    maxOutputChannels: extern Int

    defaultLowInputLatency: extern Double
    defaultLowOutputLatency: extern Double

    defaultHighInputLatency: extern Double
    defaultHighOutputLatency: extern Double

    defaultSampleRate: extern Double
}

DeviceInfo: cover from _DeviceInfo*


Error: cover from Int

Pa_Initialize: extern func -> Error
Pa_GetDeviceCount: extern func -> Int
Pa_GetDefaultInputDevice: extern func -> Int
Pa_GetDeviceInfo: extern func(Int) -> DeviceInfo
Pa_Terminate: extern func -> Error

PortAudio: class {

    init: func {
        res := Pa_Initialize()
        assert(res == PA noError)
    }

    getDeviceCount: static func -> Int {
        Pa_GetDeviceCount()
    }

    getDefaultInputDevice: static func -> Int {
        Pa_GetDefaultInputDevice()
    }

    getDeviceInfo: static func(idx: Int) -> DeviceInfo {
        Pa_GetDeviceInfo(idx)
    }

    terminate: static func -> Int {
        Pa_Terminate()
    }
}

