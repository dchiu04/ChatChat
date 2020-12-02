// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "assets/js/app.js".

// To use Phoenix channels, the first step is to import Socket,
// and connect at the socket path in "lib/web/endpoint.ex".
//
// Pass the token on params as below. Or remove it
// from the params if you are not using authentication.
import { Socket } from "phoenix"

let socket = new Socket("/socket", { params: { token: window.userToken } })

// When you connect, you'll often need to authenticate the client.
// For example, imagine you have an authentication plug, `MyAuth`,
// which authenticates the session and assigns a `:current_user`.
// If the current user exists you can assign the user's token in
// the connection for use in the layout.
//
// In your "lib/web/router.ex":
//
//     pipeline :browser do
//       ...
//       plug MyAuth
//       plug :put_user_token
//     end
//
//     defp put_user_token(conn, _) do
//       if current_user = conn.assigns[:current_user] do
//         token = Phoenix.Token.sign(conn, "user socket", current_user.id)
//         assign(conn, :user_token, token)
//       else
//         conn
//       end
//     end
//
// Now you need to pass this token to JavaScript. You can do so
// inside a script tag in "lib/web/templates/layout/app.html.eex":
//
//     <script>window.userToken = "<%= assigns[:user_token] %>";</script>
//
// You will need to verify the user token in the "connect/3" function
// in "lib/web/channels/user_socket.ex":
//
//     def connect(%{"token" => token}, socket, _connect_info) do
//       # max_age: 1209600 is equivalent to two weeks in seconds
//       case Phoenix.Token.verify(socket, "user socket", token, max_age: 1209600) do
//         {:ok, user_id} ->
//           {:ok, assign(socket, :user, user_id)}
//         {:error, reason} ->
//           :error
//       end
//     end
//
// Finally, connect to the socket:
socket.connect()

// Now that you are connected, you can join channels with a topic:
let channel = socket.channel("room:lobby", {})
let chatInput = document.getElementById("chat-input")
let msgContainer = document.getElementById("messages")
let usersContainer = document.getElementById("online-users")

//username
let userName = getUsername();

//date
let d = Date().toString();
let date = d.split(' ').splice(0, 5).join(' ');

chatInput.addEventListener("keypress", event => {
    if (event.key == "Enter") {
        //refresh date
        d = Date().toString();
        date = d.split(' ').splice(0, 5).join(' ')

        channel.push("new_msg", { name: userName, date: date, message: chatInput.value })
        chatInput.value = ""
    }
})

channel.on("new_msg", payload => {
    let msgItem = document.createElement("p");
    msgItem.innerHTML = `${payload.date} <b>${payload.name}</b>: ${payload.message}`
    msgContainer.appendChild(msgItem);
})





channel.join();

//alerts users to enter a username to join the chatroom
function getUsername() {
    let txt;
    let name = prompt("Please enter your name to enter the chatroom:");
    while (name == "" || name == null) {
        name = prompt("Enter your name to start chatting:")
    }
    txt = name;
    document.getElementById("User").innerHTML = txt;
    return txt;
}

let body = document.getElementsByTagName("BODY")[0];
let color = document.getElementById("color");
let colorBtn = document.getElementById("colorpicker");

colorBtn.addEventListener("keypress", event => {
    if (event.key == "click") {
        let body = document.getElementsByTagName("BODY")[0];
        let color = document.getElementById("color");
        body.getElementsByClassName.backgroundColor = color.value;
        console.log("changed color to ", color.value);
    }
})

function changeBg() {
    let body = document.getElementsByTagName("BODY")[0];
    let color = document.getElementById("color");
    body.getElementsByClassName.backgroundColor = color.value;
    console.log("changed color to ", color.value);

}
export default socket