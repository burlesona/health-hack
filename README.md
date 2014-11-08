# Setup


1. If your system doesn't have ruby on it, get Ruby!

Recommended approach for Mac, using homebrew:
```
brew update
brew install rbenv
brew install ruby-build
rbenv install 2.1.4
```

2. If your system doesn't have bundler on it...

```
gem install bundler
```

3. Change to the project directory
```
bundle install
rackup
```
