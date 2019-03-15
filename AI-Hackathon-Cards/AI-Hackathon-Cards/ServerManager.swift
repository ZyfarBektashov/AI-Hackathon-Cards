//
//  ServerManager.swift
//  JardamBerem
//
//  Created by ZYFAR on 14.03.2018.
//  Copyright © 2018 NeoBis. All rights reserved.
//

import Foundation
import Alamofire

class ServerManager: HTTPRequestManager {
    
    class var shared: ServerManager {
        struct Static {
            static let instance = ServerManager()
        }
        return Static.instance
    }
}
