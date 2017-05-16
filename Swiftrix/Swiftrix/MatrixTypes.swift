//
//  MatrixTypes.swift
//  Swiftrix
//
//  Created by asu on 2017-05-15.
//  Copyright © 2017 ArsenykUstaris. All rights reserved.
//

import Foundation

protocol Additive
{
  static func + (a: Self, b: Self) -> Self
}

func +<T: Additive> (lhs: T, rhs: T) -> T 
{
  return lhs + rhs;
}

protocol Multiplicative
{
  static func * (a: Self, b: Self) -> Self
}

func *<T: Multiplicative> (lhs: T, rhs: T) -> T
{
  return lhs * rhs;
}

protocol MatrixElement: Additive, Multiplicative, Equatable
{
}

extension Int:MatrixElement {}
extension Float:MatrixElement {}
extension Double:MatrixElement {}
