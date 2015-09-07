NMatrix Atlas Heroku Demo
===

Test app to prove that NMatrix with Atlas plugin can run on Heroku.

Requires [heroku-buildpack-multi](https://github.com/ddollar/heroku-buildpack-multi) as the buildpack:

```
heroku buildpacks:set https://github.com/ddollar/heroku-buildpack-multi.git

# or, when creating app:

heroku create --buildpack https://github.com/ddollar/heroku-buildpack-multi
```

Chained buildpacks are declared in ```.buildpacks```:

```
https://github.com/gbuesing/heroku-buildpack-apt#atlas
https://github.com/heroku/heroku-buildpack-ruby
```

Apt packages to install are declared in ```Aptfile```:

```
libatlas-base-dev
```

I deviated from [Ubuntu install instructions on the NMatrix wiki](https://github.com/SciRuby/nmatrix/wiki/Installation#ubuntudebian) because ```update-alternatives`` did not seem to work as expected on Heroku.

So instead, [I prepended Atlas lib and include paths in my fork of the Apt buildpack](https://github.com/gbuesing/heroku-buildpack-apt/commit/995e24267910ced257793bfc249d94493eb4902b).

Seems to work.
