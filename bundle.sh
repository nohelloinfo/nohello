#!/bin/bash
set -euxo pipefail

BASEDIR="./docs/assets"

css_deps=(
	npm/bootstrap@4.4.1/dist/css/bootstrap.min.css
	npm/bootswatch@4.4.1/dist/slate/bootstrap.min.css
)

js_deps=(
	npm/jquery@3.4.1/dist/jquery.min.js
	npm/bootstrap@4.4.1/dist/js/bootstrap.min.js
)

IFS=','

mkdir -p "${BASEDIR}"

if [ ${#js_deps[@]} -gt 0 ]; then
	curl -sSfLo "${BASEDIR}/bundle.js" "https://cdn.jsdelivr.net/combine/${js_deps[*]}"
else
	echo -n '' >"${BASEDIR}/bundle.js"
fi

if [ ${#css_deps[@]} -gt 0 ]; then
	curl -sSfLo "${BASEDIR}/bundle.css" "https://cdn.jsdelivr.net/combine/${css_deps[*]}"
else
	echo -n '' >"${BASEDIR}/bundle.css"
fi
