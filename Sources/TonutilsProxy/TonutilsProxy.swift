//
//  Created by Adam Stragner
//

import Foundation
import TonutilsProxyBridge

// MARK: - TonutilsProxy

public final class TonutilsProxy: TPBTunnel {
    public static var shared: TonutilsProxy {
        shared()
    }

    @discardableResult
    public func start(_ port: UInt16 = 9090) async throws -> TPBTunnelParameters {
        try await start(withPort: port)
    }
}

// MARK: TonutilsProxy.SupportedDomain

public extension TonutilsProxy {
    enum SupportedDomain: String, CaseIterable, RawRepresentable {
        case ton
        case adnl
        case tme = "t.me"
        case bag
    }
}
