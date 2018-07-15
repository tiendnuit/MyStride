//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try font.validate()
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 colors.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 20 files.
  struct file {
    /// Resource file `Montserrat-Black.otf`.
    static let montserratBlackOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-Black", pathExtension: "otf")
    /// Resource file `Montserrat-BlackItalic.otf`.
    static let montserratBlackItalicOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-BlackItalic", pathExtension: "otf")
    /// Resource file `Montserrat-Bold.otf`.
    static let montserratBoldOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-Bold", pathExtension: "otf")
    /// Resource file `Montserrat-BoldItalic.otf`.
    static let montserratBoldItalicOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-BoldItalic", pathExtension: "otf")
    /// Resource file `Montserrat-ExtraBold.otf`.
    static let montserratExtraBoldOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-ExtraBold", pathExtension: "otf")
    /// Resource file `Montserrat-ExtraBoldItalic.otf`.
    static let montserratExtraBoldItalicOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-ExtraBoldItalic", pathExtension: "otf")
    /// Resource file `Montserrat-ExtraLight.otf`.
    static let montserratExtraLightOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-ExtraLight", pathExtension: "otf")
    /// Resource file `Montserrat-ExtraLightItalic.otf`.
    static let montserratExtraLightItalicOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-ExtraLightItalic", pathExtension: "otf")
    /// Resource file `Montserrat-Italic.otf`.
    static let montserratItalicOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-Italic", pathExtension: "otf")
    /// Resource file `Montserrat-Light.otf`.
    static let montserratLightOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-Light", pathExtension: "otf")
    /// Resource file `Montserrat-LightItalic.otf`.
    static let montserratLightItalicOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-LightItalic", pathExtension: "otf")
    /// Resource file `Montserrat-Medium.otf`.
    static let montserratMediumOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-Medium", pathExtension: "otf")
    /// Resource file `Montserrat-MediumItalic.otf`.
    static let montserratMediumItalicOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-MediumItalic", pathExtension: "otf")
    /// Resource file `Montserrat-Regular.otf`.
    static let montserratRegularOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-Regular", pathExtension: "otf")
    /// Resource file `Montserrat-SemiBold.otf`.
    static let montserratSemiBoldOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-SemiBold", pathExtension: "otf")
    /// Resource file `Montserrat-SemiBoldItalic.otf`.
    static let montserratSemiBoldItalicOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-SemiBoldItalic", pathExtension: "otf")
    /// Resource file `Montserrat-Thin.otf`.
    static let montserratThinOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-Thin", pathExtension: "otf")
    /// Resource file `Montserrat-ThinItalic.otf`.
    static let montserratThinItalicOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-ThinItalic", pathExtension: "otf")
    /// Resource file `SIL Open Font License.txt`.
    static let silOpenFontLicenseTxt = Rswift.FileResource(bundle: R.hostingBundle, name: "SIL Open Font License", pathExtension: "txt")
    /// Resource file `country-info.json`.
    static let countryInfoJson = Rswift.FileResource(bundle: R.hostingBundle, name: "country-info", pathExtension: "json")
    
    /// `bundle.url(forResource: "Montserrat-Black", withExtension: "otf")`
    static func montserratBlackOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratBlackOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-BlackItalic", withExtension: "otf")`
    static func montserratBlackItalicOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratBlackItalicOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-Bold", withExtension: "otf")`
    static func montserratBoldOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratBoldOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-BoldItalic", withExtension: "otf")`
    static func montserratBoldItalicOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratBoldItalicOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-ExtraBold", withExtension: "otf")`
    static func montserratExtraBoldOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratExtraBoldOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-ExtraBoldItalic", withExtension: "otf")`
    static func montserratExtraBoldItalicOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratExtraBoldItalicOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-ExtraLight", withExtension: "otf")`
    static func montserratExtraLightOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratExtraLightOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-ExtraLightItalic", withExtension: "otf")`
    static func montserratExtraLightItalicOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratExtraLightItalicOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-Italic", withExtension: "otf")`
    static func montserratItalicOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratItalicOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-Light", withExtension: "otf")`
    static func montserratLightOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratLightOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-LightItalic", withExtension: "otf")`
    static func montserratLightItalicOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratLightItalicOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-Medium", withExtension: "otf")`
    static func montserratMediumOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratMediumOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-MediumItalic", withExtension: "otf")`
    static func montserratMediumItalicOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratMediumItalicOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-Regular", withExtension: "otf")`
    static func montserratRegularOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratRegularOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-SemiBold", withExtension: "otf")`
    static func montserratSemiBoldOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratSemiBoldOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-SemiBoldItalic", withExtension: "otf")`
    static func montserratSemiBoldItalicOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratSemiBoldItalicOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-Thin", withExtension: "otf")`
    static func montserratThinOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratThinOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-ThinItalic", withExtension: "otf")`
    static func montserratThinItalicOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratThinItalicOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SIL Open Font License", withExtension: "txt")`
    static func silOpenFontLicenseTxt(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.silOpenFontLicenseTxt
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "country-info", withExtension: "json")`
    static func countryInfoJson(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.countryInfoJson
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 18 fonts.
  struct font: Rswift.Validatable {
    /// Font `Montserrat-BlackItalic`.
    static let montserratBlackItalic = Rswift.FontResource(fontName: "Montserrat-BlackItalic")
    /// Font `Montserrat-Black`.
    static let montserratBlack = Rswift.FontResource(fontName: "Montserrat-Black")
    /// Font `Montserrat-BoldItalic`.
    static let montserratBoldItalic = Rswift.FontResource(fontName: "Montserrat-BoldItalic")
    /// Font `Montserrat-Bold`.
    static let montserratBold = Rswift.FontResource(fontName: "Montserrat-Bold")
    /// Font `Montserrat-ExtraBoldItalic`.
    static let montserratExtraBoldItalic = Rswift.FontResource(fontName: "Montserrat-ExtraBoldItalic")
    /// Font `Montserrat-ExtraBold`.
    static let montserratExtraBold = Rswift.FontResource(fontName: "Montserrat-ExtraBold")
    /// Font `Montserrat-ExtraLightItalic`.
    static let montserratExtraLightItalic = Rswift.FontResource(fontName: "Montserrat-ExtraLightItalic")
    /// Font `Montserrat-ExtraLight`.
    static let montserratExtraLight = Rswift.FontResource(fontName: "Montserrat-ExtraLight")
    /// Font `Montserrat-Italic`.
    static let montserratItalic = Rswift.FontResource(fontName: "Montserrat-Italic")
    /// Font `Montserrat-LightItalic`.
    static let montserratLightItalic = Rswift.FontResource(fontName: "Montserrat-LightItalic")
    /// Font `Montserrat-Light`.
    static let montserratLight = Rswift.FontResource(fontName: "Montserrat-Light")
    /// Font `Montserrat-MediumItalic`.
    static let montserratMediumItalic = Rswift.FontResource(fontName: "Montserrat-MediumItalic")
    /// Font `Montserrat-Medium`.
    static let montserratMedium = Rswift.FontResource(fontName: "Montserrat-Medium")
    /// Font `Montserrat-Regular`.
    static let montserratRegular = Rswift.FontResource(fontName: "Montserrat-Regular")
    /// Font `Montserrat-SemiBoldItalic`.
    static let montserratSemiBoldItalic = Rswift.FontResource(fontName: "Montserrat-SemiBoldItalic")
    /// Font `Montserrat-SemiBold`.
    static let montserratSemiBold = Rswift.FontResource(fontName: "Montserrat-SemiBold")
    /// Font `Montserrat-ThinItalic`.
    static let montserratThinItalic = Rswift.FontResource(fontName: "Montserrat-ThinItalic")
    /// Font `Montserrat-Thin`.
    static let montserratThin = Rswift.FontResource(fontName: "Montserrat-Thin")
    
    /// `UIFont(name: "Montserrat-Black", size: ...)`
    static func montserratBlack(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratBlack, size: size)
    }
    
    /// `UIFont(name: "Montserrat-BlackItalic", size: ...)`
    static func montserratBlackItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratBlackItalic, size: size)
    }
    
    /// `UIFont(name: "Montserrat-Bold", size: ...)`
    static func montserratBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratBold, size: size)
    }
    
    /// `UIFont(name: "Montserrat-BoldItalic", size: ...)`
    static func montserratBoldItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratBoldItalic, size: size)
    }
    
    /// `UIFont(name: "Montserrat-ExtraBold", size: ...)`
    static func montserratExtraBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratExtraBold, size: size)
    }
    
    /// `UIFont(name: "Montserrat-ExtraBoldItalic", size: ...)`
    static func montserratExtraBoldItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratExtraBoldItalic, size: size)
    }
    
    /// `UIFont(name: "Montserrat-ExtraLight", size: ...)`
    static func montserratExtraLight(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratExtraLight, size: size)
    }
    
    /// `UIFont(name: "Montserrat-ExtraLightItalic", size: ...)`
    static func montserratExtraLightItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratExtraLightItalic, size: size)
    }
    
    /// `UIFont(name: "Montserrat-Italic", size: ...)`
    static func montserratItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratItalic, size: size)
    }
    
    /// `UIFont(name: "Montserrat-Light", size: ...)`
    static func montserratLight(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratLight, size: size)
    }
    
    /// `UIFont(name: "Montserrat-LightItalic", size: ...)`
    static func montserratLightItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratLightItalic, size: size)
    }
    
    /// `UIFont(name: "Montserrat-Medium", size: ...)`
    static func montserratMedium(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratMedium, size: size)
    }
    
    /// `UIFont(name: "Montserrat-MediumItalic", size: ...)`
    static func montserratMediumItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratMediumItalic, size: size)
    }
    
    /// `UIFont(name: "Montserrat-Regular", size: ...)`
    static func montserratRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratRegular, size: size)
    }
    
    /// `UIFont(name: "Montserrat-SemiBold", size: ...)`
    static func montserratSemiBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratSemiBold, size: size)
    }
    
    /// `UIFont(name: "Montserrat-SemiBoldItalic", size: ...)`
    static func montserratSemiBoldItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratSemiBoldItalic, size: size)
    }
    
    /// `UIFont(name: "Montserrat-Thin", size: ...)`
    static func montserratThin(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratThin, size: size)
    }
    
    /// `UIFont(name: "Montserrat-ThinItalic", size: ...)`
    static func montserratThinItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratThinItalic, size: size)
    }
    
    static func validate() throws {
      if R.font.montserratSemiBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-SemiBold' could not be loaded, is 'Montserrat-SemiBold.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratExtraBoldItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-ExtraBoldItalic' could not be loaded, is 'Montserrat-ExtraBoldItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratThinItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-ThinItalic' could not be loaded, is 'Montserrat-ThinItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratBlack(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-Black' could not be loaded, is 'Montserrat-Black.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratExtraLightItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-ExtraLightItalic' could not be loaded, is 'Montserrat-ExtraLightItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratLightItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-LightItalic' could not be loaded, is 'Montserrat-LightItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratExtraLight(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-ExtraLight' could not be loaded, is 'Montserrat-ExtraLight.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-Regular' could not be loaded, is 'Montserrat-Regular.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-Bold' could not be loaded, is 'Montserrat-Bold.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratExtraBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-ExtraBold' could not be loaded, is 'Montserrat-ExtraBold.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratMedium(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-Medium' could not be loaded, is 'Montserrat-Medium.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratLight(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-Light' could not be loaded, is 'Montserrat-Light.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratBlackItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-BlackItalic' could not be loaded, is 'Montserrat-BlackItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratBoldItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-BoldItalic' could not be loaded, is 'Montserrat-BoldItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-Italic' could not be loaded, is 'Montserrat-Italic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratSemiBoldItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-SemiBoldItalic' could not be loaded, is 'Montserrat-SemiBoldItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratMediumItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-MediumItalic' could not be loaded, is 'Montserrat-MediumItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratThin(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-Thin' could not be loaded, is 'Montserrat-Thin.otf' added to the UIAppFonts array in this targets Info.plist?") }
    }
    
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 6 images.
  struct image {
    /// Image `avatar-mockup`.
    static let avatarMockup = Rswift.ImageResource(bundle: R.hostingBundle, name: "avatar-mockup")
    /// Image `bg-rounded`.
    static let bgRounded = Rswift.ImageResource(bundle: R.hostingBundle, name: "bg-rounded")
    /// Image `icon-red-close`.
    static let iconRedClose = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon-red-close")
    /// Image `icon-white-horse-shoe`.
    static let iconWhiteHorseShoe = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon-white-horse-shoe")
    /// Image `logo`.
    static let logo = Rswift.ImageResource(bundle: R.hostingBundle, name: "logo")
    /// Image `mockup`.
    static let mockup = Rswift.ImageResource(bundle: R.hostingBundle, name: "mockup")
    
    /// `UIImage(named: "avatar-mockup", bundle: ..., traitCollection: ...)`
    static func avatarMockup(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.avatarMockup, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "bg-rounded", bundle: ..., traitCollection: ...)`
    static func bgRounded(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.bgRounded, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icon-red-close", bundle: ..., traitCollection: ...)`
    static func iconRedClose(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.iconRedClose, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icon-white-horse-shoe", bundle: ..., traitCollection: ...)`
    static func iconWhiteHorseShoe(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.iconWhiteHorseShoe, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "logo", bundle: ..., traitCollection: ...)`
    static func logo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.logo, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "mockup", bundle: ..., traitCollection: ...)`
    static func mockup(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.mockup, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 0 reuse identifiers.
  struct reuseIdentifier {
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 4 view controllers.
  struct segue {
    /// This struct is generated for `ConfirmationViewController`, and contains static references to 1 segues.
    struct confirmationViewController {
      /// Segue identifier `ToHandle`.
      static let toHandle: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, ConfirmationViewController, HandleViewController> = Rswift.StoryboardSegueIdentifier(identifier: "ToHandle")
      
      /// Optionally returns a typed version of segue `ToHandle`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func toHandle(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, ConfirmationViewController, HandleViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.confirmationViewController.toHandle, segue: segue)
      }
      
      fileprivate init() {}
    }
    
    /// This struct is generated for `LoginContainerViewController`, and contains static references to 1 segues.
    struct loginContainerViewController {
      /// Segue identifier `ToLogin`.
      static let toLogin: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, LoginContainerViewController, BaseNavigationController> = Rswift.StoryboardSegueIdentifier(identifier: "ToLogin")
      
      /// Optionally returns a typed version of segue `ToLogin`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func toLogin(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, LoginContainerViewController, BaseNavigationController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.loginContainerViewController.toLogin, segue: segue)
      }
      
      fileprivate init() {}
    }
    
    /// This struct is generated for `LoginViewController`, and contains static references to 1 segues.
    struct loginViewController {
      /// Segue identifier `ToConfirm`.
      static let toConfirm: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, LoginViewController, ConfirmationViewController> = Rswift.StoryboardSegueIdentifier(identifier: "ToConfirm")
      
      /// Optionally returns a typed version of segue `ToConfirm`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func toConfirm(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, LoginViewController, ConfirmationViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.loginViewController.toConfirm, segue: segue)
      }
      
      fileprivate init() {}
    }
    
    /// This struct is generated for `SignUpViewController`, and contains static references to 1 segues.
    struct signUpViewController {
      /// Segue identifier `ToConfirm`.
      static let toConfirm: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, SignUpViewController, ConfirmationViewController> = Rswift.StoryboardSegueIdentifier(identifier: "ToConfirm")
      
      /// Optionally returns a typed version of segue `ToConfirm`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func toConfirm(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, SignUpViewController, ConfirmationViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.signUpViewController.toConfirm, segue: segue)
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 11 storyboards.
  struct storyboard {
    /// Storyboard `Activity`.
    static let activity = _R.storyboard.activity()
    /// Storyboard `AddNew`.
    static let addNew = _R.storyboard.addNew()
    /// Storyboard `Handle`.
    static let handle = _R.storyboard.handle()
    /// Storyboard `HomePage`.
    static let homePage = _R.storyboard.homePage()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `LogIn`.
    static let logIn = _R.storyboard.logIn()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    /// Storyboard `Profile`.
    static let profile = _R.storyboard.profile()
    /// Storyboard `SignUp`.
    static let signUp = _R.storyboard.signUp()
    /// Storyboard `Stable`.
    static let stable = _R.storyboard.stable()
    /// Storyboard `TackStore`.
    static let tackStore = _R.storyboard.tackStore()
    
    /// `UIStoryboard(name: "Activity", bundle: ...)`
    static func activity(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.activity)
    }
    
    /// `UIStoryboard(name: "AddNew", bundle: ...)`
    static func addNew(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.addNew)
    }
    
    /// `UIStoryboard(name: "Handle", bundle: ...)`
    static func handle(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.handle)
    }
    
    /// `UIStoryboard(name: "HomePage", bundle: ...)`
    static func homePage(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.homePage)
    }
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "LogIn", bundle: ...)`
    static func logIn(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.logIn)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    /// `UIStoryboard(name: "Profile", bundle: ...)`
    static func profile(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.profile)
    }
    
    /// `UIStoryboard(name: "SignUp", bundle: ...)`
    static func signUp(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.signUp)
    }
    
    /// `UIStoryboard(name: "Stable", bundle: ...)`
    static func stable(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.stable)
    }
    
    /// `UIStoryboard(name: "TackStore", bundle: ...)`
    static func tackStore(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.tackStore)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try launchScreen.validate()
      try main.validate()
      try signUp.validate()
      try logIn.validate()
      try homePage.validate()
      try handle.validate()
    }
    
    struct activity: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = BaseNavigationController
      
      let bundle = R.hostingBundle
      let name = "Activity"
      
      fileprivate init() {}
    }
    
    struct addNew: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = BaseNavigationController
      
      let bundle = R.hostingBundle
      let name = "AddNew"
      
      fileprivate init() {}
    }
    
    struct handle: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = HandleViewController
      
      let bundle = R.hostingBundle
      let handleViewController = StoryboardViewControllerResource<HandleViewController>(identifier: "HandleViewController")
      let name = "Handle"
      
      func handleViewController(_: Void = ()) -> HandleViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: handleViewController)
      }
      
      static func validate() throws {
        if _R.storyboard.handle().handleViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'handleViewController' could not be loaded from storyboard 'Handle' as 'HandleViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    struct homePage: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = TabBarViewController
      
      let bundle = R.hostingBundle
      let name = "HomePage"
      let tabBarViewController = StoryboardViewControllerResource<TabBarViewController>(identifier: "TabBarViewController")
      
      func tabBarViewController(_: Void = ()) -> TabBarViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: tabBarViewController)
      }
      
      static func validate() throws {
        if _R.storyboard.homePage().tabBarViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'tabBarViewController' could not be loaded from storyboard 'HomePage' as 'TabBarViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if UIKit.UIImage(named: "logo") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'logo' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    struct logIn: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = BaseNavigationController
      
      let bundle = R.hostingBundle
      let loginViewController = StoryboardViewControllerResource<LoginViewController>(identifier: "LoginViewController")
      let name = "LogIn"
      
      func loginViewController(_: Void = ()) -> LoginViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: loginViewController)
      }
      
      static func validate() throws {
        if _R.storyboard.logIn().loginViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'loginViewController' could not be loaded from storyboard 'LogIn' as 'LoginViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let loginContainerNav = StoryboardViewControllerResource<UIKit.UINavigationController>(identifier: "LoginContainerNav")
      let name = "Main"
      
      func loginContainerNav(_: Void = ()) -> UIKit.UINavigationController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: loginContainerNav)
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "icon-white-horse-shoe") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'icon-white-horse-shoe' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "bg-rounded") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'bg-rounded' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "mockup") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'mockup' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "avatar-mockup") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'avatar-mockup' is used in storyboard 'Main', but couldn't be loaded.") }
        if _R.storyboard.main().loginContainerNav() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'loginContainerNav' could not be loaded from storyboard 'Main' as 'UIKit.UINavigationController'.") }
      }
      
      fileprivate init() {}
    }
    
    struct profile: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = BaseNavigationController
      
      let bundle = R.hostingBundle
      let name = "Profile"
      
      fileprivate init() {}
    }
    
    struct signUp: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = BaseNavigationController
      
      let baseNavigationController = StoryboardViewControllerResource<BaseNavigationController>(identifier: "BaseNavigationController")
      let bundle = R.hostingBundle
      let confirmationViewController = StoryboardViewControllerResource<ConfirmationViewController>(identifier: "ConfirmationViewController")
      let name = "SignUp"
      
      func baseNavigationController(_: Void = ()) -> BaseNavigationController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: baseNavigationController)
      }
      
      func confirmationViewController(_: Void = ()) -> ConfirmationViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: confirmationViewController)
      }
      
      static func validate() throws {
        if _R.storyboard.signUp().baseNavigationController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'baseNavigationController' could not be loaded from storyboard 'SignUp' as 'BaseNavigationController'.") }
        if _R.storyboard.signUp().confirmationViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'confirmationViewController' could not be loaded from storyboard 'SignUp' as 'ConfirmationViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    struct stable: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = BaseNavigationController
      
      let bundle = R.hostingBundle
      let name = "Stable"
      
      fileprivate init() {}
    }
    
    struct tackStore: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = BaseNavigationController
      
      let bundle = R.hostingBundle
      let name = "TackStore"
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
