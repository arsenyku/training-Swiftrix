//
//  Matrix.swift
//  Swiftrix
//
//  Created by asu on 2017-05-15.
//  Copyright © 2017 ArsenykUstaris. All rights reserved.
//

import Foundation

//infix operator ●:MultiplicationPrecedence
//
//func ●<T: Matrix<MatrixElement>> (lhs: T, rhs: T) -> T?
//{
//  return lhs.dot(rhs)
//}
//
//func ✕<T: Matrix<E>> (lhs: T, rhs: T) -> T where E == MatrixElement
//{
//  return Matrix<E>([]) //lhs * rhs;
//}


class Matrix<E:MatrixElement>: CustomStringConvertible
{
  typealias Out = Matrix
  
  let rows: Array<Array<E>>
  
  var 𝞣: Matrix<E>?
  {
    let rowLength = rows.first?.count ?? 0
    if let result = Matrix<E>((0..<rowLength).map({ colIndex in rows.map({ row in row[colIndex] }) }))
    {
      return result
    }
    return nil
  }
  
  required init?(_ contents:Array<Array<E>>)
  {
    let rowLength = contents.first?.count ?? 0
    for row in contents
    {
      if (row.count != rowLength)
      {
        return nil
      }
    }
    rows = contents
  }
  
  var description: String
  {
    return rows.map({ row in row.description })
      .joined(separator: "\n")
    
  }
  
  func dot(_ other:E) -> Matrix<E>?
  {
    return self
  }
}



