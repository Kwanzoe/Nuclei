//
//  vertex.swift
//  problem3
//
//  Created by Kuarnjo Taid on 01/02/23.
//

public struct Vertex<T: Hashable> {
  var data: T
}

extension Vertex: Hashable {
  

    public func hash(into hasher: inout Hasher) {
            return hasher.combine(data)
        }
        
  
  static public func ==(lhs: Vertex, rhs: Vertex) -> Bool { // 2
    return lhs.data == rhs.data
  }
}

extension Vertex: CustomStringConvertible {
  public var description: String {
    return "\(data)"
  }
}
