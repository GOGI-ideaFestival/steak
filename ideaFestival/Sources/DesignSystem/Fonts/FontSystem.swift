import UIKit

extension UIFont {
    enum Family: String {
        case bold = "Bold",
             boldItalic = "BoldItalic",
             extraBold = "ExtraBold",
             extraBoldItalic = "ExtraBoldItalic",
             heavy = "Heavy",
             heavyItalic = "HeavyItalic",
             italic = "Italic",
             light = "Light",
             lightItalic = "LightItalic",
             regular = "Regular",
             semiBold = "SemiBold",
             semiBoldItalic = "SemiBoldItalic"
    }
    
    static func ideaFestival(size: CGFloat, family: Family) -> UIFont! {
        return UIFont(name: "Adelle-\(family.rawValue)", size: size)
    }
}

