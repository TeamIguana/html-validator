#!/bin/bash
cd schemas/html5
mkdir temp
cd temp
git clone https://github.com/validator/syntax.git
wget http://www.thaiopensource.com/download/trang-20030619.zip
unzip trang-20030619.zip
cd syntax/relaxng
java -jar ../../trang-20030619/trang.jar -I rnc -O rng xhtml5.rnc xhtml5.rng
java -jar ../../trang-20030619/trang.jar -I rnc -O rng html5.rnc html5.rng
cp *.rng ../../..
cd ../../..
rm -rf temp
sed -i -e 's/datatypeLibrary="http:\/\/whattf\.org\/datatype-draft"//g' *.rng
sed -i -r -e 's/data type="[^"]+" ?\//data type="string" \//g' *.rng

