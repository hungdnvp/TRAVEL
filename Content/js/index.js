let sliderImages=document.querySelectorAll(".slide");
let arrowleft=document.querySelector("#arrow-left");
let arrowright=document.querySelector("#arrow-right");
let current=0;

function reset(){
    for(let i=0; i<sliderImages.length ;i++){
        sliderImages[i].style.display="none";
    }

}
function startSlide(){
    reset();
    sliderImages[0].style.display='block';
}

function slideLeft(){
    reset();
    sliderImages[current-1].style.display="block";
    current=current-1;
}
function slideRight(){
    reset();
    sliderImages[current+1].style.display="block";
    current=current+1;
}
arrowleft.addEventListener('click', function(){
    if(current==0){
        current=sliderImages.length;
    }
    slideLeft();
}
);

arrowright.addEventListener('click', function(){
    if(current==sliderImages.length-1){
        current=-1;
    }
    slideRight();
}
);

startSlide();