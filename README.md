Assertions to validate a local html document without using external services like http://validator.w3.org/


Example:

def test_validation
    require 'open-uri'
    page = open('http://en.wikipedia.org/wiki/Main_Page').read
    assert_is_xhtml_trans_valid page
end

