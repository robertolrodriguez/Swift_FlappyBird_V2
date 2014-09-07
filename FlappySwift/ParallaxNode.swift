//
//  ParallaxNode.swift
//  FlappySwift
//
//  Created by Giordano Scalzo on 26/08/2014.
//  Copyright (c) 2014 Effective Code. All rights reserved.
//

import UIKit
import SpriteKit

class ParallaxNode {
    private let node: SKSpriteNode!
    
    init(width: CGFloat, height: CGFloat, textureNamed: String) {
        let size = CGSizeMake(2*width, height)
        
        let texture = SKTexture(imageNamed: textureNamed)
        node = SKSpriteNode(color: UIColor.whiteColor(), size: size)
        
        let location = CGPoint(x: 0, y: 0)
        node.anchorPoint = CGPoint(x: 0, y: 0)
        node.position = location
        node.addChild(createNode(texture, position: 0))
        node.addChild(createNode(texture, position: width))
    }
    
    private func createNode(texture: SKTexture, position: CGFloat) -> SKNode {
        let node = SKSpriteNode(texture: texture)
        node.anchorPoint = CGPoint(x: 0, y: 0)
        node.position = CGPoint(x: position, y: 0)
        
        return node
    }
    
    func zPosition(zPosition: CGFloat) -> ParallaxNode {
        node.zPosition = zPosition
        return self
    }
   
    func addTo(parentNode: SKSpriteNode) -> ParallaxNode {
        parentNode.addChild(node)
        return self
    }
    
    func start(#duration: NSTimeInterval) {
//        let distanceToMove = -node.size.width
        node.runAction(SKAction.repeatActionForever(SKAction.sequence(
            [
                SKAction.moveToX(-node.size.width/2.0, duration: duration),
                SKAction.moveToX(0, duration: 0)
            ]
            )))
    }
    
    func stop() {
        node.removeAllActions()
    }
    
}