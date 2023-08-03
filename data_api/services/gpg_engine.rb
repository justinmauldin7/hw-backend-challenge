require 'gpgme'

module GPG
    GPGME::Engine.set_info(GPGME::PROTOCOL_OpenPGP, "/usr/bin/gpg", nil)
    @gpg = GPGME::Crypto.new

    def self.decrypt(text, options = {})
        public_key = File.open("../data/part_3_encryption/public.key")

        GPGME::Key.import(public_key)
        options = { password: "Test123123" }.merge(options)
        # This was another possible "options" block that could potentially work
        # options = { pinentry_mode: GPGME::PINENTRY_MODE_LOOPBACK, password: "Test123123" }.merge(options)

        @gpg.decrypt(text, options)
    end
end