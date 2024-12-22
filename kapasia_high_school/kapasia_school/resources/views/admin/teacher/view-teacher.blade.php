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
              <li class="breadcrumb-item active">Teacher List</li>
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
                <h5>Teacher List
                 <button type="button" class="btn btn-warning float-right btn" data-toggle="modal" data-target="#addTeacher"><i class="fa fa-plus-circle"></i> Add Teacher</button>
                </h5>
              </div> 
            <div class="card-body">
                <table id="example1" class="table  table-hover table-sm">
                  <thead>
                  <tr style="background-color: #001f3f;color: white">
                    <th>SL</th>
                    <th>ID</th>
                    <th>User Type</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>Code</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    @foreach($alldata as $key => $user)
            <tr>
                      <td>{{$key+1}}</td>
                      <td>{{$user->id}}</td>
                      <td>{{$user['role']['name']}}</td>
                      <td>{{$user->name}}</td>
                      <td>{{$user->email}}</td>
                      <td>{{$user->mobile}}</td>
                     <td>{{$user->code}}</td>
                      <td>
                     @if($user->status==1)
                    <span class="badge badge-success">Active</span>
                    @else
                    <span class="badge badge-danger">Inactive</span>
                    @endif
                  </td>
                      <td>
                         @if($user->status==1)
                          <a id="inactive" href="{{route('admin.teacher.inactive',$user->id)}}" class="btn  btn-warning btn-xs mr-2"> <i class="fa fa-arrow-up"></i></a>
                          @else
                          <a id="active" href="{{route('admin.teacher.active',$user->id)}}" class="btn btn-success btn-xs mr-2" > <i class="fa fa-arrow-down"></i></a>
                          @endif

                    
                    <button type="button" class="btn btn-dark  btn-xs" data-toggle="modal" data-target="#showTeacher-{{ $user->id }}"><i class="fa fa-eye"></i></button>

                     <button type="button" class="btn btn-primary  btn-xs" data-toggle="modal" data-target="#editTeacher-{{ $user->id }}"><i class="fa fa-edit"></i></button>

                    <a title="Delete" id="delete" href="{{route('admin.teacher.delete',$user->id)}}" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></a>
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

  <div class="modal fade" id="addTeacher" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-small">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Add Teacher</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.teacher.store')}}" id="myform">
                @csrf
                
                <div class="form-group row">
                    <label for="role_id"  class="col-sm-3 col-form-label">Role Name</label>
                  <div class="col-sm-9">
                    <select name="role_id" id="role_id" class="form-control" autocomplete="off" value="{{old('role_id')}}">
                      <option value="">Select Role Name</option>
                    @foreach($roles as $role)
                    <option value="{{$role->id}}">{{$role->name}}</option>
                    @endforeach
                    </select>
                     <font style="color:red">{{($errors)->has('role_id')?($errors->first('role_id')):''}}</font>
                  </div>
                   </div>


                  <div class="form-group row">
                     <label for="name"  class="col-sm-3 col-form-label">Name</label>
                 <div class="col-sm-9">
                    <input type="text" name="name" id="name" class="form-control" placeholder="Enter Name" autocomplete="off" value="{{old('name')}}">
                     <font style="color:red">{{($errors)->has('name')?($errors->first('name')):''}}</font>
                  </div>
                </div>

                  <div class="form-group row">
                    <label for="email"  class="col-sm-3 col-form-label">Email</label>
                    <div class="col-sm-9">
                    <input type="email" name="email" id="email" class="form-control" placeholder="Enter Email" autocomplete="off" value="{{old('email')}}">
                    <font style="color:red">{{($errors)->has('email')?($errors->first('email')):''}}</font>
                  </div>
                </div>

                  {{-- <div class="form-group row">
                    <label for="desi_id"  class="col-sm-3 col-form-label">Designation Name</label>
                  <div class="col-sm-9">
                    <select name="desi_id" id="desi_id" class="form-control" autocomplete="off" value="{{old('desi_id')}}">
                      <option value="">Select Designation Name</option>
                    @foreach($desis as $desi)
                    <option value="{{$desi->id}}">{{$desi->name}}</option>
                    @endforeach
                    </select>
                     <font style="color:red">{{($errors)->has('desi_id')?($errors->first('desi_id')):''}}</font>
                  </div>
                   </div>

                   <div class="form-group row">
                    <label for="subject_id"  class="col-sm-3 col-form-label">Subject Name</label>
                  <div class="col-sm-9">
                    <select name="subject_id" id="subject_id" class="form-control" autocomplete="off" value="{{old('subject_id')}}">
                      <option value="">Select Subject Name</option>
                    @foreach($subjects as $subject)
                    <option value="{{$subject->id}}">{{$subject->name}}</option>
                    @endforeach
                    </select>
                     <font style="color:red">{{($errors)->has('subject_id')?($errors->first('subject_id')):''}}</font>
                  </div>
                   </div> --}}

                  <div class="form-group row">
                    <label for="mobile"  class="col-sm-3 col-form-label">Mobile</label>
                    <div class="col-sm-9">
                    <input type="text" name="mobile" id="mobile" class="form-control" placeholder="Enter Mobile Number" autocomplete="off" value="{{old('mobile')}}">
                      <font style="color:red">{{($errors)->has('mobile')?($errors->first('mobile')):''}}</font>
                  </div>
                </div>
           

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success ">Add Teacher</button>
             
            </div>
            </form>
            </div>
           
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- end Add Category -->
</div>
  <!-- /.content-wrapper -->
