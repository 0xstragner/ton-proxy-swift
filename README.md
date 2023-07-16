# ton-proxy-swift

Swift wrapper for a [xssnick/Tonutils-Proxy](https://github.com/xssnick/Tonutils-Proxy) [v1.3.0](https://github.com/xssnick/Tonutils-Proxy/releases/tag/v1.3.0) library

## Supported platforms

- iOS / iPadOS / macOS (Designated for iPad)

> NOTE: Simulators are not supported.

## Installation

```swift
.package(
    url: "https://github.com/0xstragner/ton-proxy-swift.git",
    .upToNextMajor(from: "0.1.0")
)
```

## Usage

```swift
import TonutilsProxy

let tunnel = TonutilsProxy.shared

try await tunnel.start(9090)
try await tunnel.stop()
```

## Examples

- [Sample iOS application](https://github.com/0xstragner/ton-proxy-application)

## Update pre-builded library

You can also free to update pre-builded [xssnick/Tonutils-Proxy](https://github.com/xssnick/Tonutils-Proxy) binaries

```shell
./build-artifacts.sh
```

## Authors

- adam@stragner.com / stragner.ton
