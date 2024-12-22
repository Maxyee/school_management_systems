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
              <li class="breadcrumb-item active">Course List</li>
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
                <h5>Course List
                 <button type="button" class="btn btn-warning float-right btn" data-toggle="modal" data-target="#addCourse"><i class="fa fa-plus-circle"></i> Add AcademicCourse</button>
                </h5>
              </div> 
            <div class="card-body">
                <table id="example1" class="table  table-hover table-sm">
                  <thead>
                  <tr style="background-color: #001f3f;color: white">
                    
                     <th>KG</th>
                     <th>Primary</th>
                     <th>High School</th>
                     <th>HSC</th>
                     <th>Degree</th>
                    <th>Honours</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    @foreach($alldata as $key => $course)
            <tr>
                      
                      <td>{!! $course->kg!!}</td>
                      <td>{!!$course->primary!!}</td>
                      <td>{!!$course->high!!}</td>
                      <td>{!!$course->hsc!!}</td>
                     <td>{!!$course->degree!!}</td>
                     <td>{!!$course->honours!!}</td>
                      <td>
                    <button type="button" class="btn btn-dark  btn-xs" data-toggle="modal" data-target="#showCourse-{{ $course->id }}"><i class="fa fa-eye"></i></button>

                     <button type="button" class="btn btn-primary  btn-xs" data-toggle="modal" data-target="#editCourse-{{ $course->id }}"><i class="fa fa-edit"></i></button>
                   
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

  <div class="modal fade" id="addCourse" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Add Course</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.course.store')}}" id="myform" enctype="multipart/form-data">
                @csrf

<div class="row">
                  

                  <div class="form-group col-md-6">
                     <label for="kg"  class="col-sm-12 col-form-label">KG</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="kg" id="title" class="form-control " placeholder="Enter kg" autocomplete="off" value="{{old('kg')}}"></textarea>
                     <font style="color:red">{{($errors)->has('kg')?($errors->first('kg')):''}}</font>
                  </div>
                </div>

                

                  <div class="form-group col-md-6">
                    <label for="primary"  class="col-sm-12 col-form-label">Primary</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="primary" id="description" class="form-control description" placeholder="Enter Insititute primary " autocomplete="off" value="{{old('primary')}}"></textarea>
                      <font style="color:red">{{($errors)->has('primary')?($errors->first('primary')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                    <label for="high"  class="col-sm-12 col-form-label"> High School</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="high" id="puri" class="form-control " placeholder="Enter Insititute high " autocomplete="off" value="{{old('high')}}"></textarea>
                      <font style="color:red">{{($errors)->has('high')?($errors->first('high')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="hsc"  class="col-sm-12 col-form-label">Hsc </label>
                 <div class="col-sm-12">
                    <textarea type="text" name="hsc" id="title" class="form-control title" placeholder="Enter hsc" autocomplete="off" value="{{old('hsc')}}"></textarea>
                     <font style="color:red">{{($errors)->has('hsc')?($errors->first('hsc')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="degree"  class="col-sm-12 col-form-label">Degree</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="degree" id="description" class="form-control description" placeholder="Enter Insititute degree " autocomplete="off" value="{{old('degree')}}"></textarea>
                      <font style="color:red">{{($errors)->has('degree')?($errors->first('degree')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="honours"  class="col-sm-12 col-form-label">honours </label>
                 <div class="col-sm-12">
                    <textarea type="text" name="honours" id="ins" class="form-control " placeholder="Enter honours" autocomplete="off" value="{{old('honours')}}"></textarea>
                     <font style="color:red">{{($errors)->has('honours')?($errors->first('honours')):''}}</font>
                  </div>
                </div>

                
                 

                  

                
       </div>

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success ">Add Academic Course</button>
             
            </div>
            </form>
            </div>
           
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- end Add Category -->
</div>
  <!-- /.content-wrapper -->
@foreach($alldata as $key => $course)
  <div class="modal fade" id="editCourse-{{ $course->id }}" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Edit Course</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.course.update',$course->id)}}" id="myform2" enctype="multipart/form-data">
                @csrf
            <div class="row">
                  

                  <div class="form-group col-md-6">
                     <label for="kg"  class="col-sm-12 col-form-label">Class Routine</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="kg" id="about" class="form-control " placeholder="Enter kg" autocomplete="off" >{{ $course->kg }}</textarea>
                     <font style="color:red">{{($errors)->has('kg')?($errors->first('kg')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="primary"  class="col-sm-12 col-form-label">Online Class Routine</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="primary" id="description" class="form-control description" placeholder="Enter Insititute primary " autocomplete="off" >{{ $course->primary }}</textarea>
                      <font style="color:red">{{($errors)->has('primary')?($errors->first('primary')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="high"  class="col-sm-12 col-form-label">Exam Routine</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="high" id="title" class="form-control title" placeholder="Enter high" autocomplete="off" >{{ $course->high }}</textarea>
                     <font style="color:red">{{($errors)->has('high')?($errors->first('high')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="hsc"  class="col-sm-12 col-form-label">hsc</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="hsc" id="description" class="form-control description" placeholder="Enter Insititute hsc " autocomplete="off" >{{ $course->hsc }}</textarea>
                      <font style="color:red">{{($errors)->has('hsc')?($errors->first('hsc')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="degree"  class="col-sm-12 col-form-label">degree </label>
                 <div class="col-sm-12">
                    <textarea type="text" name="degree" id="ins1" class="form-control " placeholder="Enter degree" autocomplete="off" >{{ $course->degree }}</textarea>
                     <font style="color:red">{{($errors)->has('degree')?($errors->first('degree')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="honours"  class="col-sm-12 col-form-label">honours</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="honours" id="puri1" class="form-control " placeholder="Enter Insititute honours " autocomplete="off" >{{ $course->honours }}</textarea>
                      <font style="color:red">{{($errors)->has('honours')?($errors->first('honours')):''}}</font>
                  </div>
                </div>

                
       </div>
           

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-warning ">Update Academic Course</button>
             
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
@foreach($alldata as $key => $course)
  <div class="modal fade" id="showCourse-{{ $course->id }}" style="display: none;" aria-hidden="true">
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
              <th width="70%">{{ $course->id }}</th>
            </tr>
            <tr>
              <th width="30%"> Name</th>
              <th width="70%">{{ $course->name }}</th>
            </tr>
            <tr>
              <th width="30%">Email</th>
              <th width="70%">{{ $course->email }}</th>
            </tr>
            <tr>
              <th width="30%"> Mobile</th>
              <th width="70%">{{ $course->mobile }}</th>
            </tr>
            <tr>
              <th width="30%">Address</th>
              <th width="70%">{{ $course->address }}</th>
            </tr>
             <tr>
              <th width="30%">Post Photo</th>
               <td>
                        @if($course->role_id == 1)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($course->image))?url('upload/adminimage/'.$course->image):url('upload/postimage.png')}}"
                       alt="post profile picture">
                       @elseif($course->role_id == 2)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($course->image))?url('upload/librarianimage/'.$course->image):url('upload/postimage.png')}}"
                       alt="post profile picture">
                        @elseif($course->role_id == 3)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($course->image))?url('upload/userimage/'.$user->image):url('upload/userimage.png')}}"
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