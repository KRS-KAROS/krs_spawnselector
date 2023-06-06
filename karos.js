

function openSpawnSelector() {
  document.querySelector(".background").style.display = "block";
  document.querySelector(".title").style.display = "block";
  document.querySelector(".boxkaros").style.display = "block";
  document.querySelector(".boxkaros2").style.display = "block";
  document.querySelector(".boxkaros3").style.display = "block";
  document.querySelector(".boxkaros4").style.display = "block";
  

}

window.addEventListener("message", function (event) {
  let data = event.data;
  if (data.type === "openSpawnSelector") {
    openSpawnSelector();

  }
});

function post(path) {
  fetch(path, {
    method: "POST",
    headers: {
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: JSON.stringify({}),
  }).then((resp) => resp.json());
}

function selectSandy() {
    post(`https://krs_spawnselector/sandy`)
    document.querySelector(".title").style.display = "none";
    document.querySelector(".boxkaros").style.display = "none";
    document.querySelector(".boxkaros2").style.display = "none";
    document.querySelector(".boxkaros3").style.display = "none";
    document.querySelector(".boxkaros4").style.display = "none";
    document.querySelector(".background").style.display = "none";
}
function selectPolice() {
    post(`https://krs_spawnselector/police`)
    document.querySelector(".title").style.display = "none";
    document.querySelector(".boxkaros").style.display = "none";
    document.querySelector(".boxkaros2").style.display = "none";
    document.querySelector(".boxkaros3").style.display = "none";
    document.querySelector(".boxkaros4").style.display = "none";
    document.querySelector(".background").style.display = "none";
}
function selectAirport() {
    post(`https://krs_spawnselector/airport`)
    document.querySelector(".title").style.display = "none";
    document.querySelector(".boxkaros").style.display = "none";
    document.querySelector(".boxkaros2").style.display = "none";
    document.querySelector(".boxkaros3").style.display = "none";
    document.querySelector(".boxkaros4").style.display = "none";
    document.querySelector(".background").style.display = "none";
}

function selectPaleto() {
    post(`https://krs_spawnselector/paleto`)
    document.querySelector(".title").style.display = "none";
    document.querySelector(".boxkaros").style.display = "none";
    document.querySelector(".boxkaros2").style.display = "none";
    document.querySelector(".boxkaros3").style.display = "none";
    document.querySelector(".boxkaros4").style.display = "none";
    document.querySelector(".background").style.display = "none";
}



//Funzione Close
document.onkeydown = function (evt) {
  evt = evt || window.event;
  var isEscape = false;
  if ("key" in evt) {
    isEscape = evt.key === "Escape" || evt.key === "Esc";
  } else {
    isEscape = evt.keyCode === 27;
  }
  if (isEscape) {
    
    post(`https://${GetParentResourceName()}/close`);
      
    document.querySelector(".title").style.display = "none";
    document.querySelector(".boxkaros").style.display = "none";
    document.querySelector(".boxkaros2").style.display = "none";
    document.querySelector(".boxkaros3").style.display = "none";
    document.querySelector(".boxkaros4").style.display = "none";
    document.querySelector(".background").style.display = "none";
  }
};
