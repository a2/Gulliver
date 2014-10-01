//
//  Result.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/7/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

import Foundation

public enum Result {
    case Success
    case Failure(NSError)
}

public typealias ResultHandler = Result -> Void
