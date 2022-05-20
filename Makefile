shell:
	guix time-machine -C .channels.scm -- shell --pure -D -f .guix.scm

all: files package upload add clean

edits:
	emacs -q --no-site-file --no-site-lisp --no-splash -l .emacs --file .ssot.org

files:
	emacs --batch -Q  -l .emacs --eval '(process-org ".ssot.org")'

package:
	python3 setup.py sdist bdist_wheel

upload:
	twine upload dist/*

add:
	git add --all

clean:
	git clean -xdf
