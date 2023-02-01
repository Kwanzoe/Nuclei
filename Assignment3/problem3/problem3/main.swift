//
//  main.swift
//  problem3
//
//  Created by Kuarnjo Taid on 31/01/23.
//

import Foundation
    
let adjacencyList = AdjacencyList<String>()

let singapore = adjacencyList.createVertex(data: "Singapore")
let tokyo = adjacencyList.createVertex(data: "Tokyo")
let hongKong = adjacencyList.createVertex(data: "Hong Kong")
let detroit = adjacencyList.createVertex(data: "Detroit")
let sanFrancisco = adjacencyList.createVertex(data: "San Francisco")
let washingtonDC = adjacencyList.createVertex(data: "Washington DC")
let austinTexas = adjacencyList.createVertex(data: "Austin Texas")
let seattle = adjacencyList.createVertex(data: "Seattle")

adjacencyList.add(.undirected, from: singapore, to: hongKong)
adjacencyList.add(.undirected, from: singapore, to: tokyo)
adjacencyList.add(.undirected, from: hongKong, to: tokyo)
adjacencyList.add(.undirected, from: tokyo, to: detroit)
adjacencyList.add(.undirected, from: tokyo, to: washingtonDC)
adjacencyList.add(.undirected, from: hongKong, to: sanFrancisco)
adjacencyList.add(.undirected, from: detroit, to: austinTexas)
adjacencyList.add(.undirected, from: austinTexas, to: washingtonDC)
adjacencyList.add(.undirected, from: sanFrancisco, to: washingtonDC)
adjacencyList.add(.undirected, from: washingtonDC, to: seattle)
adjacencyList.add(.undirected, from: sanFrancisco, to: seattle)
adjacencyList.add(.undirected, from: austinTexas, to: sanFrancisco)

print(adjacencyList.description)
