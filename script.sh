#!/usr/bin/env bash

py_dir() {
    python -m site --user-site
}

uninstall_all() {
    pip freeze | xargs pip uninstall -y
}

build_doc() {
    mkdocs build
    build_sphinx_doc
}

gen_sphinx_doc() {
    sphinx-apidoc $(py_dir)/purplship -o ./sphinx
    sphinx-apidoc $(py_dir)/pyaups -o ./sphinx
    sphinx-apidoc $(py_dir)/pycaps -o ./sphinx
    sphinx-apidoc $(py_dir)/pydhl -o ./sphinx
    sphinx-apidoc $(py_dir)/pyfedex -o ./sphinx
    sphinx-apidoc $(py_dir)/pyups -o ./sphinx
}

build_sphinx_doc() {
    sphinx-build ./sphinx ./site/api
}
