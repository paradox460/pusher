# pusher
A simple script for sending Pushover messages.
Doesn't really offer anything over CURL and bash scripts or shell functions other than being self contained.

## Installing
Eventually I'll get around to getting this set up properly so it can just be installed through nimble, but for now you have to manually compile it.

Two symbol definitions must be passed during compilation, which are *token* and *userKey*.

```sh

nim c -d:release -d:token="<YOUR API TOKEN HERE>" -d:userKey="<YOUR USER KEY HERE>" pusher.nim

```

## Usage
Once it's finished compiling, you can run the resulting binary.

```sh
pusher -t="title" -m="message string goes here"
pusher --title="title" --message="message goes here"
```