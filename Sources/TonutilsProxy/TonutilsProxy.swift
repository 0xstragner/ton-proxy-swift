//
//  Created by Adam Stragner
//

import Foundation
import TonutilsProxyBridge

public final class TonutilsProxy: TPBTunnel {
    public static var shared: TonutilsProxy {
        shared()
    }

    @discardableResult
    public func start(_ port: UInt16 = 9090) async throws -> TPBTunnelParameters {
        try await start(withPort: port)
    }
}
