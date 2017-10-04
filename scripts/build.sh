#!/bin/bash
for file in `\find ./src/svg -type f`; do
  cat $file | \
  sed -e 's/ id=\"\([^\"]*\)\"//g' | \
  sed -e 's/ data-name=\"\([^\"]*\)\"//g' | \
  sed -e '2d' > \
  $file.min
done
mv ./src/svg/*.min ./dist/
cd ./dist
for f in `ls`; do
  mv $f ${f/\.min/};
done
