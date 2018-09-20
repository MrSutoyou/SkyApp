import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    func decode(_ plaintext: String, secret: String) -> String?
}


struct CeaserCipher: Cipher {

    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""

        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    func decode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
}

struct ROT13Cipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
            var encoded = ""
            for character in plaintext {
                let unicode = character.unicodeScalars.first!.value
                var shiftedUnicode = unicode
                if unicode < 48 || unicode > 122 {
                    return nil
                } else if unicode <= 77 {
                    shiftedUnicode = shiftedUnicode + 13
                } else {
                    shiftedUnicode = shiftedUnicode - 13
                }
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
            return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
            var decoded = ""
            for character in plaintext {
                let unicode = character.unicodeScalars.first!.value
                var shiftedUnicode = unicode
                if unicode < 48 || unicode > 122 {
                    return nil
                } else if unicode <= 77 {
                    shiftedUnicode = shiftedUnicode + 13
                } else {
                    shiftedUnicode = shiftedUnicode - 13
                }
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                decoded = decoded + shiftedCharacter
            }
            return decoded
    }
}

struct AlphaCesarCipher: Cipher {
    func encode(_ plaintext: String, secret: String) -> String? {
        let newPlaintext = plaintext.uppercased()
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        for character in newPlaintext {
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode + shiftBy

            if shiftedUnicode > 90 {
                shiftedUnicode = shiftedUnicode - 43
            } else if 57 < shiftedUnicode && shiftedUnicode < 65 {
                shiftedUnicode = shiftedUnicode + 7
            }
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        let newPlaintext = plaintext.uppercased()
        
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var decoded = ""
        
        for character in newPlaintext {
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode - shiftBy

            if shiftedUnicode < 48 {
                shiftedUnicode = shiftedUnicode + 43
            } else if 57 < shiftedUnicode && shiftedUnicode < 65 {
                shiftedUnicode = shiftedUnicode - 7
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
    }
}
