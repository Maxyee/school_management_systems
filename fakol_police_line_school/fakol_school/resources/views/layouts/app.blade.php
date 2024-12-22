@php
	$seo=DB::table('seos')->first();
	$setting=DB::table('settings')->first();
@endphp
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>{{ $seo->meta_title }} | Admin Dashboard</title>
         
     <link rel="icon" href="{{ asset($setting->favicon) }}">
     <meta name="csrf-token" content="{{ csrf_token() }}">
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{ asset('public/template/plugins/fontawesome-free/css/all.min.css')}}">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bbootstrap 4 -->
  <link rel="stylesheet" href="{{ asset('public/template/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css') }}">
  <!-- iCheck -->
  <link rel="stylesheet" href="{{ asset('public/template/plugins/icheck-bootstrap/icheck-bootstrap.min.css') }}">
  <!-- JQVMap -->
  <link rel="stylesheet" href="{{ asset('public/template/plugins/jqvmap/jqvmap.min.css') }}">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{ asset('public/template/dist/css/adminlte.min.css') }}">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="{{ asset('public/template/plugins/overlayScrollbars/css/OverlayScrollbars.min.css') }}">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="{{ asset('public/template/plugins/daterangepicker/daterangepicker.css') }}">
  <link rel="stylesheet" href="{{ asset('public/template/plugins/datatables-bs4/css/dataTables.bootstrap4.css')}}">
  <!-- summernote -->
  <link rel="stylesheet" href="{{ asset('public/template/plugins/summernote/summernote-bs4.css') }}">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <link rel="stylesheet" href="{{ asset('public/template/plugins/toaster/toastr.css')}}">
   <link rel="stylesheet" href="{{ asset('public/template/plugins/bootstrap-sweetalert/dist/sweetalert.css')}}">
    <!-- summernote -->
  <link rel="stylesheet" href="{{ asset('public/template/plugins/summernote/summernote-bs4.css')}}">
   
