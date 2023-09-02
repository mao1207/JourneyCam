import SwiftUI

struct SearchBar: View {

    @State var text: String = ""

    var body: some View {
        VStack {
            SearchBarView(text: $text)
                .padding()
            Spacer()
        }.padding(.top, 60)
    }
}


// SearchBarView搜索栏视图

struct SearchBarView: View {

    @Binding var text: String
    @State private var isEditing = false
    @State private var offset: CGFloat = .zero    //使用.animation防止报错，iOS15的特性

    var body: some View {

        HStack {
            TextField("怎样在黑暗的环境里拍摄清晰的照片？", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.black))
                .foregroundColor(Color(.white))
                .cornerRadius(8)
                .font(.system(size: 12))
                .overlay(
                    HStack {

                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)

                        // 编辑时显示清除按钮
                        if isEditing {
                        
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)

                // 点击时
                .onTapGesture {
                    self.isEditing = true
            }

            // 搜索按钮
            if isEditing {

                Button(action: {

                    self.isEditing = false
                    self.text = ""

                    // 收起键盘
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("搜索")
                        .foregroundColor(.white)
                        .font(.custom(Fonts.Roboto.bold.rawValue, size: 15))
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default, value: offset)
            }
        }
    }
}
