#Shifty build script.  Cobbled together with help from: http://blog.badsyntax.co/post/1465134196/minifying-javascript-using-google-closure-compiler-and

# All the files to build...
cat src/shifty.core.js \
	src/shifty.formulas.js \
	src/shifty.queue.js \
	src/shifty.color.js \
	src/shifty.css_units.js \
	src/shifty.interpolate.js \
	> shifty.js


in=shifty.js
out=builds/shifty.minsrc.js

curl -s \
	-d compilation_level=SIMPLE_OPTIMIZATIONS \
	-d output_format=text \
	-d output_info=compiled_code \
	--data-urlencode "js_code@${in}" \
	http://closure-compiler.appspot.com/compile \
	 > $out

cat src/build_header.js builds/shifty.minsrc.js > builds/shifty.min.js

rm builds/shifty.minsrc.js