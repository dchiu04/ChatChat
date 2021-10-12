
// retrieves username from the user
function getUsername() {
    let txt;
    let name = prompt("Please enter your name to enter the chatroom:");
    //continues to prompt if name is not set
    while (name == "" || name == null) {
        name = prompt("Enter your name to start chatting:")
    }
    txt = name;
    //sets username to div
    document.getElementById("User").innerHTML = txt;
    return txt;
}

let userName = getUsername();

//payload is sent
let Chat = {
    init(socket) {
        //gets url args
        let path = window.location.pathname.split('/')
        let room = path[path.length - 1]
        //default is main
        if (room.length < 1) {
            room = "Main"
        }
        //channel name is from url args
        let channel = socket.channel('chat:' + room, {})
        channel.join()

        //continues to listen for sent text messages
        this.listenForChats(channel)
    },

    //event listener
    listenForChats(channel) {
        //sends payload when user submits text in the form
        function submitForm() {
            //data
            let userMsg = document.getElementById('user-msg').value
            let d = Date().toString();
            let date = d.split(' ').splice(0, 5).join(' ');
            //payload gets sent along with 'shout'
            channel.push('shout', { name: userName, body: userMsg, date: date })
            document.getElementById('user-msg').value = ''
        }
        document.getElementById('chat-form').addEventListener('keypress', function(e) {
            if (event.keyCode == 13) {
                e.preventDefault()
                submitForm();
            }
        })

        //pattern matched 'shout''s payload will be appended in the chat-box html element
        channel.on('shout', payload => {
            let chatBox = document.querySelector('#chat-box')
            let msgBlock = document.createElement('p')

            msgBlock.insertAdjacentHTML('beforeend', `<b>${payload.date}: ${payload.name}: ${payload.body}</b>`)
            chatBox.appendChild(msgBlock)
            chatBox.scrollTop = chatBox.scrollHeight;
        })
    }
}

export default Chat