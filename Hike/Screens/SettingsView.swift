import SwiftUI

struct SettingsView: View {
    // MARK: - Properties
    private let alternateAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire",
    ]
    
    var body: some View {
        List {
            // MARK: - Section: Header
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editors' Choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(LinearGradient(colors: [.greenLight, .greenMedium, .greenDark],
                                                startPoint: .top,
                                                endPoint: .bottom))
                .padding(.top, 8)
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.greenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            } //: Header
            .listRowSeparator(.hidden)
            // MARK: - Section: Icons
            
            Section {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button {
                                print(alternateAppIcons[item])
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                    if error != nil {
                                        print("Failed request to update app's icon \(String(describing: error?.localizedDescription))")
                                    } else {
                                        print("Success! You have changed the app's icon to \(alternateAppIcons[item])")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                        .buttonStyle(.borderless)
                        }
                    }
                }
                .padding(.top, 12)
                Text("Choose your favorite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            } header: {
                Text("Alternate Icons")
            }
            .listRowSeparator(.hidden)

            
            // MARK: - Section: About
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack {
                    Spacer()
                    Text("Copyright © All right reserved.")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
                ListRowView(label: "Application", icon: "apps.iphone", content: "Hike", iconColor: .blue)
                ListRowView(label: "Compatibility", icon: "info.circle", content: "iOS, iPadOS", iconColor: .red)
                ListRowView(label: "Technology", icon: "swift", content: "Swift", iconColor: .orange)
                ListRowView(label: "App Version", icon: "gear", content: "1.0.0", iconColor: .purple)
                ListRowView(label: "Lead Developer", icon: "ellipsis.curlybraces", content: "Allan Galdino", iconColor: .mint)
                ListRowView(label: "Designer", icon: "paintpalette", content: "Robert Petras", iconColor: .pink)
                ListRowView(label: "Website", icon: "globe", iconColor: .indigo, linkLabel: "Credo Academy", linkDestination: "http://credo.academy")
            } //: Section
        } //: List
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
