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
              <li class="breadcrumb-item active">Paper List</li>
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
                <h5>Paper List
                 <button type="button" class="btn btn-warning float-right btn" data-toggle="modal" data-target="#addPaper"><i class="fa fa-plus-circle"></i> Add Academic Paper</button>
                </h5>
              </div> 
            <div class="card-body">
                <table id="example1" class="table  table-hover table-sm">
                  <thead>
                  <tr style="background-color: #001f3f;color: white">
                    
                    <th>Class Routine</th>
                     <th>Online Class Routine</th>
                     <th>Exam Routine</th>
                     <th>Syllabus</th>
                     <th>Calendar</th>
                    <th>Prospectus</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    @foreach($alldata as $key => $paper)
            <tr>
                      
                      <td>{!! $paper->class_routine!!}</td>
                      <td>{!!$paper->online_class_routine!!}</td>
                      <td>{!!$paper->exam_routine!!}</td>
                      <td>{!!$paper->syllabus!!}</td>
                     <td>{!!$paper->calendar!!}</td>
                     <td>{!!$paper->prospectus!!}</td>
                      <td>
                    <button type="button" class="btn btn-dark  btn-xs" data-toggle="modal" data-target="#showPaper-{{ $paper->id }}"><i class="fa fa-eye"></i></button>

                     <button type="button" class="btn btn-primary  btn-xs" data-toggle="modal" data-target="#editPaper-{{ $paper->id }}"><i class="fa fa-edit"></i></button>
                   
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

  <div class="modal fade" id="addPaper" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Add Paper</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.paper.store')}}" id="myform" enctype="multipart/form-data">
                @csrf

