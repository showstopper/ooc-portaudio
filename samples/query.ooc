use portaudio
import portaudio

main: func {

    pa := PortAudio new()
    deviceCount := pa getDeviceCount()
    assert (deviceCount > 0)
    for (i in 0..deviceCount) {
        "Device #%d" format(i) println()
        deviceInfo := pa getDeviceInfo(i)
        ".. name: %s" format(deviceInfo@ name toString()) println()
        ".. max input channels: %d" format(deviceInfo@ maxInputChannels) println()
        ".. max output channels: %d" format(deviceInfo@ maxOutputChannels) println()
    }   

    pa terminate()
}
