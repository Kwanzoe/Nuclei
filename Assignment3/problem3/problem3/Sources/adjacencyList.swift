//
//  adjacencyList.swift
//  problem3
//
//  Created by Kuarnjo Taid on 01/02/23.
//

class AdjacencyList<T: Hashable> {
    
    public var adjacencyDict : [Node<T>: [Edge<T>]] = [:]
    public typealias Element = T
    public var nodeDict : [T: Node<T>] = [:]
    public init() {}
    
    func addDirectedEdge(from source: Node<Element>, to destination: Node<Element>) {
    let edge = Edge(source: source, destination: destination) // 1
    adjacencyDict[source]?.append(edge)
    adjacencyDict[destination]?.append(edge)
    
    }

    
    
}


extension AdjacencyList: Graphable {
    
    public func edges(from source: Node<Element>) -> [Edge<Element>]? {
        return adjacencyDict[source]
    }
    
    public func createVertex(nodeId: Element, nodeName: String, additionalInfo: String) {
        var node = Node(nodeId: nodeId, nodeName: nodeName, additionalInfo: additionalInfo)
        node.additionalInfoKeyValue["additional"] = additionalInfo
        
        if nodeDict[node.nodeId] == nil{
            self.nodeDict[node.nodeId] = node
        }
        if adjacencyDict[node] == nil {
            self.adjacencyDict[node] = []
        }
        
    }
    
    public func add(from source: Node<Element>, to destination: Node<Element>) {
        
        addDirectedEdge(from: source, to: destination) 
    }
    
}


