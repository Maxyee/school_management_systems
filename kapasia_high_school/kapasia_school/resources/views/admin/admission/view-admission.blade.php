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
              <li class="breadcrumb-item active">Admission List</li>
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
                <h5>Admission List
                 <button type="button" class="btn btn-warning float-right btn" data-toggle="modal" data-target="#addAdmission"><i class="fa fa-plus-circle"></i> Add Admission</button>
                </h5>
              </div> 
            <div class="card-body">
                <table id="example1" class="table  table-hover table-sm">
                  <thead>
                  <tr style="background-color: #001f3f;color: white">
                    
                    <th>Apply System</th>
                     <th>Admission Exam</th>
                     <th>Admission Rule</th>
                     <th>Registration</th>
                     <th>Curricullam</th>
                    <th>Semister</th>
                    
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    @foreach($alldata as $key => $admission)
            <tr>
                      
                      <td>{!!$admission->apply!!}</td>
                      <td>{!!$admission->admission_exam!!}</td>
                      <td>{!!$admission->admission_rule!!}</td>
                      <td>{!!$admission->registration!!}</td>
                     <td>{!!$admission->curricullam!!}</td>
                     <td>{!!$admission->semister!!}</td>
                      <td>
                    <button type="button" class="btn btn-dark  btn-xs" data-toggle="modal" data-target="#showAdmission-{{ $admission->id }}"><i class="fa fa-eye"></i></button>

                     <button type="button" class="btn btn-primary  btn-xs" data-toggle="modal" data-target="#editAdmission-{{ $admission->id }}"><i class="fa fa-edit"></i></button>
                   
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

  <div class="modal fade" id="addAdmission" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Add Admission</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.admission.store')}}" id="myform" enctype="multipart/form-data">
                @csrf

<div class="row">
                  

                  <div class="form-group col-md-6">
                     <label for="apply"  class="col-sm-12 col-form-label">Apply System</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="apply" id="title" class="form-control " placeholder="Enter apply" autocomplete="off" value="{{old('apply')}}"></textarea>
                     <font style="color:red">{{($errors)->has('apply')?($errors->first('apply')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="admission_exam"  class="col-sm-12 col-form-label"> Admission Exam</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="admission_exam" id="description" class="form-control description" placeholder="Enter Insititute admission_exam " autocomplete="off" value="{{old('admission_exam')}}"></textarea>
                      <font style="color:red">{{($errors)->has('admission_exam')?($errors->first('admission_exam')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                    <label for="admission_rule"  class="col-sm-12 col-form-label">Admission Rule</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="admission_rule" id="puri" class="form-control " placeholder="Enter Insititute admission_rule " autocomplete="off" value="{{old('admission_rule')}}"></textarea>
                      <font style="color:red">{{($errors)->has('admission_rule')?($errors->first('admission_rule')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="registration"  class="col-sm-12 col-form-label">Registration </label>
                 <div class="col-sm-12">
                    <textarea type="text" name="registration" id="title" class="form-control title" placeholder="Enter registration" autocomplete="off" value="{{old('registration')}}"></textarea>
                     <font style="color:red">{{($errors)->has('registration')?($errors->first('registration')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="curricullam"  class="col-sm-12 col-form-label">Curricullam</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="curricullam" id="description" class="form-control description" placeholder="Enter Insititute curricullam " autocomplete="off" value="{{old('curricullam')}}"></textarea>
                      <font style="color:red">{{($errors)->has('curricullam')?($errors->first('curricullam')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="semister"  class="col-sm-12 col-form-label">Semister</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="semister" id="ins" class="form-control " placeholder="Enter semister" autocomplete="off" value="{{old('semister')}}"></textarea>
                     <font style="color:red">{{($errors)->has('semister')?($errors->first('semister')):''}}</font>
                  </div>
                </div>

                
                 

                  

                
       </div>

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success ">Add Admission</button>
             
            </div>
            </form>
            </div>
           
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- end Add Category -->
</div>
  <!-- /.content-wrapper -->
@foreach($alldata as $key => $admission)
  <div class="modal fade" id="editAdmission-{{ $admission->id }}" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Edit Admission</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.admission.update',$admission->id)}}" id="myform2" enctype="multipart/form-data">
                @csrf
            <div class="row">
                  

                  <div class="form-group col-md-6">
                     <label for="apply"  class="col-sm-12 col-form-label">Apply Admission</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="apply" id="about" class="form-control " placeholder="Enter apply" autocomplete="off" >{{ $admission->apply }}</textarea>
                     <font style="color:red">{{($errors)->has('apply')?($errors->first('apply')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="admission_exam"  class="col-sm-12 col-form-label">Admission Exam</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="admission_exam" id="description" class="form-control description" placeholder="Enter Insititute admission_exam " autocomplete="off" >{{ $admission->admission_exam }}</textarea>
                      <font style="color:red">{{($errors)->has('admission_exam')?($errors->first('admission_exam')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="admission_rule"  class="col-sm-12 col-form-label">Admission Rule</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="admission_rule" id="title" class="form-control title" placeholder="Enter admission_rule" autocomplete="off" >{{ $admission->admission_rule }}</textarea>
                     <font style="color:red">{{($errors)->has('admission_rule')?($errors->first('admission_rule')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="registration"  class="col-sm-12 col-form-label">Registration</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="registration" id="description" class="form-control description" placeholder="Enter Insititute registration " autocomplete="off" >{{ $admission->registration }}</textarea>
                      <font style="color:red">{{($errors)->has('registration')?($errors->first('registration')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="curricullam"  class="col-sm-12 col-form-label">Curricullam</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="curricullam" id="ins1" class="form-control " placeholder="Enter curricullam" autocomplete="off" >{{ $admission->curricullam }}</textarea>
                     <font style="color:red">{{($errors)->has('curricullam')?($errors->first('curricullam')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="semister"  class="col-sm-12 col-form-label">Semister</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="semister" id="puri1" class="form-control " placeholder="Enter Insititute semister " autocomplete="off" >{{ $admission->semister }}</textarea>
                      <font style="color:red">{{($errors)->has('semister')?($errors->first('semister')):''}}</font>
                  </div>
                </div>

                
       </div>
           

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-warning ">Update Admission</button>
             
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
@foreach($alldata as $key => $admission)
  <div class="modal fade" id="showAdmission-{{ $admission->id }}" style="display: none;" aria-hidden="true">
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
              <th width="70%">{{ $admission->id }}</th>
            </tr>
            <tr>
              <th width="30%"> Name</th>
              <th width="70%">{{ $admission->name }}</th>
            </tr>
            <tr>
              <th width="30%">Email</th>
              <th width="70%">{{ $admission->email }}</th>
            </tr>
            <tr>
              <th width="30%"> Mobile</th>
              <th width="70%">{{ $admission->mobile }}</th>
            </tr>
            <tr>
              <th width="30%">Address</th>
              <th width="70%">{{ $admission->address }}</th>
            </tr>
             <tr>
              <th width="30%">Post Photo</th>
               <td>
                        @if($admission->role_id == 1)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($admission->image))?url('upload/adminimage/'.$admission->image):url('upload/postimage.png')}}"
                       alt="post profile picture">
                       @elseif($admission->role_id == 2)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($admission->image))?url('upload/librarianimage/'.$admission->image):url('upload/postimage.png')}}"
                       alt="post profile picture">
                        @elseif($admission->role_id == 3)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($admission->image))?url('upload/userimage/'.$user->image):url('upload/userimage.png')}}"
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