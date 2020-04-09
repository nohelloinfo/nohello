default: bundle generate

generate:
	korvike -i template.html -o docs/index.html

bundle:
	bash bundle.sh
