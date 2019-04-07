#!/usr/bin/env bash

py_dir() {
    python -c "import $1 as _; print(list(_.__path__)[0])"
}

uninstall_all() {
    pip freeze | xargs pip uninstall -y
}

build_doc() {
    mkdocs build
    build_sphinx_doc
}

gen_sphinx_doc() {
    sphinx-apidoc $(py_dir purplship) -o ./sphinx
    sphinx-apidoc $(py_dir pyaups) -o ./sphinx
    sphinx-apidoc $(py_dir pycaps) -o ./sphinx
    sphinx-apidoc $(py_dir pydhl) -o ./sphinx
    sphinx-apidoc $(py_dir pyfedex) -o ./sphinx
    sphinx-apidoc $(py_dir pysendle) -o ./sphinx
    sphinx-apidoc $(py_dir pyups) -o ./sphinx
    sphinx-apidoc $(py_dir pyusps) -o ./sphinx
}

build_sphinx_doc() {
    sphinx-build ./sphinx ./site/api
}
