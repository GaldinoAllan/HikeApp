import SwiftUI

struct CardView: View {
    var body: some View {
        // MARK: - Card
        ZStack {
            CustomBackgroundView()
                .frame(width: 320, height: 570)
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.indigoMedium, .salmonLight],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 256, height: 256)
                Image("image-1")
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

struct CardView__Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
