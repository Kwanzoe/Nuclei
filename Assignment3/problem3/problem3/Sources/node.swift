//
//  vertex.swift
//  problem3
//
//  Created by Kuarnjo Taid on 01/02/23.
//

public struct Node<T: Hashable> {
    var nodeId: T
    var nodeName: String
    var additionalInfo: String
    var additionalInfoKeyValue: [String:String] = ["additionalInfo": ""]
}

extension Node: Hashable {
  

    public func hash(into hasher: inout Hasher) {
            return hasher.combine(nodeId)
        }
        
  
  static public func ==(lhs: Node, rhs: Node) -> Bool { // 2
    return lhs.nodeId == rhs.nodeId
  }
}

extension Node: CustomStringConvertible {
  public var description: String {
    return "\(nodeId)"
  }
}
