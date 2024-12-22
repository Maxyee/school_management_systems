@extends('admin.layouts.index')
@section('content') 


<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row ">
          <div class="col-sm-6">
            
          </div><!-- /.col -->
        <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
              <li class="breadcrumb-item active">Principal List</li>
            </ol>
          </div>
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
       <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
      
        <!-- /.row -->
        <!-- Main row -->
        <div class="row">
          <!-- Left col -->
          <section class="col-md-12">
                <div class="col-sm-6">
            @if ($errors->any())
              <div class="alert alert-danger">
                  <ul>
                      @foreach ($errors->all() as $error)
                          <li>{{ $error }}</li>
                      @endforeach
                  </ul>
                   <button style="margin-top: -30px" type="button" class="close text-white" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              </div>
          @endif
        </div>
           
            <div class="pannel" style="background-color:white;border-bottom: 5px solid #605ca8 ;margin-bottom: 20px;">
             <div class="pannel-header" style="background-color: #605ca8;color: white;padding: 10px">
                <h5>Principal List
                 <button type="button" class="btn btn-warning float-right btn" data-toggle="modal" data-target="#addPrincipal"><i class="fa fa-plus-circle"></i> Add  Principal</button>
                </h5>
              </div> 
            <div class="card-body">
                <table id="example1" class="table  table-hover table-sm">
                  <thead>
                  <tr style="background-color: #001f3f;color: white">
                    
                    <th>Name</th>
                     <th>School Name</th>
                     <th>Desgnation</th>
                     <th>Details</th>
                     <th>Image</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    @foreach($alldata as $key => $principal)
            <tr>
                      
                      <td>{{   $principal->name}}</td>
                      <td>{{  $principal->school_name}}</td>
                      <td>{{$principal->designation}}</td>
                      <td>{!!$principal->details!!}</td>
                     <td><img class="profile-user-img img-fluid img-circle" src="{{(!empty($principal->image))?url('upload/principalimage/'.$principal->image):url('upload/userimage.png')}}" alt="User profile picture"></td>
                      <td>
                    <button type="button" class="btn btn-dark  btn-xs" data-toggle="modal" data-target="#showPrincipal-{{ $principal->id }}"><i class="fa fa-eye"></i></button>

                     <button type="button" class="btn btn-primary  btn-xs" data-toggle="modal" data-target="#editPrincipal-{{ $principal->id }}"><i class="fa fa-edit"></i></button>

                     <a title="Delete" id="delete" href="{{route('admin.principal.delete',$principal->id)}}" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></a>
                   
                      </td> 
                    </tr>
                    @endforeach
                  </tbody>
                </table>
                </div>
              </div>
            <!-- /.card -->

            <!-- DIRECT CHAT -->
            
          </section>
          <!-- right col -->
        </div>
        <!-- /.row (main row) -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>

   {{-- Add Color --}}

  <div class="modal fade" id="addPrincipal" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Add Principal</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.principal.store')}}" id="myform" enctype="multipart/form-data">
                @csrf

