(function(){
  $.fn.requestsModal = function() {

    return this.each(function(){
      var $requestLink = $(this);
      var requestURL = $requestLink.attr('href');
      var requestURLWithModalParam = requestURL + '&modal=true';
      init();

      function init(){
        $requestLink.on('click', function(e){
          e.preventDefault();
          toggleOrCreateModal();
        });
      }

      function toggleOrCreateModal() {
        if ( modalIsPresent() ) {
           showModal();
        } else {
          removeAllExistingRequestModals();
          createModal();
          showModal();
        }
      }

      function showModal() {
        modalForRequest().modal('show');
      }

      function createModal() {
        $('body').append(requestsModalTemplate());
        applyModalCloseBehavior();
        addPostMessageListener();
      }

      function removeAllExistingRequestModals() {
        $('.requests-modal').each(function(){
          $(this).remove();
        });
      }

      function applyModalCloseBehavior() {
        modalCancelButton().on('click', function() {
          modalForRequest().modal('hide');
          modalForRequest().remove();
        });
      }

      function addPostMessageListener() {
        $(window).on('message onmessage', function(e) {
          // If we ever extend this to include more data than contentHeight
          // and the successPage boolean then we may want to validate that
          // the event.origin is what we expect it to be. As it stands we
          // are not doing anything that would allow somebody to do anything
          // malicious so we can allow these messages without origin validation.
          var data = e.originalEvent.data;
          updateModalHeight(data.contentHeight);
          updateCancelButton(data.successPage);
        });
      }

      function updateModalHeight(contentHeight) {
        var iframeHeight = modalForRequest().find('iframe').height();
        var setHeight = parseInt(contentHeight, 10);

        if (iframeHeight != setHeight && contentHeight > 0) {
          modalForRequest().find('iframe').height(setHeight + 'px');
        }
      }

      function updateCancelButton(onSuccessPage) {
        if (onSuccessPage) {
          modalCancelButton().text('Close');
        }
      }

      function modalForRequest() {
        return $('[data-request-modal-url="' + requestURL + '"]');
      }

      function modalCancelButton() {
        return modalForRequest().find('[data-behavior="cancel-link"]');
      }

      function modalIsPresent() {
        return modalForRequest().length > 0;
      }

      function requestsModalTemplate() {
        return [
          '<div class="modal requests-modal" tabindex="-1" role="modal" data-request-modal-url="' + requestURL + '">',
            '<div class="modal-dialog">',
              '<div class="modal-content">',
                '<div class="modal-body">',
                  '<iframe width="100%" height="90%" frameborder="0" scrolling="no" src="' + requestURLWithModalParam + '" />',
                  '<div class="form-group cancel-footer">',
                    '<button data-behavior="cancel-link" class="cancel-link btn btn-link">Cancel</button>',
                  '</div>',
                '</div>',
              '</div>',
            '</div>',
          '</div>'
        ].join('\n');
      }
    });
  };

})(jQuery);

Blacklight.onLoad(function() {
  $('[data-behavior="requests-modal"]').requestsModal();
});
