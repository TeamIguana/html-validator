Assertions to validate a local html document without using external services like http://validator.w3.org/

It currently validate HTML 5, and XHTML 1.0 transitional.

Example:

def test_validation
    require 'open-uri'
    page = open('http://en.wikipedia.org/wiki/Main_Page').read
    assert_is_xhtml_trans_valid page
end