<div class="row">
                  

                  <div class="form-group col-md-6">
                    <label for="name"  class="col-sm-12 col-form-label">Name</label>
                    <div class="col-sm-12">
                    <input type="text" name="name" id="name" class="form-control " placeholder="Enter Name"  autocomplete="off" value="{{old('name')}}">
                    <font style="color:red">{{($errors)->has('name')?($errors->first('name')):''}}</font>
                  </div>
                </div>

                <div class="form-group col-md-6">
                    <label for="school_name"  class="col-sm-12 col-form-label">School Name</label>
                    <div class="col-sm-12">
                    <input type="text" name="school_name" id="school_name" class="form-control " placeholder="Enter Name"  autocomplete="off" value="{{old('school_name')}}">
                    <font style="color:red">{{($errors)->has('school_name')?($errors->first('school_name')):''}}</font>
                  </div>
                </div>

                
                 

                <div class="form-group col-md-6">
                    <label for="designation"  class="col-sm-12 col-form-label">Designation</label>
                    <div class="col-sm-12">
                    <input type="text" name="designation" id="designation" class="form-control " placeholder="Enter Designation"  autocomplete="off" value="{{old('designation')}}">
                    <font style="color:red">{{($errors)->has('designation')?($errors->first('designation')):''}}</font>
                  </div>
                </div>

                 <div class="form-group col-md-6">
                    <label for="post_file"  class="col-sm-12 col-form-label">Image</label>
                    <div class="col-sm-12">
                        <img id="showimage" src="{{(empty($principal->image))?url('backend/principalimage/'.$principal->image):url('upload/usernoimage.jpg')}}" style="width: 40px;height: 45px;border:1px solid #000;">
                    <input type="file" name="image" id="image" class="form-control" placeholder="Enter Image " autocomplete="off" value="{{old('image')}}">
                      <font style="color:red">{{($errors)->has('image')?($errors->first('image')):''}}</font>
                  </div>
                </div>



                <div class="form-group col-md-12">
                    <label for="details"  class="col-sm-12 col-form-label"> Details</label>
                    <div class="col-sm-12">
                    <textarea  name="details" id="title" class="form-control " placeholder="Enter Insititute details " autocomplete="off" value="{{old('details')}}"></textarea>
                      <font style="color:red">{{($errors)->has('details')?($errors->first('details')):''}}</font>
                  </div>
                </div>

             
                  

                
       </div>

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success ">Add  Principal</button>
             
            </div>
            </form>
            </div>
           
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- end Add Category -->
</div>
  <!-- /.content-wrapper -->
@foreach($alldata as $key => $principal)
  <div class="modal fade" id="editPrincipal-{{ $principal->id }}" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Edit Principal</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.principal.update',$principal->id)}}" id="myform2" enctype="multipart/form-data">
                @csrf
            <div class="row">
                  

                  <div class="form-group col-md-6">
                    <label for="name"  class="col-sm-12 col-form-label">Name</label>
                    <div class="col-sm-12">
                    <input type="text" name="name" id="name" class="form-control " placeholder="Enter Name"  autocomplete="off" value="{{$principal->name}}">
                    <font style="color:red">{{($errors)->has('name')?($errors->first('name')):''}}</font>
                  </div>
                </div>

                <div class="form-group col-md-6">
                    <label for="school_name"  class="col-sm-12 col-form-label">School Name</label>
                    <div class="col-sm-12">
                    <input type="text" name="school_name" id="school_name" class="form-control " placeholder="Enter Name"  autocomplete="off" value="{{$principal->school_name}}">
                    <font style="color:red">{{($errors)->has('school_name')?($errors->first('school_name')):''}}</font>
                  </div>
                </div>

                
                 

                <div class="form-group col-md-6">
                    <label for="designation"  class="col-sm-12 col-form-label">Designation</label>
                    <div class="col-sm-12">
                    <input type="text" name="designation" id="designation" class="form-control " placeholder="Enter Designation"  autocomplete="off" value="{{$principal->designation}}">
                    <font style="color:red">{{($errors)->has('designation')?($errors->first('designation')):''}}</font>
                  </div>
                </div>

                 <div class="form-group col-md-6">
                    <label for="post_file"  class="col-sm-12 col-form-label">Image</label>
                    <div class="col-sm-12">
                        <img id="showimage2" src="{{(!empty($principal->image))?url('upload/principalimage/'.$principal->image):url('upload/usernoimage.jpg')}}" style="width: 40px;height: 45px;border:1px solid #000;">
                    <input type="file" name="image" id="image" class="form-control" placeholder="Enter Image " autocomplete="off" value="{{old('image')}}">
                      <font style="color:red">{{($errors)->has('image')?($errors->first('image')):''}}</font>
                  </div>
                </div>



               <div class="form-group col-md-12">
                    <label for="details"  class="col-sm-12 col-form-label">Details</label>
                    <div class="col-sm-12">
                    <textarea  name="details" id="about" class="form-control " placeholder="Enter Insititute details " autocomplete="off" >{{ $principal->details }}</textarea>
                      <font style="color:red">{{($errors)->has('details')?($errors->first('details')):''}}</font>
                  </div>
                </div>

                
       </div>
           

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-warning ">Update Academic Principal</button>
             
            </div>
            </form>
            </div>
           
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- end Add Category -->
</div>

