//
//  ResponseSerializer.swift
//  Movies
//
//  Created by Alex Cuello ortiz on 05/01/2018.
//  Copyright © 2018 Alex Cuello ortiz. All rights reserved.
//

import Foundation
import SwiftyJSON


public protocol ResponseObjectSerializable {
    static func object(fromJSON json:JSON) -> AnyObject?
}

public protocol ResponseCollectionSerializable {
    static func collection(fromJSON json:JSON) -> AnyObject?
}
