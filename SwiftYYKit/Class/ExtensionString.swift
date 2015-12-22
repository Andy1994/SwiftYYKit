//
//  ExtensionString.swift
//  SwiftYYKit
//
//  Created by 王文博 on 15/12/15.
//  Copyright © 2015年 Double. All rights reserved.
//

import Foundation
import UIKit

extension String {
  
  subscript (i: Int) -> Character {
    return self[self.startIndex.advancedBy(i)]
  }
  
  subscript (i: Int) -> String {
    return String(self[i] as Character)
  }
  
  subscript (r: Range<Int>) -> String {
    return substringWithRange(Range(start: startIndex.advancedBy(r.startIndex), end: startIndex.advancedBy(r.endIndex)))
  }
  
  //MARK: - Utilities
  /// return String length
  var length:Int {
    return characters.count
  }
  
  /// return String MD5
  var MD5: String! {
    let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
    let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
    let digestLen = Int(CC_MD5_DIGEST_LENGTH)
    let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
    CC_MD5(str!, strLen, result)
    let hash = NSMutableString()
    for i in 0..<digestLen {
      hash.appendFormat("%02x", result[i])
    }
    result.dealloc(digestLen)
    return String(format: hash as String)
  }
  
  /**
  nil, @"", @"  ", @"\n" will Returns NO; otherwise Returns YES.
  */
  func isNotBlank() -> Bool {
    let blank:NSCharacterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()
    for var i = 0;i < self.characters.count; ++i {
      let c = (self as NSString).characterAtIndex(i)
      if !blank.characterIsMember(c) {
        return true
      }
    }
    return false
  }
  
  /**
  Create a string with the file in main bundle (similar to [UIImage imageNamed:]).
  
  @param name The file name (in main bundle).
  
  @return A new string create from the file in UTF-8.
  */
  func stringNamed(name:String) -> String? {
    let path = NSBundle.mainBundle().pathForResource(name, ofType: "")
    do {
      let content = try String(contentsOfFile:path!, encoding: NSUTF8StringEncoding)
      return content
    } catch _ as NSError {
      return nil
    }
  }
  
  /**
   Trim blank characters (space and newline) in head and tail.
   @return the trimmed string.
   */
  func stringByTrim() -> String {
    let set = NSCharacterSet.whitespaceAndNewlineCharacterSet()
    return self.stringByTrimmingCharactersInSet(set)
  }
  
  //MARK: - Drawing
  /**
  Returns the size of the string if it were rendered with the specified constraints.
  
  @param font          The font to use for computing the string size.
  
  @param size          The maximum acceptable size for the string. This value is
  used to calculate where line breaks and wrapping would occur.
  
  @return              The width and height of the resulting string's bounding box.
  These values may be rounded up to the nearest whole number.
  */
  func sizeForFont(font:UIFont, size:CGSize) -> CGSize {
    let fString = self as NSString
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineBreakMode = NSLineBreakMode.ByWordWrapping
    let attrDict = [
      NSFontAttributeName: font,
      NSParagraphStyleAttributeName: paragraphStyle
    ]
    let rect = fString.boundingRectWithSize(size,
      options: [.TruncatesLastVisibleLine, .UsesLineFragmentOrigin],
      attributes: attrDict,
      context: nil)
    return rect.size
  }
  
  /**
   Returns the width of the string if it were to be rendered with the specified
   font on a single line.
   
   @param font  The font to use for computing the string width.
   
   @return      The width of the resulting string's bounding box. These values may be
   rounded up to the nearest whole number.
   */
  func widthForFont(font:UIFont) -> CGFloat {
    let size = self.sizeForFont(font, size:CGSize(width:CGFloat(MAXFLOAT), height:CGFloat(MAXFLOAT)))
    return size.width
  }
  
  /**
   Returns the height of the string if it were rendered with the specified constraints.
   
   @param font   The font to use for computing the string size.
   
   @param width  The maximum acceptable width for the string. This value is used
   to calculate where line breaks and wrapping would occur.
   
   @return       The height of the resulting string's bounding box. These values
   may be rounded up to the nearest whole number.
   */
  func heightForFont(font:UIFont, width:CGFloat) -> CGFloat {
    let size = self.sizeForFont(font, size: CGSize(width: width, height: CGFloat(MAXFLOAT)))
    return size.height
  }
  
  //MARK: - Emoji
  /**
   Returns all Apple Emoji combines in a string.
   */
  static func allEmoji() -> String {
    struct Static {
      static var str:String = ""
      static var onceToken:dispatch_once_t = 0
    }
    dispatch_once(&Static.onceToken) {
      let keys = ["people", "nature", "object", "places", "symbols"]
      for key in keys {
        Static.str = Static.str + String.allEmojiByGroup(key)
      }
    }
    return Static.str
  }
  
