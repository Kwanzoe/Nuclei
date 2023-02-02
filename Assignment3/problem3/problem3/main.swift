//
//  main.swift
//  problem3
//
//  Created by Kuarnjo Taid on 31/01/23.
//

import Foundation

func run() throws {
    
    let menu = Menu()
    
    let adjacencyList = AdjacencyList<String>()
    let operations = Operate(adjacencyList: adjacencyList)
    var optionType: MenuOptions = .invalid
    
    repeat{
        optionType = menu.menu()

        if optionType == .exit{
            break
        }
        
        else{
            
            switch optionType{
                
            case .add:
                
                print("Node ID: ")
                let nodeId = readLine()
                
                print("Node name: ")
                let nodeName = readLine()
                
                print("Additional info: ")
                let additionalInfo = readLine()
                
                guard nodeId != nil || nodeName != nil || additionalInfo != nil else{
                    throw InputError.invalidInput
                }
                
                adjacencyList.createVertex(nodeId: nodeId!, nodeName: nodeName!, additionalInfo: additionalInfo!)
                
            case .addDependency:
                
                print("Enter Source Node Id")
                let sourceNodeId = readLine()!
                print("Enter Destination Node Id")
                let destinationNodeId = readLine()!
                
                let sourceNode = try operations.getNode(nodeId: sourceNodeId)
                let destinationNode = try operations.getNode(nodeId: destinationNodeId
                )

                adjacencyList.addDirectedEdge(from: sourceNode, to: destinationNode)
            
            case .parents:
                print("Enter Node Id")
                let nodeId = readLine()!
                let node = try operations.getNode(nodeId: nodeId)
                
                print(operations.parents(from: node))
                
            case .children:
                print("Enter Node Id")
                let nodeId = readLine()!
                let node = try operations.getNode(nodeId: nodeId)
                
                print(operations.children(from: node))
                
            case .ancestors:
                print("Enter Node Id")
                let nodeId = readLine()!
                let node = try operations.getNode(nodeId: nodeId)
                
                print(operations.ancestors(from: node))
            
            case .descendants:
                print("Enter Node Id")
                let nodeId = readLine()!
                let node = try operations.getNode(nodeId: nodeId)
                
                print(operations.descendants(from: node))
            
            case .deleteDependency:
                print("Enter Source Node Id")
                let sourceNodeId = readLine()!
                print("Enter Destination Node Id")
                let destinationNodeId = readLine()!
                
                let sourceNode = try operations.getNode(nodeId: sourceNodeId)
                let destinationNode = try operations.getNode(nodeId: destinationNodeId
                )
                
                operations.deleteDependency(from: sourceNode, to: destinationNode)
                
            case .deleteNode:
                print("Enter Node Id")
                let nodeId = readLine()!
                let node = try operations.getNode(nodeId: nodeId)
                
                operations.deleteNode(node: node)
                
            case .showAllDependencies:
                operations.showDependencyGraph()
            
            case .invalid:
                throw InputError.invalidInput
                
            default:
                break
            }
        }
        
    } while optionType != .exit
    
    
}


func main(){
    
    do{
        try run()
    }
    
    catch InputError.invalidInput{
        print("Enter the correct input please!")
        main()
    }
    catch InputError.wrongNodeId{
        print("Node Id does not exist")
        main()
    }
    catch{
        print(error.localizedDescription)
        main()
    }
}

main()
