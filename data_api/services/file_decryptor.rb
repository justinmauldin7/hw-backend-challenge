module FileDecryptor 
    def self.execute(file_content)
        temp_file = Tempfile.new("TempClientUpdates")
        temp_file.write(file_content)
        # If you don't close the Tempfile after writing the encrypted content to it, it won't decrypt correctly.
        temp_file.close
        # When we are calling this shell script, we are just returning the standard output,
        # instead of saving it to a file like the command in the README does.
        decrypted_file_content = `gpg --decrypt #{temp_file.path} 2>/dev/null`
        # This is needed so we make sure to delete the Tempfile we created after we decrypt its contents
        temp_file.unlink 

        return decrypted_file_content
    end
end