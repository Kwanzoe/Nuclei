//
//  protocol.swift
//  problem2
//
//  Created by Kuarnjo Taid on 25/01/23.
//
import Foundation

protocol DataHandlingProtocol: Codable {
    var encoder: JSONEncoder {get set}
    var decoder: JSONDecoder {get set}
}
