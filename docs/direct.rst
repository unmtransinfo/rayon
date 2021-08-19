Direct Installation
===================

You may choose to install dependencies yourself (typically using your
distribution's package manager) or via the ``rayon_build.sh`` build script.
The latter is recommended because it has pinned dependencies.

Installation via rayon_scripts.sh
---------------------------------
We strongly recommend that you do the installation in a clean directory
as a non-privileged user. The suggested location for that directory is
~/.rayon/build.  If you agree with this choice, you can start your installation
by issuing the following commands::

    mkdir -p ~/.rayon/build
    cd ~/.rayon/build
    curl -L -o rayon_tool https://raw.githubusercontent.com/LegumeFederation/rayon/master/build_scripts/rayon_tool.sh
    chmod 755 rayon_tool


If you wish to customize anything about the installation, you should issue
the following command::

        ./rayon_tool create_scripts

Then, review and edit the ``my_build.sh`` script to reflect the directories you
wish to use for your installation.

After you are happy with the configuration, run::

    ./rayon_tool build

to do the build.  After the build completes without error, follow the
configuration instructions.

Installation via Package Manager
--------------------------------
The following are the dependencies for installing and running rayon, with
tested versions shown in parentheses:

============= ===========================================
Dependency    Version
============= ===========================================
C compiler    clang (8.1.0 on MacOS and 3.4.1 on FreeBSD)
              gcc (7.1.0 on linux and 4.8.5 on MacOS).
              Note that MacOS requires BOTH clang and gcc.
git           Any version supported by GitHub should work.
python        python 3 with numpy (3.6.2, minimum of 3.4.0)
hmmer         3.1b2
raxml         8.2.11
redis         4.0.1
nginx         1.13.4
============= ===========================================

``rayon`` requires a more recent version of setuptools than that distributed
with python 3.6, as well as the use of pip.  Both of these may break distro
package manager assumptions, so you will need to either create a working
virtual environment or a root environment in user space.

I prefer to use the name ``rayonenv`` for the virtual environment to prevent
confusion between package and environment names.  You should create this
environment as the user under which you intend the web server to run, using
the python version you wish to use selected as default, with the following
commands::

	python3.6 -m virtualenv rayonenv
	cd rayonenv
	source bin/activate

Make sure that the ``python`` and ``pip`` commands run python and pip from the
virtual environment; if not, you will need to create symlinks in the virtual
environment binary directory.

Next use pip to install dependencies::

	pip install -U setuptools
	pip install -e 'git+https://github.com/LegumeFederation/supervisor.git@4.0.0#egg=supervisor==4.0.0'
	pip install -U rayon

The rayon_env script is the only executable that you will need to control
rayon and associated process. You should usually not put the entire rayon
bin/ directory into your path, as this may cause binaries from the virtual
environment such as python to be used in contexts where they were not intended
to be used.  The easiest way to do this is with a symlink to a directory
on your path, typically ``~/bin``::

        ln -s /path/to/rayonenv/bin/rayon_env ~/bin

You no longer need to work inside the virtual environment you created.  Leave
the virtual environment with the following command::

    deactivate

Next, follow the configuration instructions.
