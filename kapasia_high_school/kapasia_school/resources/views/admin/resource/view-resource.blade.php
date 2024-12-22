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
              <li class="breadcrumb-item active">Resource List</li>
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
                <h5>Resource List
                 <button type="button" class="btn btn-warning float-right btn" data-toggle="modal" data-target="#addResource"><i class="fa fa-plus-circle"></i> Add Resource</button>
                </h5>
              </div> 
            <div class="card-body">
                <table id="example1" class="table  table-hover table-sm">
                  <thead>
                  <tr style="background-color: #001f3f;color: white">
                    
                    
                     <th>Class Content</th>
                     <th>Library</th>
                     <th>Labrotory</th>
                    <th>Sports Yard</th>
                    <th>Co-Education</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    @foreach($alldata as $key => $resource)
            <tr>
                      
                      <td>{!!$resource->class_content!!}</td>
                      <td>{!!$resource->library!!}</td>
                      <td>{!!$resource->lab!!}</td>
                      <td>{!!$resource->sports_yard!!}</td>
                     
                     <td>{!!$resource->co_education!!}</td>
                      <td>
                    <button type="button" class="btn btn-dark  btn-xs" data-toggle="modal" data-target="#showResource-{{ $resource->id }}"><i class="fa fa-eye"></i></button>

                     <button type="button" class="btn btn-primary  btn-xs" data-toggle="modal" data-target="#editResource-{{ $resource->id }}"><i class="fa fa-edit"></i></button>
                   
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

  <div class="modal fade" id="addResource" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Add Resource</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.resource.store')}}" id="myform" enctype="multipart/form-data">
                @csrf

<div class="row">
                  

                  <div class="form-group col-md-6">
                     <label for="class_content"  class="col-sm-12 col-form-label"> Class Content</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="class_content" id="title" class="form-control " placeholder="Enter class_content" autocomplete="off" value="{{old('class_content')}}"></textarea>
                     <font style="color:red">{{($errors)->has('class_content')?($errors->first('class_content')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="library"  class="col-sm-12 col-form-label"> Library</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="library" id="description" class="form-control description" placeholder="Enter Insititute library " autocomplete="off" value="{{old('library')}}"></textarea>
                      <font style="color:red">{{($errors)->has('library')?($errors->first('library')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="lab"  class="col-sm-12 col-form-label">All Labrotory</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="lab" id="title" class="form-control title" placeholder="Enter lab" autocomplete="off" value="{{old('lab')}}"></textarea>
                     <font style="color:red">{{($errors)->has('lab')?($errors->first('lab')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="sports_yard"  class="col-sm-12 col-form-label">Sports Yard</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="sports_yard" id="description" class="form-control description" placeholder="Enter Insititute sports_yard " autocomplete="off" value="{{old('sports_yard')}}"></textarea>
                      <font style="color:red">{{($errors)->has('sports_yard')?($errors->first('sports_yard')):''}}</font>
                  </div>
                </div>


                 

                  <div class="form-group col-md-6">
                    <label for="co_education"  class="col-sm-12 col-form-label">Co-Education</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="co_education" id="puri" class="form-control " placeholder="Enter Insititute co_education " autocomplete="off" value="{{old('co_education')}}"></textarea>
                      <font style="color:red">{{($errors)->has('co_education')?($errors->first('co_education')):''}}</font>
                  </div>
                </div>

                
       </div>

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success ">Add Resource</button>
             
            </div>
            </form>
            </div>
           
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- end Add Category -->
</div>
  <!-- /.content-wrapper -->
@foreach($alldata as $key => $resource)
  <div class="modal fade" id="editResource-{{ $resource->id }}" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Edit Resource</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.resource.update',$resource->id)}}" id="myform2" enctype="multipart/form-data">
                @csrf
            <div class="row">
                  

                  <div class="form-group col-md-6">
                     <label for="class_content"  class="col-sm-12 col-form-label">Insititute class_content</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="class_content" id="about" class="form-control " placeholder="Enter About" autocomplete="off" >{{ $resource->class_content }}</textarea>
                     <font style="color:red">{{($errors)->has('class_content')?($errors->first('class_content')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="library"  class="col-sm-12 col-form-label">Insititute library</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="library" id="description" class="form-control description" placeholder="Enter Insititute library " autocomplete="off" >{{ $resource->library }}</textarea>
                      <font style="color:red">{{($errors)->has('library')?($errors->first('library')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="lab"  class="col-sm-12 col-form-label">Labrotory</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="lab" id="title" class="form-control title" placeholder="Enter lab" autocomplete="off" >{{ $resource->lab }}</textarea>
                     <font style="color:red">{{($errors)->has('lab')?($errors->first('lab')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="sports_yard"  class="col-sm-12 col-form-label">Sports Yard</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="sports_yard" id="description" class="form-control description" placeholder="Enter Insititute sports_yard " autocomplete="off" >{{ $resource->sports_yard }}</textarea>
                      <font style="color:red">{{($errors)->has('sports_yard')?($errors->first('sports_yard')):''}}</font>
                  </div>
                </div>


                 

                  <div class="form-group col-md-6">
                    <label for="co_education"  class="col-sm-12 col-form-label">Co-Education</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="co_education" id="puri1" class="form-control " placeholder="Enter Insititute co_education " autocomplete="off" >{{ $resource->co_education }}</textarea>
                      <font style="color:red">{{($errors)->has('co_education')?($errors->first('co_education')):''}}</font>
                  </div>
                </div>

                
       </div>
           

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-warning ">Update Resource</button>
             
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
@foreach($alldata as $key => $resource)
  <div class="modal fade" id="showResource-{{ $resource->id }}" style="display: none;" aria-hidden="true">
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
              <th width="70%">{{ $resource->id }}</th>
            </tr>
            <tr>
              <th width="30%"> Name</th>
              <th width="70%">{{ $resource->name }}</th>
            </tr>
            <tr>
              <th width="30%">Email</th>
              <th width="70%">{{ $resource->email }}</th>
            </tr>
            <tr>
              <th width="30%"> Mobile</th>
              <th width="70%">{{ $resource->mobile }}</th>
            </tr>
            <tr>
              <th width="30%">Address</th>
              <th width="70%">{{ $resource->address }}</th>
            </tr>
             <tr>
              <th width="30%">Post Photo</th>
               <td>
                        @if($resource->role_id == 1)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($resource->image))?url('upload/adminimage/'.$resource->image):url('upload/postimage.png')}}"
                       alt="post profile picture">
                       @elseif($resource->role_id == 2)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($resource->image))?url('upload/librarianimage/'.$resource->image):url('upload/postimage.png')}}"
                       alt="post profile picture">
                        @elseif($resource->role_id == 3)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($resource->image))?url('upload/userimage/'.$user->image):url('upload/userimage.png')}}"
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