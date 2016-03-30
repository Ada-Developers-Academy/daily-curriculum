# Python Setup

Your Mac should already come with Python installed, but you should double check the version to be sure:
```
python --version
```

## Install pip
Like Ruby Gems, Python has a package manager called `pip`.
`pip` may already be installed if you are using certain versions of Python 2 or 3. Check out [this](https://pip.pypa.io/en/stable/installing/) site for more information on those versions.

If you try to update pip, you'll know right away whether or not it is installed on your machine.
`pip install -U pip`

Install `pip` and it's dependency `distribute` using these instructions. The first command will download the installation file. The second command will run it and do the `pip` installation.
```bash
curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py
```
**Note**: If you get permission errors, you may need to execute the `get-pip` with `sudo`.

## Install virtualenv
Now that we have `pip` installed, we can use this to install other packages. Next we want the Python virtual environment! This sort of gives you functionality like a gemset which will keep your python packages separate:
`pip install virtualenv`
**Note**: You may also need to use `sudo` here as well if you are getting permission errors.


## Code!
Now you're ready to Python!

Create a new python file that has some code in it!
```
echo 'print "hello ada"' > test.py
python test.py
```