<div class="row">
                  

                  <div class="form-group col-md-6">
                     <label for="class_routine"  class="col-sm-12 col-form-label">Class Routine</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="class_routine" id="title" class="form-control " placeholder="Enter class_routine" autocomplete="off" value="{{old('class_routine')}}"></textarea>
                     <font style="color:red">{{($errors)->has('class_routine')?($errors->first('class_routine')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="online_class_routine"  class="col-sm-12 col-form-label"> Online Class Routine</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="online_class_routine" id="description" class="form-control description" placeholder="Enter Insititute online_class_routine " autocomplete="off" value="{{old('online_class_routine')}}"></textarea>
                      <font style="color:red">{{($errors)->has('online_class_routine')?($errors->first('online_class_routine')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                    <label for="exam_routine"  class="col-sm-12 col-form-label"> Exam Routine</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="exam_routine" id="puri" class="form-control " placeholder="Enter Insititute exam_routine " autocomplete="off" value="{{old('exam_routine')}}"></textarea>
                      <font style="color:red">{{($errors)->has('exam_routine')?($errors->first('exam_routine')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="syllabus"  class="col-sm-12 col-form-label">Syllabus </label>
                 <div class="col-sm-12">
                    <textarea type="text" name="syllabus" id="title" class="form-control title" placeholder="Enter syllabus" autocomplete="off" value="{{old('syllabus')}}"></textarea>
                     <font style="color:red">{{($errors)->has('syllabus')?($errors->first('syllabus')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="calendar"  class="col-sm-12 col-form-label">Calendar</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="calendar" id="description" class="form-control description" placeholder="Enter Insititute calendar " autocomplete="off" value="{{old('calendar')}}"></textarea>
                      <font style="color:red">{{($errors)->has('calendar')?($errors->first('calendar')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="prospectus"  class="col-sm-12 col-form-label">Prospectus </label>
                 <div class="col-sm-12">
                    <textarea type="text" name="prospectus" id="ins" class="form-control " placeholder="Enter prospectus" autocomplete="off" value="{{old('prospectus')}}"></textarea>
                     <font style="color:red">{{($errors)->has('prospectus')?($errors->first('prospectus')):''}}</font>
                  </div>
                </div>

                
                 

                  

                
       </div>

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success ">Add Academic Paper</button>
             
            </div>
            </form>
            </div>
           
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- end Add Category -->
</div>
  <!-- /.content-wrapper -->
@foreach($alldata as $key => $paper)
  <div class="modal fade" id="editPaper-{{ $paper->id }}" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Edit Paper</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.paper.update',$paper->id)}}" id="myform2" enctype="multipart/form-data">
                @csrf
            <div class="row">
                  

                  <div class="form-group col-md-6">
                     <label for="class_routine"  class="col-sm-12 col-form-label">Class Routine</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="class_routine" id="about" class="form-control " placeholder="Enter class_routine" autocomplete="off" >{{ $paper->class_routine }}</textarea>
                     <font style="color:red">{{($errors)->has('class_routine')?($errors->first('class_routine')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="online_class_routine"  class="col-sm-12 col-form-label">Online Class Routine</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="online_class_routine" id="description" class="form-control description" placeholder="Enter Insititute online_class_routine " autocomplete="off" >{{ $paper->online_class_routine }}</textarea>
                      <font style="color:red">{{($errors)->has('online_class_routine')?($errors->first('online_class_routine')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="exam_routine"  class="col-sm-12 col-form-label">Exam Routine</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="exam_routine" id="title" class="form-control title" placeholder="Enter exam_routine" autocomplete="off" >{{ $paper->exam_routine }}</textarea>
                     <font style="color:red">{{($errors)->has('exam_routine')?($errors->first('exam_routine')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="syllabus"  class="col-sm-12 col-form-label">Syllabus</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="syllabus" id="description" class="form-control description" placeholder="Enter Insititute syllabus " autocomplete="off" >{{ $paper->syllabus }}</textarea>
                      <font style="color:red">{{($errors)->has('syllabus')?($errors->first('syllabus')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="calendar"  class="col-sm-12 col-form-label">Calendar </label>
                 <div class="col-sm-12">
                    <textarea type="text" name="calendar" id="ins1" class="form-control " placeholder="Enter calendar" autocomplete="off" >{{ $paper->calendar }}</textarea>
                     <font style="color:red">{{($errors)->has('calendar')?($errors->first('calendar')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="prospectus"  class="col-sm-12 col-form-label">Prospectus</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="prospectus" id="puri1" class="form-control " placeholder="Enter Insititute prospectus " autocomplete="off" >{{ $paper->prospectus }}</textarea>
                      <font style="color:red">{{($errors)->has('prospectus')?($errors->first('prospectus')):''}}</font>
                  </div>
                </div>

                
       </div>
           

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-warning ">Update Academic Paper</button>
             
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
@foreach($alldata as $key => $paper)
  <div class="modal fade" id="showpaper-{{ $paper->id }}" style="display: none;" aria-hidden="true">
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
              <th width="70%">{{ $paper->id }}</th>
            </tr>
            <tr>
              <th width="30%"> Name</th>
              <th width="70%">{{ $paper->name }}</th>
            </tr>
            <tr>
              <th width="30%">Email</th>
              <th width="70%">{{ $paper->email }}</th>
            </tr>
            <tr>
              <th width="30%"> Mobile</th>
              <th width="70%">{{ $paper->mobile }}</th>
            </tr>
            <tr>
              <th width="30%">Address</th>
              <th width="70%">{{ $paper->address }}</th>
            </tr>
             <tr>
              <th width="30%">Post Photo</th>
               <td>
                        @if($paper->role_id == 1)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($paper->image))?url('upload/adminimage/'.$paper->image):url('upload/postimage.png')}}"
                       alt="post profile picture">
                       @elseif($paper->role_id == 2)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($paper->image))?url('upload/librarianimage/'.$paper->image):url('upload/postimage.png')}}"
                       alt="post profile picture">
                        @elseif($paper->role_id == 3)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($paper->image))?url('upload/userimage/'.$user->image):url('upload/userimage.png')}}"
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