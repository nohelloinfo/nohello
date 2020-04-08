default:

generate: bundle
	korvike -i template.html -o docs/index.html

bundle:
	bash bundle.sh