@foreach($alldata as $key => $user)
  <div class="modal fade" id="editTeacher-{{ $user->id }}" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-small">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Edit Teacher</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.teacher.update',$user->id)}}" id="myform2">
                @csrf
                
                <div class="form-group row">
                    <label for="role_id"  class="col-sm-3 col-form-label">Role Name</label>
                  <div class="col-sm-9">
                    <select name="role_id" id="role_id" class="form-control" autocomplete="off">
                      <option value="">Select Role Name</option>
                    @foreach($roles as $role)
                      <option value="{{$role->id}}" {{ $role->id == $user->role_id ?" selected":""}}>{{$role->name}}</option>
                      @endforeach
                    </select>
                     <font style="color:red">{{($errors)->has('role_id')?($errors->first('role_id')):''}}</font>
                  </div>
                   </div>


                  <div class="form-group row">
                     <label for="name"  class="col-sm-3 col-form-label">Name</label>
                 <div class="col-sm-9">
                    <input type="text" name="name" value="{{ $user->name }}" id="name" class="form-control" placeholder="Enter Name" autocomplete="off">
                     <font style="color:red">{{($errors)->has('name')?($errors->first('name')):''}}</font>
                  </div>
                </div>

                  <div class="form-group row">
                    <label for="email"  class="col-sm-3 col-form-label">Email</label>
                    <div class="col-sm-9">
                    <input type="email" value="{{ $user->email }}" name="email" id="email" class="form-control" placeholder="Enter Email" autocomplete="off">
                    <font style="color:red">{{($errors)->has('email')?($errors->first('email')):''}}</font>
                  </div>
                </div>


                {{-- <div class="form-group row">
                    <label for="desi_id"  class="col-sm-3 col-form-label">Designation Name</label>
                  <div class="col-sm-9">
                    <select name="desi_id" id="desi_id" class="form-control" autocomplete="off" value="{{old('desi_id')}}">
                      <option value="">Select Designation Name</option>
                    @foreach($desis as $desi)
                    <option value="{{$desi->id}}" {{ $desi->id == $user->desi_id ?" selected":""}}>{{$desi->name}}</option>
                    @endforeach
                    </select>
                     <font style="color:red">{{($errors)->has('desi_id')?($errors->first('desi_id')):''}}</font>
                  </div>
                   </div>

                   <div class="form-group row">
                    <label for="subject_id"  class="col-sm-3 col-form-label">Subject Name</label>
                  <div class="col-sm-9">
                    <select name="subject_id" id="subject_id" class="form-control" autocomplete="off" value="{{old('subject_id')}}">
                      <option value="">Select Subject Name</option>
                    @foreach($subjects as $subject)
                    <option value="{{$subject->id}}"{{ $subject->id == $user->subject_id ?" selected":""}}>{{$subject->name}}</option>
                    @endforeach
                    </select>
                     <font style="color:red">{{($errors)->has('subject_id')?($errors->first('subject_id')):''}}</font>
                  </div>
                   </div>
 --}}
                  <div class="form-group row">
                    <label for="mobile"  class="col-sm-3 col-form-label">Mobile</label>
                    <div class="col-sm-9">
                    <input type="text" name="mobile" value="{{ $user->mobile }}" id="mobile2" class="form-control" placeholder="Enter Mobile Number" autocomplete="off">
                      <font style="color:red">{{($errors)->has('mobile')?($errors->first('mobile')):''}}</font>
                  </div>
                </div>
           

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-warning ">Update Teacher</button>
             
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
@foreach($alldata as $key => $user)
  <div class="modal fade" id="showTeacher-{{ $user->id }}" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-small">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title"> Teacher Details</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
           
           <table class="table table-bordered table-hover table-sm" >
            <tr>
              <th width="30%">Teacher ID</th>
              <th width="70%">{{ $user->id }}</th>
            </tr>
            <tr>
              <th width="30%"> Name</th>
              <th width="70%">{{ $user->name }}</th>
            </tr>
            <tr>
              <th width="30%">Email</th>
              <th width="70%">{{ $user->email }}</th>
            </tr>
            <tr>
              <th width="30%"> Mobile</th>
              <th width="70%">{{ $user->mobile }}</th>
            </tr>
            <tr>
              <th width="30%">Address</th>
              <th width="70%">{{ $user->address }}</th>
            </tr>
             <tr>
              <th width="30%">Teacher Photo</th>
               <td>
                        @if($user->role_id == 1)
                        <img style="width: 80px;height: 100px" class="profile-user-img img-fluid "
                       src="{{(!empty($user->image))?url('upload/adminimage/'.$user->image):url('upload/userimage.png')}}"
                       alt="User profile picture">
                       @elseif($user->role_id == 2)
                        <img style="width: 80px;height: 100px" class="profile-user-img img-fluid "
                       src="{{(!empty($user->image))?url('upload/librarianimage/'.$user->image):url('upload/userimage.png')}}"
                       alt="User profile picture">
                        @elseif($user->role_id == 3)
                        <img style="width: 80px;height: 100px" class="profile-user-img img-fluid "
                       src="{{(!empty($user->image))?url('upload/userimage/'.$user->image):url('upload/userimage.png')}}"
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
$(function () {
  
  $('#myform').validate({
    rules: {

      role_id: {
      required: true,
        
      },
      name: {
        required: true,
        
      },
      mobile2: {
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