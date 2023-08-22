const delModal = document.getElementById('delModal')
if (delModal) {
  delModal.addEventListener('show.bs.modal', event => {
   
    const a = event.relatedTarget
   
    const id = a.getAttribute('id')
    const inputIdUser = delModal.querySelector('#idUser')
    inputIdUser.value=id

    
    const user = a.getAttribute('user')  
    const dataUser = delModal.querySelector('.modal-body #dataUser')

    dataUser.innerHTML=user
  })
}