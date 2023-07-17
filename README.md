# ton-proxy-swift

A Swift wrapper for the [xssnick/Tonutils-Proxy](https://github.com/xssnick/Tonutils-Proxy) [v1.3.0](https://github.com/xssnick/Tonutils-Proxy/releases/tag/v1.3.0) library.

## Supported platforms

- iOS / iPadOS / macOS (Designated for iPad)

> NOTE: Simulators are not supported.

## Screenshots

| Safari (NetworkExtension)                                                                                              | WKWebView                                                                                                              |
| ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| <img width="220" alt="image" src="https://github.com/0xstragner/ton-proxy-swift/blob/main/Screenshots/0.PNG?raw=true"> | <img width="220" alt="image" src="https://github.com/0xstragner/ton-proxy-swift/blob/main/Screenshots/1.PNG?raw=true"> |

## Installation

```swift
.package(
    url: "https://github.com/0xstragner/ton-proxy-swift.git",
    .upToNextMajor(from: "0.1.0")
)
```

## Usage examples

### Start from strach

```swift
import TonutilsProxy

let tunnel = TonutilsProxy.shared

try await tunnel.start(9090)
try await tunnel.stop()
```

### Using within NetworkExtension

1. Create an application network extension
2. Create the principal class for your extension
3. Update `.entitlements`

```swift
import NetworkExtension
import TonutilsProxy

@objc(TunnelProvider)
public final class TunnelProvider: TonproxyTunnelProvider {}
```

4. Install the VPN configuration through your main application

> Please refer to the [sample iOS application](https://github.com/0xstragner/ton-proxy-application) for detailed code, if necessary

### Using within WKWebView

1. Configurate `WKWebView` with `TonutilsURLSchemeHandler`

```swift
import TonutilsProxy
import WebKit

guard let url = URL(string: "http://foundation.ton")
else {
    return
}

let port = UInt16(1234)
let tunnel = TonutilsProxy.shared

// Start proxy server
let parameters = try await tunnel.start(port)

// Create `WKURLSchemeHandler``
let schemeHandler = TonutilsURLSchemeHandler(
    address: parameters.host,
    port: parameters.port
)

// Creeate `WKWebView`` with `WKWebViewConfiguration`
let configuration = WKWebViewConfiguration()
configuration.setURLSchemeHandler(schemeHandler)

let webView = WKWebView(frame: view.bounds, configuration: configuration)
webView.load(.init(url: url))
```

2. Add `NSAppTransportSecurity` policy to your application's `Info.plist`

```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

3. `CMD+R`

> :warning: Since Apple restricts the use of proxies inside WKWebView in a legal way, I have implemented a small workaround (hack) for it

> Please refer to the [sample iOS application](https://github.com/0xstragner/ton-proxy-application) for detailed code, if necessary

## Update pre-built library

You are also free to update the pre-built [xssnick/Tonutils-Proxy](https://github.com/xssnick/Tonutils-Proxy) binaries

```shell
./build-artifacts.sh
```

## Authors

- adam@stragner.com / stragner.ton
