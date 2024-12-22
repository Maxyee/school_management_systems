<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin Dashboard</title>

  <!-- Google Font: Source Sans Pro -->
 <link rel="stylesheet" href="{{asset('backend')}}/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
 <link rel="stylesheet" href="{{asset('backend')}}/plugins/daterangepicker/daterangepicker.css">
  <!-- Tempusdominus Bootstrap 4 -->
 
  <!-- iCheck -->
  <link rel="stylesheet" href="{{asset('backend')}}/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="{{asset('backend')}}/plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{asset('backend')}}/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="{{asset('backend')}}/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="{{asset('backend')}}/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="{{asset('backend')}}/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="{{asset('backend')}}/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

  <link rel="stylesheet" href="{{asset('backend')}}/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
  <!-- Toastr -->
  {{-- <link rel="stylesheet" href="{{asset('backend')}}/plugins/toastr/toastr.min.css"> --}}
  <!-- Theme style -->
  <link rel="stylesheet" href="{{asset('backend')}}/dist/css/adminlte.min.css">
   <link rel="stylesheet" href="{{asset('backend')}}/plugins/summernote/summernote-bs4.min.css">
   <link rel="stylesheet" href="{{asset('backend')}}/plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="{{asset('backend')}}/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <link rel="stylesheet" href="http://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css"> 
  
  <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />


   
  <style type="text/css">
    .notifyjs.corner{
      z-index: 10000 !important; 
    }
  </style>



  


   
</head>
<body class="hold-transition sidebar-mini">
@include('admin.layouts.header')
  <!-- /.navbar -->
@include('admin.layouts.sidebar')
  <!-- Main Sidebar Container -->
 

  <!-- Content Wrapper. Contains page content -->
  @yield('content')
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  @include('admin.layouts.footer')
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="{{ asset('backend') }}/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="{{ asset('backend') }}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="{{ asset('backend') }}/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->

<!-- overlayScrollbars -->

<!-- AdminLTE App -->

<!-- AdminLTE dashboard demo (This is only for demo purposes) -->


<script src="{{asset('backend')}}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="{{asset('backend')}}/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="{{asset('backend')}}/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="{{asset('backend')}}/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="{{asset('backend')}}/plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="{{asset('backend')}}/plugins/jquery-validation/additional-methods.min.js"></script>

 <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.js"></script>
 <script src="{{asset('backend')}}/plugins/select2/js/select2.full.min.js"></script>
<!-- Bootstrap4 Duallistbox -->

<!-- InputMask -->


<!-- date-range-picker -->
<script src="{{asset('backend')}}/plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap color picker -->

<script src="http://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
<!-- Tempusdominus Bootstrap 4 -->

<!-- Bootstrap Switch -->


<!-- AdminLTE App -->
<script src="{{asset('backend')}}/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="{{asset('backend')}}/dist/js/demo.js"></script>
    
    <script src="{{asset('backend')}}/plugins/summernote/summernote-bs4.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.js"></script>
  <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>



{!! Toastr::message() !!}


<script type="text/javascript">
toastr.options = {
  "closeButton": false,
  "debug": false,
  "newestOnTop": false,
  "progressBar": true,
  "positionClass": "toast-top-right",
  "preventDuplicates": false,
  "onclick": null,
  "showDuration": "300",
  "hideDuration": "1000",
  "timeOut": "5000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
}

</script>

<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true,
      "autoWidth": false,
    });
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>
{{-- Delete --}}
<script type="text/javascript">
  $(function(){
    $(document).on('click','#delete',function(e){
      e.preventDefault();
      var link = $(this).attr("href");

Swal.fire({
  title: 'Are you sure?',
  text: "Delete This Data!",
  icon: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Yes, delete it!'
}).then((result) => {
  if (result.value) {
    window.location.href = link;
    Swal.fire(
      'Deleted!',
      'Your file has been deleted.',
      'success'
    )
  }
})

    }); 
  });

</script>

<script type="text/javascript">
  $(function(){
    $(document).on('click','#active',function(e){
      e.preventDefault();
      var link = $(this).attr("href");

Swal.fire({
  title: 'Are you sure?',
  text: "active This status!",
  icon: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Yes, active it!'
}).then((result) => {
  if (result.value) {
    window.location.href = link;
    Swal.fire(
      'Activated!',
      'Your file has been activated.',
      'success'
    )
  }
})

    }); 
  });

</script>

<script type="text/javascript">
  $(function(){
    $(document).on('click','#inactive',function(e){
      e.preventDefault();
      var link = $(this).attr("href");

Swal.fire({
  title: 'Are you sure?',
  text: "inactive This status!",
  icon: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Yes, inactive it!'
}).then((result) => {
  if (result.value) {
    window.location.href = link;
    Swal.fire(
      'Inactivated!',
      'Your file has been inactivated.',
      'success'
    )
  }
})

    }); 
  });

</script>

<script>
  $(function () {
    // Summernote
    $('#title').summernote()

    // CodeMirror
    CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
      mode: "htmlmixed",
      theme: "monokai"
    });
  })
</script>

<script>
  $(function () {
    // Summernote
    $('#description').summernote()

    // CodeMirror
    CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
      mode: "htmlmixed",
      theme: "monokai"
    });
  })
</script>

<script>
  $(function () {
    // Summernote
    $('.title').summernote()

    // CodeMirror
    CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
      mode: "htmlmixed",
      theme: "monokai"
    });
  })
</script>

<script>
  $(function () {
    // Summernote
    $('.description').summernote()

    // CodeMirror
    CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
      mode: "htmlmixed",
      theme: "monokai"
    });
  })
</script>

<script>
  $(function () {
    // Summernote
    $('#ins').summernote()

    // CodeMirror
    CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
      mode: "htmlmixed",
      theme: "monokai"
    });
  })
</script>

<script>
  $(function () {
    // Summernote
    $('#puri').summernote()

    // CodeMirror
    CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
      mode: "htmlmixed",
      theme: "monokai"
    });
  })
</script>

<script>
  $(function () {
    // Summernote
    $('#ins1').summernote()

    // CodeMirror
    CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
      mode: "htmlmixed",
      theme: "monokai"
    });
  })
</script>

<script>
  $(function () {
    // Summernote
    $('#puri1').summernote()

    // CodeMirror
    CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
      mode: "htmlmixed",
      theme: "monokai"
    });
  })
</script>

<script>
  $(function () {
    // Summernote
    $('#about').summernote()

    // CodeMirror
    CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
      mode: "htmlmixed",
      theme: "monokai"
    });
  })
</script>


<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //Initialize Select2 Elements
    $('.select2bs4').select2({
      theme: 'bootstrap4'
    })

    $('.select2bs41').select2({
      theme: 'bootstrap4'
    })



  })
  
  // DropzoneJS Demo Code End
</script>

<script type="text/javascript">
$(document).ready(function(){
  $('#image').change(function(e){
    var reader = new FileReader();
    reader.onload = function(e){
      $('#showimage').attr('src',e.target.result);
    }
    reader.readAsDataURL(e.target.files['0']);
  });
});
</script>
<script type="text/javascript">
$(document).ready(function(){
  $('#thumbail').change(function(e){
    var reader = new FileReader();
    reader.onload = function(e){
      $('#showimage2').attr('src',e.target.result);
    }
    reader.readAsDataURL(e.target.files['0']);
  });
});

</script>
</body>
</html>scre
