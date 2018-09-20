import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "ROT13": ROT13Cipher(),
        "AlphaCesar": AlphaCesarCipher()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
