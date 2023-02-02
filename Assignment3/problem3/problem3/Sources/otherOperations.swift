//
//  operations.swift
//  problem3
//
//  Created by Kuarnjo Taid on 02/02/23.
//

import Foundation

class Operate<T: Hashable> {
    
    var adjacencyList: AdjacencyList<T>
    
    init(adjacencyList: AdjacencyList<T>) {
        self.adjacencyList = adjacencyList
    }
    
    func getNode(nodeId: T) throws -> Node<T> {
        
        guard self.adjacencyList.nodeDict[nodeId] != nil else{
            throw InputError.wrongNodeId
        }
        
        return self.adjacencyList.nodeDict[nodeId]!
    }
    
    func showDependencyGraph() {
        for node in self.adjacencyList.adjacencyDict.keys{
            print(self.adjacencyList.adjacencyDict[node] ?? "No dependencies for node \(node.nodeName)")
        }
                    
    }
    
    func parents(from source: Node<T>) -> [Node<T>]{
        let edges = self.adjacencyList.edges(from: source)
        var parentsList: [Node<T>] = []
        
        for edge in edges ?? []{
            if edge.destination == source{
                parentsList.append(edge.source)
            }
        }
        
        return parentsList
        
    }
    
    func children(from source: Node<T>) -> [Node<T>]{
        let edges = self.adjacencyList.edges(from: source)
        var childrenList: [Node<T>] = []
        
        for edge in edges ?? []{
            if edge.source == source{
                childrenList.append(edge.source)
            }
        }
        
        return childrenList
        
    }
    
    func getParents(from node: Node<T>, ancestorList: inout Set<Node<T>>) {
        
        ancestorList.insert(node)
        
        for edge in self.adjacencyList.edges(from: node) ?? []{
            if edge.destination == node{
                getParents(from: edge.source, ancestorList: &ancestorList)
            }
        }
    }
    
    func getDescendants(from node: Node<T>, descendantList: inout Set<Node<T>>) {
        
        descendantList.insert(node)
        
        for edge in self.adjacencyList.edges(from: node) ?? []{
            if edge.source == node{
                getDescendants(from: edge.source, descendantList: &descendantList)
            }
        }
    }
    
    func ancestors(from source: Node<T>) -> Set<Node<T>> {
        let edges = self.adjacencyList.edges(from: source)
        var ancestorList: Set<Node<T>> = []
        var parents: [Node<T>] = []
        
        for edge in edges ?? []{
            if edge.destination == source{
                parents.append(edge.source)
            }
        }
        
        for parent in parents {
            for parentEdge in self.adjacencyList.edges(from: parent) ?? []{
                if parentEdge.destination == parent{
                    getParents(from: parentEdge.source, ancestorList: &ancestorList)
                }
            }
        }
        
        
        return ancestorList
    }
    
    
    func descendants(from source: Node<T>) -> Set<Node<T>> {
        let edges = self.adjacencyList.edges(from: source)
        var descendantList: Set<Node<T>> = []
        var children: [Node<T>] = []
        
        for edge in edges ?? []{
            if edge.source == source{
                children.append(edge.source)
            }
        }
        
        for child in children {
            for childEdge in self.adjacencyList.edges(from: child) ?? []{
                if childEdge.source == child{
                    getDescendants(from: childEdge.source, descendantList: &descendantList)
                }
            }
        }
        
        
        return descendantList
    }
    
    func deleteDependency(from source: Node<T>, to destination: Node<T>) {
        let sourceEdges = self.adjacencyList.adjacencyDict[source]?.filter{ $0.destination != destination}
    
        let destinationEdges = self.adjacencyList.adjacencyDict[destination]?.filter {$0.source != source}
        
        self.adjacencyList.adjacencyDict[source] = sourceEdges
        self.adjacencyList.adjacencyDict[destination] = destinationEdges
        
    }
    
    func deleteNode(node: Node<T>) {
        self.adjacencyList.adjacencyDict[node] = nil
    }
    
    
    
}
