function setNewDesa(){
  $.ajax({
  type: 'GET',
  dataType: 'script',
  url: '/desas/new'
  });
};

function editDesa(desaId){
  $.ajax({
    type: 'GET',
    dataType: 'script',
    url: '/desas/'+desaId+'/edit',
    success: function(response){
      $('#ModalCenter').modal('show');
    }
  });
};

function addDesa(){
  $.ajax({
    type: 'GET',
    dataType: 'script',
    url: '/desas/new',
    success: function(response){
      $('#ModalCenter').modal('show');
    }
  });
};