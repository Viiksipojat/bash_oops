# bash_oops

Tweet your failures! 

## Prerequisites

Install [Bash OAuth](https://github.com/livibetter/bash-oauth), like this `make install-twitter`.

## Installation

1. Source `bash_oopser.sh` in your `.bashrc`
2. Create `.bash_oops.rc`:

		cat > $HOME/.bash_oopser.rc <<TEMPLATE
		oauth_consumer_key=
		oauth_consumer_secret=
		TEMPLATE
		
3. Fill in your [Twitter API keys](http://dev.twitter.com/apps/new) to the newly created `$HOME/.bash_oops.rc`
4. Go crazy

## Usage

Make typos.

## Questions

Are there any security concerns? Yes, plenty. A wise man wouldn't do this.

## TODO

There are a bunch of [SMS commands](https://support.twitter.com/articles/14020-twitter-for-sms-basic-features), maybe they should be handled somehow.