  /**
   Returns grouped Apple Emoji combines in a string.
   
   @param group Emoji group, support value: @"people" @"nature" @"object" @"places" @"symbols"
   */
  static func allEmojiByGroup(group:String) -> String {
    struct Static {
      static var dic:Dictionary = ["":""]
      static var onceToken:dispatch_once_t = 0
    }
    dispatch_once(&Static.onceToken) {
      Static.dic = [
        "people" : "😄😃😀😊☺️😉😍😘😚😗😙😜😝😛😳😁😔😌😒😞😣😢😂😭😪😥😰😅😓😩😫😨😱😠😡😤😖😆😋😷😎😴😵😲😟😦😧😈👿😮😬😐😕😯😶😇😏😑👲👳👮👷💂👶👦👧👨👩👴👵👱👼👸😺😸😻😽😼🙀😿😹😾👹👺🙈🙉🙊💀👽💩🔥✨🌟💫💥💢💦💧💤💨👂👀👃👅👄👍👎👌👊✊✌️👋✋👐👆👇👉👈🙌🙏☝️👏💪🚶🏃💃👫👪👬👭💏💑👯🙆🙅💁🙋💆💇💅👰🙎🙍🙇🎩👑👒👟👞👡👠👢👕👔👚👗🎽👖👘👙💼👜👝👛👓🎀🌂💄💛💙💜💚❤️💔💗💓💕💖💞💘💌💋💍💎👤👥💬👣💭",
        "nature" : "🐶🐺🐱🐭🐹🐰🐸🐯🐨🐻🐷🐽🐮🐗🐵🐒🐴🐑🐘🐼🐧🐦🐤🐥🐣🐔🐍🐢🐛🐝🐜🐞🐌🐙🐚🐠🐟🐬🐳🐋🐄🐏🐀🐃🐅🐇🐉🐎🐐🐓🐕🐖🐁🐂🐲🐡🐊🐫🐪🐆🐈🐩🐾💐🌸🌷🍀🌹🌻🌺🍁🍃🍂🌿🌾🍄🌵🌴🌲🌳🌰🌱🌼🌐🌞🌝🌚🌑🌒🌓🌔🌕🌖🌗🌘🌜🌛🌙🌍🌎🌏🌋🌌🌠⭐️☀️⛅️☁️⚡️☔️❄️⛄️🌀🌁🌈🌊",
        "object" : "🎍💝🎎🎒🎓🎏🎆🎇🎐🎑🎃👻🎅🎄🎁🎋🎉🎊🎈🎌🔮🎥📷📹📼💿📀💽💾💻📱☎️📞📟📠📡📺📻🔊🔉🔈🔇🔔🔕📢📣⏳⌛️⏰⌚️🔓🔒🔏🔐🔑🔎💡🔦🔆🔅🔌🔋🔍🛁🛀🚿🚽🔧🔩🔨🚪🚬💣🔫🔪💊💉💰💴💵💷💶💳💸📲📧📥📤✉️📩📨📯📫📪📬📭📮📦📝📄📃📑📊📈📉📜📋📅📆📇📁📂✂️📌📎✒️✏️📏📐📕📗📘📙📓📔📒📚📖🔖📛🔬🔭📰🎨🎬🎤🎧🎼🎵🎶🎹🎻🎺🎷🎸👾🎮🃏🎴🀄️🎲🎯🏈🏀⚽️⚾️🎾🎱🏉🎳⛳️🚵🚴🏁🏇🏆🎿🏂🏊🏄🎣☕️🍵🍶🍼🍺🍻🍸🍹🍷🍴🍕🍔🍟🍗🍖🍝🍛🍤🍱🍣🍥🍙🍘🍚🍜🍲🍢🍡🍳🍞🍩🍮🍦🍨🍧🎂🍰🍪🍫🍬🍭🍯🍎🍏🍊🍋🍒🍇🍉🍓🍑🍈🍌🍐🍍🍠🍆🍅🌽",
        "places" : "🏠🏡🏫🏢🏣🏥🏦🏪🏩🏨💒⛪🏬🏤🌇🌆🏯🏰⛺🏭🗼🗾🗻🌄🌅🌃🗽🌉🎠🎡⛲🎢🚢⛵🚤🚣⚓🚀✈💺🚁🚂🚊🚉🚞🚆🚄🚅🚈🚇🚝🚋🚃🚎🚌🚍🚙🚘🚗🚕🚖🚛🚚🚨🚓🚔🚒🚑🚐🚲🚡🚟🚠🚜💈🚏🎫🚦🚥⚠🚧🔰⛽🏮🎰♨🗿🎪🎭📍🚩🇯🇵🇰🇷🇩🇪🇨🇳🇺🇸🇫🇷🇪🇸🇮🇹🇷🇺🇬🇧",
        "symbols" : "1️⃣2️⃣3️⃣4️⃣5️⃣6️⃣7️⃣8️⃣9️⃣0️⃣🔟🔢🔣⬆⬇⬅➡🔠🔡🔤↗️↖️↘️↙️↔️↕️🔄◀▶🔼🔽↩↪ℹ⏪⏩⏫⏬⤵⤴🆗🔀🔁🔂🆕🆙🆒🆓🆖📶🎦🈁🈯🈳🈵🈴🈲🉐🈹🈺🈶🈚🚻🚹🚺🚼🚾🚰🚮🅿♿🚭🈷🈸🈂Ⓜ🛂🛄🛅🛃🉑㊙㊗🆑🆘🆔🚫🔞📵🚯🚱🚳🚷🚸⛔✳❇❎✅✴💟🆚📳📴🅰🅱🆎🅾💠➿♻♈♉♊♋♌♍♎♏♐♑♒♓⛎🔯🏧💹💲💱©®™❌‼⁉❗❓❕❔⭕🔝🔚🔙🔛🔜🔃🕛🕧🕐🕜🕑🕝🕒🕞🕓🕟🕔🕠🕕🕡🕖🕢🕗🕣🕘🕤🕙🕥🕚🕦✖️➕➖➗♠️♥️♣️♦️💮💯✔️☑️🔘🔗➰〰〽️🔱◼️◻️◾️◽️▪️▫️🔺🔲🔳⚫️⚪️🔴🔵🔻⬜️⬛️🔶🔷🔸🔹"
      ]
    }
    return Static.dic[group]!
  }
}
