//
//  SwiftrixTests.swift
//  SwiftrixTests
//
//  Created by asu on 2017-05-15.
//  Copyright © 2017 ArsenykUstaris. All rights reserved.
//

import XCTest
@testable import Swiftrix

class SwiftrixTests: XCTestCase
{
    override func setUp()
    {
        super.setUp()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func testMatrixCreation()
    {
      let m = Matrix([[1,0],[0,1]])
      let n = Matrix([[23.1],[0.1],[0.3]])
      let o = Matrix([[1,2,3],[4,5],[6]])
      
      assert(m != nil)
      assert(n != nil)
      assert(o == nil)
      
      print (m!)
      print (n!)
  }
  
  func testMatrixTranspose()
  {
    let m = Matrix([[1,2,3,4,5],[11,12,13,14,15],[21,22,23,24,25]])
    let mTranspose = m!.𝞣!
    assert (mTranspose.rows[0] == [1,11,21])
    assert (mTranspose.rows[1] == [2,12,22])
    assert (mTranspose.rows[2] == [3,13,23])
    assert (mTranspose.rows[3] == [4,14,24])
    assert (mTranspose.rows[4] == [5,15,25])
    
    print (mTranspose)
  }

  func testMatrixEquality()
  {
    let m1 = Matrix([[1,2,3],[4,5,6]])!
    let m2 = Matrix([[1,2,3],[4,5,6]])!
    
    assert (m1 == m2)
    
    let m3 = Matrix([[1,2,3],[4,5,900]])!
    
    assert (m1 != m3)
    
    let m4 = Matrix([[1,2],[3,4],[5,6]])
    
    assert (m1 != m4)
  }

  
  func testMatrixDotProduct()
  {
    let m = Matrix([[1,2,3],[4,5,6]])!
    let n = Matrix([[1,2], [2,3], [3,4]])!
    
    let expected = Matrix([[14, 20], [32, 47]])
    let dot = (m ● n)!
    
    assert (dot == expected)
    print (dot)
  }
}
