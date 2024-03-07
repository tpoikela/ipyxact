#! /usr/bin/env bash

mkdir -p out

echo Running gen_c_header
PYTHONPATH=ipyxact python gen_c_header.py generic_example.xml > out/out.h
# Remove the first line (changing date) inplace
sed -i '1d' out/out.h
diff out/out.h ../golden/out.h

echo Running gen_markdown
PYTHONPATH=ipyxact python gen_markdown.py generic_example.xml > out/out.md
diff out/out.md ../golden/out.md

echo Running ipxactwriter
PYTHONPATH=ipyxact python ipxactwriter.py out/ipxactwriter.xml && xmllint --format out/ipxactwriter.xml > out/ipxactwriter2.xml

echo Running print_businterfaces
PYTHONPATH=ipyxact python print_businterfaces.py businterfaces.xml > out/bus.txt
diff out/bus.txt ../golden/bus.txt

echo Running print_filesets
PYTHONPATH=ipyxact python print_filesets.py generic_example.xml > out/files.txt
diff out/files.txt ../golden/files.txt

echo Running write_xml
PYTHONPATH=ipyxact python write_xml.py generic_example.xml out/new.xml > out/write_xml.txt && xmllint --format out/new.xml > out/new2.xml
