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
              <li class="breadcrumb-item active">Front Student List</li>
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
                <h5>Front Student List
                 <button type="button" class="btn btn-warning float-right btn" data-toggle="modal" data-target="#addStudent"><i class="fa fa-plus-circle"></i> Add Front Student</button>
                </h5>
              </div> 
            <div class="card-body">
                <table id="example1" class="table  table-hover table-sm">
                  <thead>
                  <tr style="background-color: #001f3f;color: white">
                    
                    
                     <th>Tution Fee</th>
                     <th>Uniform</th>
                     <th>Exam Management</th>
                     <th>Rules</th>
                    <th>Our Student</th>
                    <th>Student Success</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    @foreach($alldata as $key => $student)
            <tr>
                      
                      <td>{!!$student->tution!!}</td>
                      <td>{!!$student->uniform!!}</td>
                      <td>{!!$student->exam_manage!!}</td>
                      <td>{!!$student->rules!!}</td>
                     <td>{!!$student->our_student!!}</td>
                     <td>{!!$student->student_success!!}</td>
                      <td>
                    <button type="button" class="btn btn-dark  btn-xs" data-toggle="modal" data-target="#showStudent-{{ $student->id }}"><i class="fa fa-eye"></i></button>

                     <button type="button" class="btn btn-primary  btn-xs" data-toggle="modal" data-target="#editStudent-{{ $student->id }}"><i class="fa fa-edit"></i></button>
                   
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

  <div class="modal fade" id="addStudent" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Add Student</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.st.store')}}" id="myform" enctype="multipart/form-data">
                @csrf

<div class="row">
                  

                  <div class="form-group col-md-6">
                     <label for="tution"  class="col-sm-12 col-form-label">Tution Fee</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="tution" id="title" class="form-control " placeholder="Enter About" autocomplete="off" value="{{old('tution')}}"></textarea>
                     <font style="color:red">{{($errors)->has('tution')?($errors->first('tution')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="uniform"  class="col-sm-12 col-form-label"> Uniform</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="uniform" id="description" class="form-control description" placeholder="Enter Insititute uniform " autocomplete="off" value="{{old('uniform')}}"></textarea>
                      <font style="color:red">{{($errors)->has('uniform')?($errors->first('uniform')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="exam_manage"  class="col-sm-12 col-form-label">Exam Management</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="exam_manage" id="title" class="form-control title" placeholder="Enter exam_manage" autocomplete="off" value="{{old('exam_manage')}}"></textarea>
                     <font style="color:red">{{($errors)->has('exam_manage')?($errors->first('exam_manage')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="rules"  class="col-sm-12 col-form-label">Rules</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="rules" id="description" class="form-control description" placeholder="Enter Insititute rules " autocomplete="off" value="{{old('rules')}}"></textarea>
                      <font style="color:red">{{($errors)->has('rules')?($errors->first('rules')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="our_student"  class="col-sm-12 col-form-label">Our Student</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="our_student" id="ins" class="form-control " placeholder="Enter our_student" autocomplete="off" value="{{old('our_student')}}"></textarea>
                     <font style="color:red">{{($errors)->has('our_student')?($errors->first('our_student')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="student_success"  class="col-sm-12 col-form-label">Student Success</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="student_success" id="puri" class="form-control " placeholder="Enter Insititute student_success " autocomplete="off" value="{{old('student_success')}}"></textarea>
                      <font style="color:red">{{($errors)->has('student_success')?($errors->first('student_success')):''}}</font>
                  </div>
                </div>

                
       </div>

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success ">Add Student</button>
             
            </div>
            </form>
            </div>
           
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- end Add Category -->
</div>
  <!-- /.content-wrapper -->
@foreach($alldata as $key => $student)
  <div class="modal fade" id="editStudent-{{ $student->id }}" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Edit Student</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.st.update',$student->id)}}" id="myform2" enctype="multipart/form-data">
                @csrf
            <div class="row">
                  

                  <div class="form-group col-md-6">
                     <label for="tution"  class="col-sm-12 col-form-label"> Tution Fee</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="tution" id="about" class="form-control " placeholder="Enter About" autocomplete="off" >{{ $student->tution }}</textarea>
                     <font style="color:red">{{($errors)->has('tution')?($errors->first('tution')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="uniform"  class="col-sm-12 col-form-label"> Uniform</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="uniform" id="description" class="form-control description" placeholder="Enter Insititute uniform " autocomplete="off" >{{ $student->uniform }}</textarea>
                      <font style="color:red">{{($errors)->has('uniform')?($errors->first('uniform')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="exam_manage"  class="col-sm-12 col-form-label">Exam Management</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="exam_manage" id="title" class="form-control title" placeholder="Enter exam_manage" autocomplete="off" >{{ $student->exam_manage }}</textarea>
                     <font style="color:red">{{($errors)->has('exam_manage')?($errors->first('exam_manage')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="rules"  class="col-sm-12 col-form-label">Rules</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="rules" id="description" class="form-control description" placeholder="Enter Insititute rules " autocomplete="off" >{{ $student->rules }}</textarea>
                      <font style="color:red">{{($errors)->has('rules')?($errors->first('rules')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="our_student"  class="col-sm-12 col-form-label"> Our  Student</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="our_student" id="ins1" class="form-control " placeholder="Enter our_student" autocomplete="off" >{{ $student->our_student }}</textarea>
                     <font style="color:red">{{($errors)->has('our_student')?($errors->first('our_student')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="student_success"  class="col-sm-12 col-form-label">Student Success</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="student_success" id="puri1" class="form-control " placeholder="Enter Insititute student_success " autocomplete="off" >{{ $student->student_success }}</textarea>
                      <font style="color:red">{{($errors)->has('student_success')?($errors->first('student_success')):''}}</font>
                  </div>
                </div>

                
       </div>
           

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-warning ">Update Student</button>
             
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
@foreach($alldata as $key => $student)
  <div class="modal fade" id="showPost-{{ $student->id }}" style="display: none;" aria-hidden="true">
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
              <th width="70%">{{ $student->id }}</th>
            </tr>
            <tr>
              <th width="30%"> Name</th>
              <th width="70%">{{ $student->name }}</th>
            </tr>
            <tr>
              <th width="30%">Email</th>
              <th width="70%">{{ $student->email }}</th>
            </tr>
            <tr>
              <th width="30%"> Mobile</th>
              <th width="70%">{{ $student->mobile }}</th>
            </tr>
            <tr>
              <th width="30%">Address</th>
              <th width="70%">{{ $student->address }}</th>
            </tr>
             <tr>
              <th width="30%">Post Photo</th>
               <td>
                        @if($student->role_id == 1)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($student->image))?url('upload/adminimage/'.$student->image):url('upload/postimage.png')}}"
                       alt="post profile picture">
                       @elseif($student->role_id == 2)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($student->image))?url('upload/librarianimage/'.$student->image):url('upload/postimage.png')}}"
                       alt="post profile picture">
                        @elseif($student->role_id == 3)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($student->image))?url('upload/userimage/'.$user->image):url('upload/userimage.png')}}"
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