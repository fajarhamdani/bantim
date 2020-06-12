function editKelompok(kelompokId){
  $.ajax({
    type: 'GET',
    dataType: 'script',
    url: '/kelompoks/'+kelompokId+'/edit',
    success: function(response){
      $('#ModalCenter').modal('show');
    }
  });
};

function addKelompok(){
  $.ajax({
    type: 'GET',
    dataType: 'script',
    url: '/desas/'+gon.desa_id+'/kelompoks/new',
    success: function(response){
      $('#ModalCenter').modal('show');
    }
  });
};