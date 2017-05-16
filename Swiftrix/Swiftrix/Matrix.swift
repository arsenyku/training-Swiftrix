//
//  Matrix.swift
//  Swiftrix
//
//  Created by asu on 2017-05-15.
//  Copyright © 2017 ArsenykUstaris. All rights reserved.
//

import Foundation

infix operator ●:MultiplicationPrecedence
infix operator ✕:MultiplicationPrecedence

func ●(lhs: Matrix, rhs: Matrix) -> Matrix?
{
  return lhs.dot(rhs)
}

func ✕(lhs: Matrix, rhs: Matrix) -> Matrix?
{
  return lhs.cross(rhs)
}


class Matrix: CustomStringConvertible, Equatable
{
  let rows: [[Float]]
  
  var columnCount: Int
  {
    return rows.first?.count ?? 0
  }
  
  var 𝞣: Matrix?
  {
    let rowLength = columnCount
    if let result = Matrix((0..<rowLength).map({ colIndex in rows.map({ row in row[colIndex] }) }))
    {
      return result
    }
    return nil
  }
  
  required init?(_ contents:[[Float]])
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
  
  fileprivate func dot(_ other:Matrix) -> Matrix?
  {
    let otherRowCount = other.rows.count
    let otherColCount = other.columnCount
    let rowCount = rows.count
    
    guard columnCount == otherRowCount,
      let otherTranspose = other.𝞣
    else { return nil }
    
    let x:[[Float]] = (0 ..< rowCount).map({ r in
      let y:[Float] = (0 ..< otherColCount).map({ c in
        let row = rows[r]
        let col = otherTranspose.rows[c]
        
        let z = (0..<columnCount).reduce(0, { sum, i in sum + (row[i] * col[i]) })
        return z
      })
      return y
    })
    
    return Matrix(x)
  }
  
//  fileprivate func dot1(_ other:Matrix) -> Matrix?
//  {
//    guard columnCount == other.rows.count else { return nil }
//    
//    let otherColCount = other.columnCount
//    let otherTranspose = other.𝞣!
//    
//    for r in 0..<rows.count
//    {
//      for c in 0..<otherColCount
//      {
//        let row = rows[r]
//        let col = otherTranspose.rows[c]
//        var sum:Float = 0
//        for i in 0..<columnCount
//        {
//          sum += row[i] * col[i]
//        }
//        
//      }
//    }
//  }

  fileprivate func cross(_ other:Matrix) -> Matrix?
  {
    return self
  }

  static func == (lhs: Matrix, rhs: Matrix) -> Bool {
    return lhs.rows.count == rhs.rows.count &&
      lhs.columnCount == rhs.columnCount &&
      lhs.rows.enumerated()
        .map({ rIndex, row in
          return row == rhs.rows[rIndex]
        })
        .reduce(true, { accumulator, elementMatch in accumulator && elementMatch })
  }
}



