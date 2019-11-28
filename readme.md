A simple script I threw together to handle Pusher messages for long running tasks.

Doesn't really offer anything over CURL and bash scripts or shell functions other than being self contained.

# Installing
Eventually I'll get around to getting this set up properly so it can just be installed through nimble, but for now you have to manually compile it.

It takes two symbol definitions at compile time to do anything

```sh

nim c -d:release -d:token="<YOUR API TOKEN HERE>" -d:userKey="<YOUR USER KEY HERE>" pusher

```

Once thats done, you get a nice binary out the end, to do with what you want

## Usage
Assuming you compiled it properly, its a pretty simple program:

```sh
pusher -t="Title" body string goes here
```

If you omit the title param, it goes with whatever the Pusher config has set
