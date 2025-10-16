# Count the words in a file
wc file:
    @echo "{{file}} has $(pandoc {{file}} -t html --ascii | pandoc -f html -t markdown --ascii | wc -w) words in it"

tar: clean
    tar -czvf speech.tar.gz .

# Clean all the output files
clean: clean_pdf clean_html
    rm -f *.tar.gz

# Clean up the pdfs
clean_pdf:
    rm -f drafts/*.pdf

# Clean up the html
clean_html:
    rm -f drafts/*.html

# Build the pdfs for the drafts
pdf:
    for f in drafts/*.md; do pandoc $f -o ${f/md/pdf} --ascii; done;

# Build the html for the drafts
html:
    for f in drafts/*.md; do pandoc $f -o ${f/md/html} --ascii; done;

# Build all
all: pdf html
