function isEmpty(champ)
{
   if(champ.value == "")
   {
      border(champ, true);
      return true;
   }
   else
   {
      border(champ, false);
      return false;
   }
}

   function border(champ, erreur)
{
   if(erreur)
      champ.style.border = "2px solid red";
   else
      champ.style.border = "1px solid #ccc";
}

function validateForm(form){
  console.log(form);
 isOk =   !isEmpty(form.elements['mail']);
 isOk &  !isEmpty(form.elements['nom']);
 isOk &  !isEmpty(form.elements['prenom']);
 isOk &  !isEmpty(form.elements['message']);

  return isOk;
}

$(function(){
  $('#danger-cross').click(function(){
    $('#alert-danger').toggleClass('closeAlert');
  });

// TODO cette fonction doit être déplacée
  // anime le scroll de la page quand on clique sur les boutons du menu
  $('a.page-scroll').bind('click', function(event) {
          var $anchor = $(this);
          $('html, body').stop().animate({
              scrollTop: ($($anchor.attr('href')).offset().top)
          }, 1250, 'easeInOutExpo');
          event.preventDefault();
      });
  $('#popinClose').click(function(){
    $('#popin').removeClass('troma-popin-visible');
  });
});
