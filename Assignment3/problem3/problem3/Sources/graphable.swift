//
//  graphable.swift
//  problem3
//
//  Created by Kuarnjo Taid on 01/02/23.
//

protocol Graphable {
  associatedtype Element: Hashable // 1
//  var description: CustomStringConvertible { get } // 2
  func createVertex(nodeId: Element, nodeName: String, additionalInfo: String) // 3
  func add(from source: Node<Element>, to destination: Node<Element>) // 4
  func edges(from source: Node<Element>) -> [Edge<Element>]? // 6
}
