function loadSidebarToggle(){
  $("#sidebarToggle").on("click",function(o){
  	$("body").toggleClass("sidebar-toggled"),
  	$(".sidebar").toggleClass("toggled"),
  	$(".sidebar").hasClass("toggled")&&$(".sidebar .collapse").collapse("hide")}
  ),
  $(window).resize(function(){
  	$(window).width()<768&&$(".sidebar .collapse").collapse("hide")
  }),
  $("body.fixed-nav .sidebar").on("mousewheel DOMMouseScroll wheel",function(o){
  	if(768<$(window).width()){
  		var e=o.originalEvent,l=e.wheelDelta||-e.detail;this.scrollTop+=30*(l<0?1:-1),o.preventDefaul$()
  	}
  });
};