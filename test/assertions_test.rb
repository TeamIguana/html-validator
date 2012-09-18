require 'test/unit'
require 'html-validator'

class AssertionsTest < Test::Unit::TestCase
  def test_assert_is_xhtml_trans_valid_with_invalid_dom
    doc = <<-XML
      <?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head></head><body><notexisting></notexisting></body>
    XML
    assert_raise_message(<<-TEXT) { assert_is_xhtml_trans_valid doc }
2 errors:
Element '{http://www.w3.org/1999/xhtml}head': Missing child element(s). Expected is one of ( {http://www.w3.org/1999/xhtml}script, {http://www.w3.org/1999/xhtml}style, {http://www.w3.org/1999/xhtml}meta, {http://www.w3.org/1999/xhtml}link, {http://www.w3.org/1999/xhtml}object, {http://www.w3.org/1999/xhtml}isindex, {http://www.w3.org/1999/xhtml}title, {http://www.w3.org/1999/xhtml}base ).
Element '{http://www.w3.org/1999/xhtml}notexisting': This element is not expected. Expected is one of ( {http://www.w3.org/1999/xhtml}p, {http://www.w3.org/1999/xhtml}div, {http://www.w3.org/1999/xhtml}isindex, {http://www.w3.org/1999/xhtml}fieldset, {http://www.w3.org/1999/xhtml}table, {http://www.w3.org/1999/xhtml}a, {http://www.w3.org/1999/xhtml}br, {http://www.w3.org/1999/xhtml}span, {http://www.w3.org/1999/xhtml}bdo, {http://www.w3.org/1999/xhtml}object ).
TEXT
  end

  def test_assert_is_xhtml_trans_valid_with_valid_dom
    doc = <<-XML
      <?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>title</title></head><body></body>
    XML
    assert_nothing_raised { assert_is_xhtml_trans_valid doc }
  end
end