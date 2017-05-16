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

func ●<T>(lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T>?
{
  return lhs.dot(rhs)
}

func ✕<T>(lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T>?
{
  return lhs.cross(rhs)
}


class Matrix<T:MatrixElement>: CustomStringConvertible, Equatable
{
  let rows: [[T]]
  
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
  
  required init?(_ contents:[[T]])
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
    
    let result:[[T]] = (0 ..< rowCount).map({ r in
      let resultRow:[T] = (0 ..< otherColCount).map({ c in
        let row = rows[r]
        let col = otherTranspose.rows[c]
        
        let resultElement = (0..<columnCount).reduce(0 as! T, { (sum, i) -> T in sum + (row[i] * col[i]) })
        return resultElement
      })
      return resultRow
    })
    
    return Matrix(result)
  }
  
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



