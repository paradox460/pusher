import httpclient, json, os, parseopt, strutils

const token {.strdefine.}: string = ""
const userKey {.strdefine.}: string = ""
const pushoverApi = "https://api.pushover.net/1/messages.json"

var options = initOptParser();
var message: string
var title = ""

options.next();
case options.kind
  of cmdEnd: quit(1)
  of cmdShortOption:
    if options.key == "t":
      title = options.val
      message = options.cmdLineRest
    else:
      message = commandLineParams().join(" ")
  else:
    message = commandLineParams().join(" ")

let client = newHttpClient()
client.headers = newHttpHeaders({ "Content-Type": "application/json" })

let body = %*{
    "token": token,
    "user": userKey,
    "message": message
}

if title != "":
  body["title"] = %* title

let response = client.request(pushoverApi, httpMethod = HttpPost, body = $body)


if response.code != Http200:
  echo response.status
  quit(1)
else:
  quit(0)
