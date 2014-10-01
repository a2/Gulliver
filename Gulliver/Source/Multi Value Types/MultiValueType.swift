//
//  MultiValueType.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/11/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

public protocol MultiValueRepresentable {

    typealias MultiValueType

    class var multiValueType: PropertyType { get }

    var multiValueRepresentation: MultiValueType { get }

    init?(multiValueRepresentation: MultiValueType)

}
