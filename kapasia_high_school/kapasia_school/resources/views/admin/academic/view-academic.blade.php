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
              <li class="breadcrumb-item active">Academic List</li>
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
                <h5>Academic List
                 <button type="button" class="btn btn-warning float-right btn" data-toggle="modal" data-target="#addAcademic"><i class="fa fa-plus-circle"></i> Add Academic</button>
                </h5>
              </div> 
            <div class="card-body">
                <table id="example1" class="table  table-hover table-sm">
                  <thead>
                  <tr style="background-color: #001f3f;color: white">
                    
                    <th>Founder</th>
                     <th>Principal</th>
                     <th>Vice Principal</th>
                     <th>Teacher</th>
                     <th>Office Stuff</th>
                    <th>Office Assistant</th>
                    
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    @foreach($alldata as $key => $academic)
            <tr>
                      
                      <td>{!!$academic->founder!!}</td>
                      <td>{!!$academic->principal!!}</td>
                      <td>{!!$academic->vp!!}</td>
                      <td>{!!$academic->teacher!!}</td>
                     <td>{!!$academic->office!!}</td>
                     <td>{!!$academic->helper!!}</td>
                      <td>
                    <button type="button" class="btn btn-dark  btn-xs" data-toggle="modal" data-target="#showAcademic-{{ $academic->id }}"><i class="fa fa-eye"></i></button>

                     <button type="button" class="btn btn-primary  btn-xs" data-toggle="modal" data-target="#editAcademic-{{ $academic->id }}"><i class="fa fa-edit"></i></button>
                   
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

  <div class="modal fade" id="addAcademic" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Add Academic</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.academic.store')}}" id="myform" enctype="multipart/form-data">
                @csrf

<div class="row">
                  

                  <div class="form-group col-md-6">
                     <label for="founder"  class="col-sm-12 col-form-label">Insititute Founder</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="founder" id="title" class="form-control " placeholder="Enter Founder" autocomplete="off" value="{{old('founder')}}"></textarea>
                     <font style="color:red">{{($errors)->has('founder')?($errors->first('founder')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="principal"  class="col-sm-12 col-form-label"> Principal</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="principal" id="description" class="form-control description" placeholder="Enter Insititute principal " autocomplete="off" value="{{old('principal')}}"></textarea>
                      <font style="color:red">{{($errors)->has('principal')?($errors->first('principal')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                    <label for="vp"  class="col-sm-12 col-form-label">Vice Principal</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="vp" id="puri" class="form-control " placeholder="Enter Insititute vp " autocomplete="off" value="{{old('vp')}}"></textarea>
                      <font style="color:red">{{($errors)->has('vp')?($errors->first('vp')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="teacher"  class="col-sm-12 col-form-label">Teacher </label>
                 <div class="col-sm-12">
                    <textarea type="text" name="teacher" id="title" class="form-control title" placeholder="Enter teacher" autocomplete="off" value="{{old('teacher')}}"></textarea>
                     <font style="color:red">{{($errors)->has('teacher')?($errors->first('teacher')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="office"  class="col-sm-12 col-form-label">Office Stuff</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="office" id="description" class="form-control description" placeholder="Enter Insititute office " autocomplete="off" value="{{old('office')}}"></textarea>
                      <font style="color:red">{{($errors)->has('office')?($errors->first('office')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="helper"  class="col-sm-12 col-form-label">Office Assistant Stuff</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="helper" id="ins" class="form-control " placeholder="Enter helper" autocomplete="off" value="{{old('helper')}}"></textarea>
                     <font style="color:red">{{($errors)->has('helper')?($errors->first('helper')):''}}</font>
                  </div>
                </div>

                
                 

                  

                
       </div>

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success ">Add Academic</button>
             
            </div>
            </form>
            </div>
           
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- end Add Category -->
</div>
  <!-- /.content-wrapper -->
@foreach($alldata as $key => $academic)
  <div class="modal fade" id="editAcademic-{{ $academic->id }}" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Edit Academic</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.academic.update',$academic->id)}}" id="myform2" enctype="multipart/form-data">
                @csrf
            <div class="row">
                  

                  <div class="form-group col-md-6">
                     <label for="founder"  class="col-sm-12 col-form-label">Founder</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="founder" id="about" class="form-control " placeholder="Enter founder" autocomplete="off" >{{ $academic->founder }}</textarea>
                     <font style="color:red">{{($errors)->has('founder')?($errors->first('founder')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="principal"  class="col-sm-12 col-form-label">Principal</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="principal" id="description" class="form-control description" placeholder="Enter Insititute principal " autocomplete="off" >{{ $academic->principal }}</textarea>
                      <font style="color:red">{{($errors)->has('principal')?($errors->first('principal')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="vp"  class="col-sm-12 col-form-label">Vice-Principal</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="vp" id="title" class="form-control title" placeholder="Enter vp" autocomplete="off" >{{ $academic->vp }}</textarea>
                     <font style="color:red">{{($errors)->has('vp')?($errors->first('vp')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="teacher"  class="col-sm-12 col-form-label">Teacher</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="teacher" id="description" class="form-control description" placeholder="Enter Insititute teacher " autocomplete="off" >{{ $academic->teacher }}</textarea>
                      <font style="color:red">{{($errors)->has('teacher')?($errors->first('teacher')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="office"  class="col-sm-12 col-form-label">Office Stuff</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="office" id="ins1" class="form-control " placeholder="Enter office" autocomplete="off" >{{ $academic->office }}</textarea>
                     <font style="color:red">{{($errors)->has('office')?($errors->first('office')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="helper"  class="col-sm-12 col-form-label">Office Assistant Stuff</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="helper" id="puri1" class="form-control " placeholder="Enter Insititute helper " autocomplete="off" >{{ $academic->helper }}</textarea>
                      <font style="color:red">{{($errors)->has('helper')?($errors->first('helper')):''}}</font>
                  </div>
                </div>

                
       </div>
           

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-warning ">Update Academic</button>
             
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
@foreach($alldata as $key => $academic)
  <div class="modal fade" id="showAcademic-{{ $academic->id }}" style="display: none;" aria-hidden="true">
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
              <th width="70%">{{ $academic->id }}</th>
            </tr>
            <tr>
              <th width="30%"> Name</th>
              <th width="70%">{{ $academic->name }}</th>
            </tr>
            <tr>
              <th width="30%">Email</th>
              <th width="70%">{{ $academic->email }}</th>
            </tr>
            <tr>
              <th width="30%"> Mobile</th>
              <th width="70%">{{ $academic->mobile }}</th>
            </tr>
            <tr>
              <th width="30%">Address</th>
              <th width="70%">{{ $academic->address }}</th>
            </tr>
             <tr>
              <th width="30%">Post Photo</th>
               <td>
                        @if($academic->role_id == 1)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($academic->image))?url('upload/adminimage/'.$academic->image):url('upload/postimage.png')}}"
                       alt="post profile picture">
                       @elseif($academic->role_id == 2)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($academic->image))?url('upload/librarianimage/'.$academic->image):url('upload/postimage.png')}}"
                       alt="post profile picture">
                        @elseif($academic->role_id == 3)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($academic->image))?url('upload/userimage/'.$user->image):url('upload/userimage.png')}}"
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