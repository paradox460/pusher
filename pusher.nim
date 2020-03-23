import httpclient, json, os, parseopt, strutils

const token {.strdefine.}: string = ""
const userKey {.strdefine.}: string = ""
const pushoverApi = "https://api.pushover.net/1/messages.json"

var options = initOptParser();
var message = ""
var title = ""

while true:
  options.next()
  case options.kind
    of cmdEnd: break
    of cmdShortOption:
      if options.key == "t":
        title = options.val
      if options.key == "m":
        message = options.val
    of cmdLongOption:
      if options.key == "title":
        title = options.val
      if options.key == "message":
        message = options.val
    of cmdArgument:
      continue

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