</head>
<body >


  @guest
  @else
  <div class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">
     <!-- Navbar -->
     <nav class="main-header navbar navbar-expand navbar-white navbar-light">
       <!-- Left navbar links -->
       <ul class="navbar-nav">
         <li class="nav-item">
           <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
         </li>
       
       </ul>

     

      <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">

      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-user"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a href="{{ route('user.logout') }}" class="dropdown-item">
          	Logout
          </a>
        </div>
      </li>

    </ul>
  </nav>
  <!-- /.navbar -->

     <!-- Main Sidebar Container -->
     <aside class="main-sidebar sidebar-dark-primary elevation-4">
       <!-- Brand Logo -->
       <a href="https://elitedesign.com.bd" class="brand-link">
         <img src="{{ asset('public/template/dist/img/elite.png') }}" alt="" class="brand-image img-circle elevation-3"
              style="opacity: .8">
         <span class="brand-text font-weight-light">Elite Design</span>
       </a>

       <!-- Sidebar -->
       <div class="sidebar">
         <!-- Sidebar user panel (optional) -->
         <div class="user-panel mt-3 pb-3 mb-3 d-flex">
           <div class="image">
             <img src="{{ asset($setting->favicon) }}" class="img-circle elevation-2" alt="User Image">
           </div>
           <div class="info">
             <a href="#" class="d-block">{{ Auth::user()->name }}</a>
           </div>
         </div>

         <!-- Sidebar Menu -->
         <nav class="mt-2">
           <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
             <!-- Add icons to the links using the .nav-icon class
                  with font-awesome or any other icon font library -->
             <li class="nav-item ">
               <a href="{{ route('home') }}" class="nav-link active">
                 <i class="nav-icon fas fa-tachometer-alt"></i>
                 <p>
                   Dashboard
                 
                 </p>
               </a>
             </li>
        

             @if(Auth::user()->category==1)
             <li class="nav-item has-treeview">
               <a href="#" class="nav-link">
                 <i class="nav-icon fa fa-list-alt"></i>
                 <p>
                 Categories
                   <i class="fas fa-angle-left right"></i>
                 </p>
               </a>
               <ul class="nav nav-treeview">
                 <li class="nav-item">
                   <a href="{{ route('categories') }}" class="nav-link">
                     <i class="far fa-circle nav-icon"></i>
                     <p>Category</p>
                   </a>
                 </li>
                 <li class="nav-item">
                   <a href="{{ route('subcategories') }}" class="nav-link">
                     <i class="far fa-circle nav-icon"></i>
                     <p>Subcategory</p>
                   </a>
                 </li>
               </ul>
             </li>
             @endif
			 @if(Auth::user()->post==1)
			 <li class="nav-item">
               <a href="{{ route('insert.post') }}" class="nav-link">
                 <i class="nav-icon fa fa-clipboard"></i>
                 <p class="text">Add Post</p>
               </a>
             </li>
			 @endif
          @if(Auth::user()->allpost==1)
			 <li class="nav-item">
               <a href="{{ route('all.post') }}" class="nav-link">
                 <i class="nav-icon fa fa-clipboard"></i>
                 <p class="text">View All Post</p>
               </a>
             </li>
             @endif
             @if(Auth::user()->gallery ==1)
               <li class="nav-item has-treeview">
               <a href="#" class="nav-link">
                 <i class="nav-icon far fa-image"></i>
                 <p>
                 Gallery
                   <i class="fas fa-angle-left right"></i>
                 </p>
               </a>
               <ul class="nav nav-treeview">
                 <li class="nav-item">
                   <a href="{{ route('photos.gallery') }}" class="nav-link">
                     <i class="far fa-circle nav-icon"></i>
                     <p>Photo Gallery</p>
                   </a>
                 </li>
                 <li class="nav-item">
                   <a href="{{ route('video.gallery') }}" class="nav-link">
                     <i class="far fa-circle nav-icon"></i>
                     <p>Video gallery</p>
                   </a>
                 </li>
               </ul>
             </li>
             @endif
			 

             @if(Auth::user()->ads==1)
              <li class="nav-item has-treeview">
               <a href="#" class="nav-link">
                 <i class="nav-icon fa fa-plus-square"></i>
                 <p>
                 Staff
                   <i class="fas fa-angle-left right"></i>
                 </p>
               </a>
               <ul class="nav nav-treeview">
                 <li class="nav-item">
                   <a href="{{ route('horizontal.ads') }}" class="nav-link">
                     <i class="far fa-circle nav-icon"></i>
                     <p>Staff List</p>
                   </a>
                 </li>
               </ul>
             </li>
             @endif

             @if(Auth::user()->role ==1)
              <li class="nav-item has-treeview">
               <a href="#" class="nav-link">
                 <i class="nav-icon fa fa-users"></i>
                 <p>
                 Staff Role
                   <i class="fas fa-angle-left right"></i>
                 </p>
               </a>
               <ul class="nav nav-treeview">
                 <li class="nav-item">
                   <a href="{{ route('insert.writer') }}" class="nav-link">
                     <i class="far fa-circle nav-icon"></i>
                     <p>Add Staff</p>
                   </a>
                 </li>
                 <li class="nav-item">
                   <a href="{{ route('all.writer') }}" class="nav-link">
                     <i class="far fa-circle nav-icon"></i>
                     <p>All Staff</p>
                   </a>
                 </li>
				                  <li class="nav-item">
                   <a href="{{ route('password.change') }}" class="nav-link">
                     <i class="far fa-circle nav-icon"></i>
                     <p>Chnage Password</p>
                   </a>
                 </li>
               </ul>
             </li>
             @endif
			 @if(Auth::user()->setting==1)
			   <li class="nav-item">
               <a href="{{ route('website.setting') }}" class="nav-link">
                 <i class="nav-icon fa fa-cog"></i>
                 <p class="text">Setting & Configuration</p>
               </a>
             </li>
			 			   <li class="nav-item">
               <a href="{{ route('notice.setting') }}" class="nav-link">
                 <i class="nav-icon fa fa-bell"></i>
                 <p class="text">Notice Setup</p>
               </a>
             </li>
			 			   <li class="nav-item">
               <a href="{{ route('social.setting') }}" class="nav-link">
                 <i class="nav-icon fab fa-facebook-f"></i>
                 <p class="text">Socail Account Setup</p>
               </a>
             </li>
			 			   <li class="nav-item">
               <a href="{{ route('seo.setting') }}" class="nav-link">
                 <i class="nav-icon fas fa-search"></i>
                 <p class="text">SEO Setting</p>
               </a>
             </li>
			 			 			   <li class="nav-item">
               <a href="{{ route('important.website') }}" class="nav-link">
                 <i class="nav-icon fas fa-th"></i>
                 <p class="text">Important Website Link</p>
               </a>
             </li>
			 @endif
             </li>
           </ul>
         </nav>
         <!-- /.sidebar-menu -->
       </div>
       <!-- /.sidebar -->
     </aside>
   </div>
 </div>

  @endguest



  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    @yield('content')
  </div>


  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<footer class="main-footer">
 <p style="text-align: center;"><span>সকল কারিগরী সহযোগিতায় <a href="https://elitedesign.com.bd/" target="_blank"><span>এলিট ডিজাইন</span></a></span></p>
 </footer>

