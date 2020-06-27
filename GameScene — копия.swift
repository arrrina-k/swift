import SpriteKit
import GameplayKit

struct CollisionCategories {
    static let Snake: UInt32 = 1
    static let SnakeHead: UInt32 = 1 << 1
    static let Apple: UInt32 = 1 << 2
    static let EdgeBody: UInt32 = 1 << 3    
}

class GameScene: SKScene {
    private let counterClockWiseButtonName = "counterClockwiseButton"
    private let clockWiseButtonName = "clockwiseButton"
    private var snake: Snake!
    private var apple: Apple!
    private var restartButtonName = "restartButton"
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsBody?.allowsRotation = false
        
        let counterClockwisePosition = CGPoint(x: frame.minX + 30, y: frame.minY + 30)
        let clockwisePosition = CGPoint(x: frame.maxX - 80, y: frame.minY + 30)
        let restart = CGPoint(x: frame.minX + 130, y: frame.minY + 30)
        
        addRotationButton(name: counterClockWiseButtonName, position: counterClockwisePosition)
        addRotationButton(name: clockWiseButtonName, position: clockwisePosition)
        addRestartButton(name: restartButtonName, position: restart)
        
        snake = Snake(position: CGPoint(x: frame.midX, y: frame.midY))
        addChild(snake)
        createApple()
        
        physicsWorld.contactDelegate = self
        
        physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        physicsBody?.collisionBitMask = CollisionCategories.Snake | CollisionCategories.SnakeHead
    }
    
   
    func createApple() {
        let randX = CGFloat.random(in: 0..<frame.maxX - 5)
        let randY = CGFloat.random(in: 0..<frame.maxY - 5)
        apple = Apple(position: CGPoint(x: randX, y: randY))
        
        addChild(apple)
    }
    private func start () {
           guard let scene = scene else {return}
    
        snake = Snake (position: CGPoint (x: scene.frame.midX, y: scene.frame.midY))
           snake.addChild (snake!)
    
           createApple ()
       }
    
    private func stop() {
        snake.removeAllChildren()
        apple.removeAllChildren()
    }
    
    private func addRotationButton(name: String, position: CGPoint) {
        let button = SKShapeNode()
        button.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        
        button.position = position
        button.fillColor = .gray
        button.strokeColor = .gray
        button.lineWidth = 10
        button.name = name
        addChild(button)
    }
    
    private func addRestartButton(name: String, position: CGPoint) {
        let buttonMiddle = SKShapeNode()
        buttonMiddle.path = UIBezierPath(rect: CGRect (x: 0, y: 0, width: 120, height: 45)).cgPath
               
               buttonMiddle.position = position
               buttonMiddle.fillColor = .gray
               buttonMiddle.strokeColor = .gray
               buttonMiddle.lineWidth = 10
               buttonMiddle.name = name
               addChild(buttonMiddle)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            guard let touchedNode = atPoint(touchLocation) as? SKShapeNode else { continue }
            
            if touchedNode.name == clockWiseButtonName {
                touchedNode.fillColor = .green
                snake.moveClockWise()
            }
            else if touchedNode.name == counterClockWiseButtonName {
                touchedNode.fillColor = .green
                snake.moveCounterClockWise()
            }
            else if touchedNode.name == restartButtonName {
                start()
            }
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            guard let touchedNode = atPoint(touchLocation) as? SKShapeNode else { continue }
            
            if touchedNode.name == clockWiseButtonName {
                touchedNode.fillColor = .gray
            }
            else if touchedNode.name == counterClockWiseButtonName {
                touchedNode.fillColor = .gray
            }
        }
        
        // * SKLabelNode - для отображения текста
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        snake.move()
    }
}

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        let bytes = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        let collisioObject = bytes ^ CollisionCategories.SnakeHead
        
        switch collisioObject {
        case CollisionCategories.Apple:
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            snake.addBodyPart()
            apple?.removeFromParent()
            createApple()
        case CollisionCategories.EdgeBody:
                   stop ()
                   SKLabelNode(fileNamed: "Вы проиграли")
                   break
        default:
            break
        }
    }
}
