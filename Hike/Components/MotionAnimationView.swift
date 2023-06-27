import SwiftUI

struct MotionAnimationView: View {
    // MARK: - Properties
    
    @State private var randomCircle = Int.random(in: 6...12)
    @State private var isAnimating = false
    
    // MARK: - Computed Properties
    
    var randomCoordinate: CGFloat { CGFloat.random(in: 0...256) }
    var randomSize: CGFloat { CGFloat(Int.random(in: 4...80)) }
    var randomScale: CGFloat { CGFloat(Double.random(in: 0.1...2.0)) }
    var randomSpeed: Double { Double.random(in: 0.05...1.0) }
    var randomDelay: Double { Double.random(in: 0...2) }
    
    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .opacity(0.25)
                    .foregroundColor(.white)
                    .frame(width: randomSize)
                    .position(x: randomCoordinate,
                              y: randomCoordinate)
                    .scaleEffect(isAnimating ? randomScale : 1)
                    .onAppear {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed)
                            .delay(randomDelay)
                        ) {
                            isAnimating = true
                        }
                    }
            }
        } // ZStack
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
            .background(
                Circle()
                    .fill(.teal)
            )
    }
}
