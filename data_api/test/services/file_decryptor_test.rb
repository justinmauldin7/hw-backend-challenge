require "gpgme"

require_relative "../test_helper"

require_relative '../../services/file_decryptor'

describe "Services FileDecryptor" do
  let(:data) { parse_single("Id,Name,Address,City,State,Division,Major Group,Industry Group,SIC,Description\n1,Robinson and Sons,37898 Rollins Port Suite 901,New Emilyton,North Carolina,D,20.0,205.0,2052.0,Cookies and Crackers") }

  it "should decrypt file" do
   skip encrypted_file_content = # TODO encrypt :data with the "gpgme" gem
    decrypted_file_content = FileDecryptor.execute(encrypted_file_content)

    # TODO Make assertions similiar to the below commented out ones
    # _(decrypted_file_content).must_equal("one")
    # _(decrypted_file_content.errors).must_be_empty
  end
end