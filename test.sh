# https://stackoverflow.com/a/45093476/1495086

set -e

deactivate || true
rm -rf mytest
# no! python3 -m venv mytest
ls setup.py
python3 --version
python3 -m pip install --upgrade pip setuptools wheel pathlib twine
rm -rf dist
python -m pip list | grep -iE 'pathlib|rensha256'
perl -i'' -pe's{__version__.*0.1.(\d+)}{q{__version__ = "0.1.}.($1 + 1)}e' rensha256/rensha256.py
python3 setup.py sdist bdist_wheel
ls dist/
# python3 -m twine upload --repository-url https://test.pypi.org/legacy/ dist/*
# python3 -m twine upload --repository testpypi dist/*
python3 -m twine upload --repository pypi dist/*

# python3 -m venv upload
# source upload/bin/activate
# python3 -m pip install --upgrade twine
# python3 -m twine upload --repository-url https://test.pypi.org/legacy/ dist/*

cd ~/pdev/tmp
deactivate || true
rm -rf mytest
python3 -m venv mytest
source mytest/bin/activate
python --version
# python3 -m pip install --force-reinstall --ignore-installed --no-cache-dir --index-url https://test.pypi.org/simple/ rensha256
python3 -m pip list
# python3 -m pip install --force-reinstall rensha256
# test-files.pythonhosted.org cache
# python3 -m pip install --index-url https://test.pypi.org/simple --extra-index-url https://testpypi.python.org/pypi rensha256
# python3 -m pip install --no-cache-dir --upgrade --index-url https://test.pypi.org/simple/ rensha256
# python3 -m pip --no-cache-dir install --index-url https://test.pypi.org/simple rensha256
# python3 -m pip --no-cache-dir install --extra-index-url https://testpypi.python.org/pypi rensha256
python3 -m pip --no-cache-dir install --extra-index-url https://testpypi.python.org/pypi rensha256
python3 -m pip list