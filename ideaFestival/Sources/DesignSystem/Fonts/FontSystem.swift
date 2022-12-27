import UIKit

extension UIFont {
    enum Family: String {
        case bold = "Bold",
             boldItalic = "boldItalic",
             extraBold = "ExtraBold",
             extraBoldItalic = "ExtraBoldItalic",
             heavy = "Heavy",
             heavyItalic = "HeavyItalic",
             italic = "Italic",
             light = "Light",
             lightItalic = "LightItalic",
             reg = "Reg",
             semiBold = "SemiBold",
             semiBoldItalic = "SemiBoldItallic"
        
    }
    
    static func ideaFestival(size: CGFloat, family: Family) -> UIFont! {
        return UIFont(name: "Adelle-\(family.rawValue)", size: size)
    }
}

