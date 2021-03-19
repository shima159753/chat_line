import consumer from "./consumer"

const app = consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    //画面を開いているのがチャット送信者だった場合
    if (data["isCurrent_user"]==true){
      $('#chats').append(`<div class='mycomment'><p>${data["sentence"]}</p></div><p>${data["chat_time"]}</p>`);
      $("#chats").scrollTop( $("#chats")[0].scrollHeight );
    }
    //画面を開いているのがチャット受信者だった場合
    else{
      $('#chats').append(`<div class='fukidasi'> <div class="faceicon">
      <img src="/assets/images/user.png"><p>${data["chat_time"]}</p></div>
      <div class='chatting'><div class='says'><p>${data["sentence"]}</p>
      </div></div></div>`);
      $("#chats").scrollTop( $("#chats")[0].scrollHeight );
    }
  },

  speak: function(sentence) {
    let current_user_id=$("#current_user_id").val();
    let partner_id=$("#partner_id").val();
    let chat_time=$("#chat_time").val();
    return this.perform('speak',{sentence: sentence, current_user_id: current_user_id, partner_id: partner_id, chat_time: chat_time});
  }
});

window.addEventListener("keypress", function(e) {
  if (e.keyCode === 13) {
    app.speak(e.target.value);
    e.target.value = '';
    e.preventDefault();
  }
})

$(function(){
  $("#send").on("click",function(e){
    let sentence=$("#sentence").val();
    app.speak(sentence);
    $("#sentence").val(""); //フォームを空に
    e.preventDefault();
  });
});

console.log("OK")