@endforeach

 <!-- /.content-wrapper -->
@foreach($alldata as $key => $principal)
  <div class="modal fade" id="showPrincipal-{{ $principal->id }}" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-small">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title"> Post Details</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
           
           <table class="table table-bordered table-hover table-sm" >
            <tr>
              <th width="30%">Post ID</th>
              <th width="70%">{{ $principal->id }}</th>
            </tr>
            <tr>
              <th width="30%"> Name</th>
              <th width="70%">{{ $principal->name }}</th>
            </tr>
            <tr>
              <th width="30%">Email</th>
              <th width="70%">{{ $principal->email }}</th>
            </tr>
            <tr>
              <th width="30%"> Mobile</th>
              <th width="70%">{{ $principal->mobile }}</th>
            </tr>
            <tr>
              <th width="30%">Address</th>
              <th width="70%">{{ $principal->address }}</th>
            </tr>
             <tr>
              <th width="30%">Post Photo</th>
               <td>
                        @if($principal->role_id == 1)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($principal->image))?url('upload/adminimage/'.$principal->image):url('upload/postimage.png')}}"
                       alt="post profile picture">
                       @elseif($principal->role_id == 2)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($principal->image))?url('upload/librarianimage/'.$principal->image):url('upload/postimage.png')}}"
                       alt="post profile picture">
                        @elseif($principal->role_id == 3)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($principal->image))?url('upload/userimage/'.$user->image):url('upload/userimage.png')}}"
                       alt="User profile picture">
                       @endif

                     </td>
            </tr>
           </table>
                  

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
            </div>
           
            </div>
           
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- end Add Category -->
</div>

@endforeach

 <script>
        $('#datepicker').datepicker({
            uiLibrary: 'bootstrap4',
            format:'yyyy-mm-dd'
        });
    </script>
    <script>
        $('#datepicker2').datepicker({
            uiLibrary: 'bootstrap4',
            format:'yyyy-mm-dd'
        });
    </script>

  <script>
$(function () {
  
  $('#myform').validate({
    rules: {

      class_id: {
      required: true,
        
      },
      title: {
        required: true,
        
      },
      category_id: {
        required: true,
        
      },
      post_file: {
        required: true,
        
      },

      description: {
      required: true,
        
      },
       
      post_date: {
      required: true,
        
      },


      email: {
        required: true,
        email: true
       
    
        
      }
    },
    messages: {
      email: {
        required: "Please enter a email address",
        email: "Please enter a vaild email address"
        
      },

      name: {
        required: "Please enter Name",
        
      }
      
      
   
    },
    errorElement: 'span',
    errorPlacement: function (error, element) {
      error.addClass('invalid-feedback');
      element.closest('.form-group').append(error);
    },
    highlight: function (element, errorClass, validClass) {
      $(element).addClass('is-invalid');
    },
    unhighlight: function (element, errorClass, validClass) {
      $(element).removeClass('is-invalid');
    }
  });
});
</script>

 <script>
$(function () {
  
  $('#myform2').validate({
    rules: {

      role_id: {
      required: true,
        
      },
      name: {
        required: true,
        
      },
      mobile: {
        required: true,
        
      },
      gender: {
        required: true,
        
      },
       
      address: {
      required: true,
        
      },


      email: {
        required: true,
        email: true
       
    
        
      }
    },
    messages: {
      email: {
        required: "Please enter a email address",
        email: "Please enter a vaild email address"
        
      },

      name: {
        required: "Please enter Name",
        
      }
      
      
   
    },
    errorElement: 'span',
    errorPlacement: function (error, element) {
      error.addClass('invalid-feedback');
      element.closest('.form-group').append(error);
    },
    highlight: function (element, errorClass, validClass) {
      $(element).addClass('is-invalid');
    },
    unhighlight: function (element, errorClass, validClass) {
      $(element).removeClass('is-invalid');
    }
  });
});
</script>
  @endsection