PDF_DIR = build/static/pdfs
HTML_DIR = build/_includes

SOURCE_FILES=$(shell find . -name '*md' -not -path './.git*' -not -name README.md -not -name '.')
PDF_FILES=$(SOURCE_FILES:./%.md=$(PDF_DIR)/%.pdf)

TEST = regular_expressions.md

all: $(PDF_FILES)

$(HTML_DIR)/%.pdf : ./%.md
	pandoc -o $@ $<

.PHONY: test
test : $(TEST) $(SOURCE_FILES)
	echo $(PDF_FILES)

pandoc -t html5 -o ~/temp/re.html regular_expressions.md --template templates/default.hmtl

