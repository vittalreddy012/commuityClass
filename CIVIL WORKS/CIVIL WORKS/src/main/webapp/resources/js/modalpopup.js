/*
Cross-browser Modal Popup using Javascript (JQuery)
*/

//Modal popup background ID.
//This value should be unique so that it does not conflict with other IDs in the page.
var _ModalPopupBackgroundID = 'backgroundPopup_XYZ_20110418_Custom';

function ShowModalPopup(modalPopupID) {
 
    //Setting modal popup window

    //Boolean to detect IE6.
   // var isIE6 = (navigator.appVersion.toLowerCase().indexOf('msie 7') > 0);

    var popupID = "#" + modalPopupID;

    //Get popup window margin top and left
    var popupMarginTop = $(popupID).height() / 2;
    var popupMarginLeft = $(popupID).width() / 2;

    //Set popup window left and z-index
    //z-index of modal popup window should be higher than z-index of modal background
    $(popupID).css({
        'top': '0',
        'left': '50%',
        'z-index': 9999,
        
    });

    //Special case for IE6 because it does not understand position: fixed
   // if (isIE6) {
        $(popupID).css({
            'top': $(document).scrollTop(),
            'margin-top': $(document).height() / 2 - popupMarginTop,
            'margin-left': -popupMarginLeft,
            'display': 'block',
            'position': 'absolute',
            'margin-top': '10%'
        });
  //  }
 //   else {
 //       $(popupID).css({
  //          'top': '50%',
  //          'margin-top': -popupMarginTop,
  //          'margin-left': -popupMarginLeft,
  //          'display': 'block',
  //          'position': 'fixed'
  //      });
 //   }

    //Automatically adding modal background to the page.
    var backgroundSelector = $('<div id="' + _ModalPopupBackgroundID + '" ></div>');
    
    

    //Add modal background to the body of the page.
    backgroundSelector.appendTo('body');

    //Set CSS for modal background. Set z-index of background lower than popup window.
    backgroundSelector.css({
        'width': $(document).width(),
        'height': $(document).height(),
        'display': 'none',
        'background-color': '#000',
        'position': 'absolute',
        'top': 0,
        'left': 0,
        'z-index': 9990
    });

    backgroundSelector.fadeTo('fast', 0.8);
}

function HideModalPopup(modalPopupID) {
    //Hide modal popup window
    $("#" + modalPopupID).css('display', 'none');

    //Remove modal background from DOM.
    $("#" + _ModalPopupBackgroundID).remove();
}

function ShowPopup(modalPopupID) {
   
    $('#dvPopup').show();
     $('a.modalCloseImg').hide();

                        $('#simplemodal-container').css("width","400");
                        $('#simplemodal-container').css("height","400px");
}

