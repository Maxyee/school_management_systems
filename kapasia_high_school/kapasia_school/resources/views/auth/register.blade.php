<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title> Log in Panel</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{ asset('backend') }}/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="{{ asset('backend') }}/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{ asset('backend') }}/dist/css/adminlte.min.css">
</head>
<body class="hold-transition login-page">
<div class="login-box" style="margin-top:-100px">
  <div class="login-logo">
    <a href="#"><b>Login</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="card" style="border-top: solid 5px crimson; ">
    <div class="card-body login-card-body">

      @if(Session::get('success'))
                        <div class="alert alert-success alert-dismissible">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  
  <strong>{{session::get('success')}}</strong> 
  
</div> 
@endif

      @if($errors->any())
                        <div class="alert alert-danger alert-dismissible">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  @foreach($errors->all() as $error)
  <strong>{{$error}}</strong> <br/>
  @endforeach
</div>
@endif
      <p class="login-box-msg">Sign in to start your session</p>

      <form action="{{ route('login') }}" method="post" id="myform">
        @csrf
        <div class="input-group mb-3">
          <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}"  autocomplete="email" autofocus>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password"  autocomplete="current-password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            
          </div>
          <!-- /.col -->
          <div class="col-12">

            <button type="submit" class="btn btn-primary  font-weight-bold">Sign In</button>
          </div>
          <!-- /.col -->
        </div>
      </form>
{{-- 
      <div class="social-auth-links text-center mb-3">
        <p>- OR -</p> --}}
       <!--  <a href="#" class="btn btn-block btn-primary">
          <i class="fab fa-facebook mr-2"></i> Sign in using Facebook
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fab fa-google-plus mr-2"></i> Sign in using Google+
        </a> -->
   {{--    </div> --}}
      <!-- /.social-auth-links -->
   {{-- <p class="mb-1">
        <button type="button" class="btn btn-success  font-italic " data-toggle="modal" data-target="#addMember"><i class="fa fa-plus-circle mr-1"></i> Create Membership</button>
      </p> --}}
     {{--  <p class="mb-0">
        <a href="forgot-password.html" class="font-weight-bold"> Forgot Password</a>
      </p> --}}
      
    </div>
    <!-- /.login-card-body -->
  </div>
</div>





</body>
</html>
