//
//  edge.swift
//  problem3
//
//  Created by Kuarnjo Taid on 01/02/23.
//

public enum EdgeType {
  case directed, undirected
}

public struct Edge<T: Hashable> {
  public var source: Vertex<T> // 1
  public var destination: Vertex<T>
}



