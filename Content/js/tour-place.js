
const tabItems=document.querySelectorAll(".tab-item");
const tabContentItems=document.querySelectorAll(".tab-content-item");
function selectItem(e){
    removeBorder();
    removeShow();
    this.classList.add("tab-border")
    const tabContentItem=document.querySelector(`#${this.id}-content`);
    tabContentItem.classList.add('show');
}
function removeShow(){
    tabContentItems.forEach(item=>item.classList.remove("show"));
}
function removeBorder(){
    tabItems.forEach(item=>item.classList.remove("tab-border"));
}
function hienthi(idd, idhien, idan) {
    document.getElementById("" + idd).style.overflow = "visible";
    document.getElementById("" + idd).style.height = "auto";
    document.getElementById("" + idhien).style.display = "none";
    document.getElementById("" + idan).style.display = "block";
}

function andi(idd, idhien, idan) {
    document.getElementById("" + idd).style.overflow = "hidden";
    document.getElementById("" + idd).style.height = "90px";
    document.getElementById("" + idhien).style.display = "block";
    document.getElementById("" + idan).style.display = "none";
}
tabItems.forEach(item => item.addEventListener("click",selectItem));
document.getElementById("tab-1").click();
window.addEventListener('scroll', function() {
    var h=document.getElementById("getheight").offsetHeight
    console.log(h)
    var width = $(window).width();
    if(width>1295){
            var x = pageYOffset;
        if (x < 720) {
            let a = document.getElementById("advert");
            a.style.position = "static";
            a.style.width = "100%"
        } else if (x >= 720&&x<h) {
            let a = document.getElementById("advert");
            a.style.position = "fixed";
            a.style.top = "60px";
            a.style.width="21.2%";
        } else{
            let a = document.getElementById("advert");
            a.style.position = "relative";
            a.style.top=h-700+"px";
            a.style.width = "100%"
        }
    }
    else if(width<=1295&&width>=1150){
        var x = pageYOffset;
        if (x < 650) {
            let a = document.getElementById("advert");
            a.style.position = "static";
            a.style.width = "100%"
        } else if (x >= 650&&x<h-50) {
            let a = document.getElementById("advert");
            a.style.position = "fixed";
            a.style.top = "60px";
            a.style.width="21%";
        } else{
            let a = document.getElementById("advert");
            a.style.position = "relative";
            a.style.top=h-700+"px";
            a.style.width = "100%"
        }
    }
    else if(width<1150&&width>=960){
        var x = pageYOffset;
        if (x < 550) {
            let a = document.getElementById("advert");
            a.style.position = "static";
            a.style.width = "100%"
        } else if (x >= 550&&x<h-50) {
            let a = document.getElementById("advert");
            a.style.position = "fixed";
            a.style.top = "60px";
            a.style.width="20.5%";
        } else{
            let a = document.getElementById("advert");
            a.style.position = "relative";
            a.style.top=h-700+"px";
            a.style.width = "100%"
        }
    }
})

var cw = document.getElementById('s').clientWidth;
function rating(stars) {
    document.getElementById('s').style.width = Math.round(cw * (stars / 5)) + 'px';
}
function CapNhatDanhGia(index,ma) {
	$.ajax({

		type: 'POST',
		data: { rating:index, id:ma },
        url: '/Tour/CapnhatDanhGia',
        success: function (result) {
            $("#demo").load(location.href + " #demo");
		},
		error: function (e) {
			alert(e.responseText);
		}
    }); 
    
}
function showDG(sosao, matv) {
    if (sosao==0 && matv==0) {
        document.getElementById("logined").innerHTML = "Login is required to perform this function";
        alert(index)
    }
    else if (sosao !== 0&& matv !== 0) {
        $(document).ready(function () {
            $('#rating-'+sosao).trigger('click');
        });
    }
}
