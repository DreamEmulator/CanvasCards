//
//  KishimisuScene.swift
//  CanvasCards
//
//  Created by Sebastiaan Hols on 12/06/2023.
//

import SwiftUI
import SpriteKit

struct KishimisuView: View {
  @State private var showSplash = false

  var body: some View {
    GeometryReader { geometry in
      ZStack {
        if showSplash {
          SpriteView(scene: createSpriteKitScene(size: geometry.size))
            .frame(width: geometry.size.height, height: geometry.size.height)
            .transition(.fadeTransition)
        } else {
          TondorLogo()
            .padding(.top)
        }
      }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }.edgesIgnoringSafeArea(.all)
      .onAppear{
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
          withAnimation {
            showSplash.toggle()
          }
        }
      }
  }

  func createSpriteKitScene(size: CGSize) -> SKScene {
    let shaderFrame = CGRect(x: 0, y: 0, width: size.height, height: size.height)

    let spriteSizeVector = vector_float2(Float(shaderFrame.size.width),
                                   Float(shaderFrame.size.height))

    let spriteSize = CGSize(width: shaderFrame.width, height: shaderFrame.height)

    let scene = SKScene(size: spriteSize)

    scene.backgroundColor = .white

    let sprite = SKSpriteNode(color: .blue, size: CGSize(width: size.height, height: size.height))
    sprite.position = CGPoint(x: size.width / 2, y: size.height / 2)

    let shaders: [SKShader] = [
      SKShader(fileNamed: "Kishimisu"),
      SKShader(fileNamed: "KishimisuNeonSquirqles"),
      SKShader(fileNamed: "KishimisuDancingStars")]
//    sprite.shader = shaders[Int(arc4random_uniform(2))]
    sprite.shader = shaders[1]

    if let shader = sprite.shader {
      let uniforms: [SKUniform] = [
        SKUniform(name: "u_darkMode", float: UITraitCollection.current.userInterfaceStyle == .dark ? 1.0 : 0.0),
        SKUniform(name: "u_speed", float: 3),
        SKUniform(name: "u_strength", float: 2.5),
        SKUniform(name: "u_frequency", float: 10),
        SKUniform(name: "u_sprite_size", vectorFloat2: spriteSizeVector)
      ]
      shader.uniforms = uniforms
    }

    scene.addChild(sprite)

    return scene
  }
}
