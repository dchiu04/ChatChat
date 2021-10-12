import "../css/app.scss"

import "phoenix_html"

import socket from "./socket"
import Chat from "./chat"

Chat.init(socket)