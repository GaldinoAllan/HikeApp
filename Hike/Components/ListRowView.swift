import SwiftUI

struct ListRowView: View {
    // MARK: - Properties
    @State var label: String
    @State var icon: String
    @State var content: String? = nil
    @State var iconColor: Color
    @State var linkLabel: String? = nil
    @State var linkDestination: String? = nil
    
    var body: some View {
        LabeledContent{
            if content != nil {
                Text(content!)
            } else if linkLabel != nil && linkDestination != nil {
                Link(linkLabel!, destination: URL(string: linkDestination!)!)
                    .foregroundColor(iconColor)
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(iconColor)
                    Image(systemName: icon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(label)
            }
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ListRowView(label: "Designer",
                        icon: "paintpalette",
                        content: "John Doe",
                        iconColor: .pink)
            ListRowView(label: "Website",
                        icon: "globe",
                        iconColor: .pink,
                        linkLabel: "Credo Acadamy",
                        linkDestination: "http://credo.academy")
        }
    }
}
