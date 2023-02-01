//
//  graphable.swift
//  problem3
//
//  Created by Kuarnjo Taid on 01/02/23.
//

protocol Graphable {
  associatedtype Element: Hashable // 1
  var description: CustomStringConvertible { get } // 2
  
  func createVertex(data: Element) -> Vertex<Element> // 3
  func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>) // 4
  func edges(from source: Vertex<Element>) -> [Edge<Element>]? // 6
}
