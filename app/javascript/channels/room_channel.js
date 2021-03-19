import consumer from "./consumer"



$(function() {
  const chatChannel = consumer.subscriptions.create({ channel: 'RoomChannel', room: $('#messages').data('room_id') }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    //画面を開いているのがチャット送信者だった場合
    if (data["isCurrent_user"]==true){
      $('#messages').append(`<div class='mycomment'><p>${data["message"]}</p></div><p>${data["hour"]}:${data["min"]}</p>`);
     
      $("#messages").scrollTop( $("#messages")[0].scrollHeight );
    }
    //画面を開いているのがチャット受信者だった場合
    else{
      $('#messages').append(`<div class='fukidasi'> <div class="faceicon">
      <img src="/assets/images/user.png"><p>${data["hour"]}:${data["min"]}</p></div>
      <div class='chatting'><div class='says'><p>${data["message"]}</p>
      </div></div></div>`);
      $("#messages").scrollTop( $("#messages")[0].scrollHeight );
    }
  },


  speak: function(message) {
    return this.perform('speak',{
      message: message
    });
  }
});

$(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
  if (event.keyCode === 13) {
    chatChannel.speak(event.target.value);
    event.target.value = '';
    return event.preventDefault();
  }
})


$(function(){
  $("#sending").on("click",function(e){
    let content=$("#message").val();
    chatChannel.speak(content);
    $("#message").val(""); //フォームを空に
    e.preventDefault();
  });
});

let target = document.getElementById('messages');
target.scrollIntoView(false);

});

