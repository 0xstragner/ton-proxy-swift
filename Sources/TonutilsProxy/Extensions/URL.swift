//
//  Created by Adam Stragner
//

import Foundation

internal extension URL {
    var isTON: Bool {
        !TonutilsProxy.SupportedDomain
            .allCases
            .map({ ".\($0)" })
            .filter({ (host ?? "").hasSuffix($0) })
            .isEmpty
    }
}
