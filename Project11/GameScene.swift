//
//  GameScene.swift
//  Project11
//
//  Created by Антон Кашников on 16.06.2023.
//

import SpriteKit

final class GameScene: SKScene {
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background.jpg")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)

        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)

        var x = 0
        for _ in 0...4 {
            makeBouncer(at: CGPoint(x: x, y: 0))
            x += 256
        }

        scene?.scaleMode = .aspectFit
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let size = CGSize(width: 64, height: 64)
            let ball = SKSpriteNode(imageNamed: "ballRed")
            ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2)
            ball.physicsBody?.restitution = 0.4
            ball.position = touch.location(in: self)
            addChild(ball)
        }
    }

    private func makeBouncer(at position: CGPoint) {
        let bouncer = SKSpriteNode(imageNamed: "bouncer")
        bouncer.position = position
        bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width / 2)
        bouncer.physicsBody?.isDynamic = false
        addChild(bouncer)
    }
}