<!-- jQuery -->
<script src="{{ asset('public/template/plugins/jquery/jquery.min.js') }}"></script>
<!-- jQuery UI 1.11.4 -->
<script src="{{ asset('public/template/plugins/jquery-ui/jquery-ui.min.js') }}"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="{{ asset('public/template/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>

<script src="{{ asset('public/template/plugins/datatables/jquery.dataTables.js')}}"></script>
<script src="{{ asset('public/template/plugins/datatables-bs4/js/dataTables.bootstrap4.js')}}"></script>
<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
    });
  });
</script>
<script  src="{{ asset('public/template/plugins/toaster/toastr.min.js')}}"></script>
<script  src="{{ asset('public/template/plugins/bootstrap-sweetalert/dist/sweetalert.min.js')}}"></script>

<!-- ChartJS -->
<script src="{{ asset('public/template/plugins/chart.js/Chart.min.js') }}"></script>
<!-- Sparkline -->
<script src="{{ asset('public/template/plugins/sparklines/sparkline.js') }}"></script>
<!-- JQVMap -->
<script src="{{ asset('public/template/plugins/jqvmap/jquery.vmap.min.js') }}"></script>
<script src="{{ asset('public/template/plugins/jqvmap/maps/jquery.vmap.usa.js') }}"></script>
<!-- jQuery Knob Chart -->
<script src="{{ asset('public/template/plugins/jquery-knob/jquery.knob.min.js') }}"></script>
<!-- daterangepicker -->
<script src="{{ asset('public/template/plugins/moment/moment.min.js') }}"></script>
<script src="{{ asset('public/template/plugins/daterangepicker/daterangepicker.js') }}"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="{{ asset('public/template/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js') }}"></script>
<!-- Summernote -->
<script src="{{ asset('public/template/plugins/summernote/summernote-bs4.min.js') }}"></script>

<script>
  $(function () {
    // Summernote
    $('.textarea').summernote()
  })
</script>

<!-- overlayScrollbars -->
<script src="{{ asset('public/template/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js') }}"></script>
<!-- AdminLTE App -->
<script src="{{ asset('public/template/dist/js/adminlte.js') }}"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="{{ asset('public/template/dist/js/pages/dashboard.js') }}"></script>
<!-- AdminLTE for demo purposes -->
<script src="{{ asset('public/template/dist/js/demo.js') }}"></script>
 

 <script>
     @if(Session::has('messege'))
          var type="{{Session::get('alert-type','info')}}"
          switch(type){
              case 'info':
                   toastr.info("{{ Session::get('messege') }}");
                   break;
              case 'success':
                  toastr.success("{{ Session::get('messege') }}");
                  break;
              case 'warning':
                 toastr.warning("{{ Session::get('messege') }}");
                  break;
              case 'error':
                  toastr.error("{{ Session::get('messege') }}");
                  break;
          }
        @endif
  </script>

    <script>
            $(document).on("click", "#delete", function(e){
                e.preventDefault();
                 var link = $(this).attr("href");
                 swal({
                  title: "Are you sure?",
                  text: "You will not be able to recover this imaginary file!",
                  type: "warning",
                  showCancelButton: true,
                  confirmButtonClass: "btn-danger",
                  confirmButtonText: "Yes, delete it!",
                  cancelButtonText: "No, cancel!",
                },
                function(isConfirm) {
                  if (isConfirm) {
                    swal("Deleted!", "Your imaginary file has been deleted.", "success");
                    window.location.href = link;
                  } else {
                    swal("Cancelled", "Your imaginary file is safe :)", "error");
                  }
                });
               });
       </script>


</body>
</html>
