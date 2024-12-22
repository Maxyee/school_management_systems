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
              <li class="breadcrumb-item active">Post List</li>
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
                <h5>Post List
                 <button type="button" class="btn btn-warning float-right btn" data-toggle="modal" data-target="#addPost"><i class="fa fa-plus-circle"></i> Add Post</button>
                </h5>
              </div> 
            <div class="card-body">
                <table id="example1" class="table  table-hover table-sm">
                  <thead>
                  <tr style="background-color: #001f3f;color: white">
                    <th>SL</th>
                    <th>ID</th>
                     <th>Post Date</th>
                     <th>Title</th>
                     <th>Category</th>
                    <th>Class Name</th>
                    <th>Created By</th>
                    <th>File</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    @foreach($alldata as $key => $post)
            <tr>
                      <td>{{$key+1}}</td>
                      <td>{{$post->id}}</td>
                      <td>{{date('d-M-Y',strtotime($post->post_date))}}</td>
                      <td>{!!$post->title!!}</td>
                      <td>{{$post['category']['category_name']}}</td>
                      <td>{{$post['class_name']['name']}}</td>
                     <td>{{$post['user']['name']}}</td>
                     
                        <td><a target="_blank" href="{{ asset('upload/postfile/'.$post->post_file) }}"><i class="fa fa-file-pdf" style="color:red;font-size:20px"></i></a></td>
                        <td>
                     @if($post->status==1)
                    <span class="badge badge-success">Active</span>
                    @else
                    <span class="badge badge-danger">Inactive</span>
                    @endif
                  </td>
                      <td>
                         @if($post->status==1)
                          <a id="inactive" href="{{route('admin.post.inactive',$post->id)}}" class="btn  btn-warning btn-xs mr-2"> <i class="fa fa-arrow-up"></i></a>
                          @else
                          <a id="active" href="{{route('admin.post.active',$post->id)}}" class="btn btn-success btn-xs mr-2" > <i class="fa fa-arrow-down"></i></a>
                          @endif

                    
                    <button type="button" class="btn btn-dark  btn-xs" data-toggle="modal" data-target="#showPost-{{ $post->id }}"><i class="fa fa-eye"></i></button>

                     <button type="button" class="btn btn-primary  btn-xs" data-toggle="modal" data-target="#editPost-{{ $post->id }}"><i class="fa fa-edit"></i></button>

                    <a title="Delete" id="delete" href="{{route('admin.post.delete',$post->id)}}" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></a>
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

  <div class="modal fade" id="addPost" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Add Post</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.post.store')}}" id="myform" enctype="multipart/form-data">
                @csrf

<div class="row">
                  <div class="form-group col-md-6">
                   {{--  <label for="post_date"  class="col-sm-12 col-form-label">Post Date</label> --}}
                    <div class="col-sm-12">
                    <input type="text" name="post_date" id="datepicker" class="form-control " placeholder="YYYY-MM-DD"  autocomplete="off" value="{{old('post_date')}}">
                    <font style="color:red">{{($errors)->has('post_date')?($errors->first('post_date')):''}}</font>
                  </div>
                </div>

                
                <div class="form-group col-md-6">
                   {{--  <label for="category_id"  class="col-sm-12 col-form-label">Category</label> --}}
                 
                    <select name="category_id" id="category_id" class="form-control select2bs4 " autocomplete="off" value="{{old('category_id')}}">
                      <option value="">Select Category</option>
                    @foreach($categories as $category)
                    <option value="{{$category->id}}">{{$category->category_name}}</option>
                    @endforeach
                    </select>
                     <font style="color:red">{{($errors)->has('category_id')?($errors->first('category_id')):''}}</font>
                  </div>
                   

                   <div class="form-group col-md-6">
                   {{--  <label for="class_id"  class="col-sm-12 col-form-label">Class Name</label> --}}
                  <div class="col-sm-12">
                    <select name="class_id" id="class_id" class="form-control select2bs4 " autocomplete="off" value="{{old('class_id')}}">
                      <option value="">Select Class Name</option>
                    @foreach($classes as $class)
                    <option value="{{$class->id}}">{{$class->name}}</option>
                    @endforeach
                    </select>
                     <font style="color:red">{{($errors)->has('class_id')?($errors->first('class_id')):''}}</font>
                  </div>
                   </div>

                    <div class="form-group col-md-6">
                    {{-- <label for="post_file"  class="col-sm-12 col-form-label">File</label> --}}
                    <div class="col-sm-12">
                      
                    <input type="file" name="post_file" id="post_file" class="form-control" placeholder="Enter File " autocomplete="off" value="{{old('post_file')}}">
                      <font style="color:red">{{($errors)->has('post_file')?($errors->first('post_file')):''}}</font>
                  </div>
                </div>


                  <div class="form-group col-md-6">
                    {{--  <label for="title"  class="col-sm-12 col-form-label">Title</label> --}}
                 <div class="col-sm-12">
                    <textarea type="text" name="title" id="title" class="form-control " placeholder="Enter Title" autocomplete="off" value="{{old('name')}}"></textarea>
                     <font style="color:red">{{($errors)->has('title')?($errors->first('title')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                   {{--  <label for="description"  class="col-sm-12 col-form-label">Description</label> --}}
                    <div class="col-sm-12">
                    <textarea type="text" name="description" id="description" class="form-control description" placeholder="Enter Description " autocomplete="off" value="{{old('description')}}"></textarea>
                      <font style="color:red">{{($errors)->has('description')?($errors->first('description')):''}}</font>
                  </div>
                </div>

                
       </div>

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success ">Add Post</button>
             
            </div>
            </form>
            </div>
           
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- end Add Category -->
</div>
  <!-- /.content-wrapper -->
@foreach($alldata as $key => $post)
  <div class="modal fade" id="editPost-{{ $post->id }}" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Edit Post</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.post.update',$post->id)}}" id="myform2" enctype="multipart/form-data">
                @csrf
            <div class="row"> 
                 <div class="form-group col-md-6">
                    <label for="post_date"  class="col-sm-12 col-form-label">Post Date</label>
                    <div class="col-sm-12">
                    <input type="text" name="post_date" id="datepicker2" class="form-control " placeholder="YYYY-MM-DD" autocomplete="off" value="{{$post->post_date}}">
                    <font style="color:red">{{($errors)->has('post_date')?($errors->first('post_date')):''}}</font>
                  </div>
                </div>

               <div class="form-group col-md-6">
                    <label for="category_id"  class="col-sm-12 col-form-label">Category</label>
                  <div class="col-sm-12">
                    <select name="category_id" id="cat_id" class="form-control select2bs4" autocomplete="off" value="{{old('category_id')}}">
                      <option value="">Select Category</option>
                    @foreach($categories as $category)
                    <option value="{{$category->id}}" {{ $category->id == $post->category_id ?" selected":""}}>{{$category->category_name}}</option>
                    @endforeach
                    </select>
                     <font style="color:red">{{($errors)->has('category_id')?($errors->first('category_id')):''}}</font>
                  </div>
                   </div>



     

                   <div class="form-group col-md-6">
                    <label for="class_id"  class="col-sm-12 col-form-label">Class Name</label>
                  <div class="col-sm-12">
                    <select name="class_id" id="cla_id" class="form-control select2bs4" autocomplete="off" value="{{old('class_id')}}">
                      <option value="">Select Class Name</option>
                    @foreach($classes as $class)
                    <option value="{{$class->id}}"{{ $class->id == $post->class_id ?" selected":""}}>{{$class->name}}</option>
                    @endforeach
                    </select>
                     <font style="color:red">{{($errors)->has('class_id')?($errors->first('class_id')):''}}</font>
                  </div>
                   </div>

                    <div class="form-group col-md-6">
                    <label for="post_file"  class="col-sm-12 col-form-label">File</label>
                    <div class="col-sm-12">
                    <input type="file" name="post_file" id="post_file" class="form-control" placeholder="Enter File " autocomplete="off" >
                      <font style="color:red">{{($errors)->has('post_file')?($errors->first('post_file')):''}}</font>
                  </div>
                </div>
                
              


                  <div class="form-group col-md-6">
                     <label for="title"  class="col-sm-12 col-form-label">Title</label>
                 <div class="col-sm-12">
                     <textarea  name="title" id="title1" class="form-control title" placeholder="Enter title " autocomplete="off" >{{$post->title}}</textarea>
                     <font style="color:red">{{($errors)->has('title')?($errors->first('title')):''}}</font>
                  </div>
                </div>

                 

                 

                  <div class="form-group col-md-6">
                    <label for="description"  class="col-sm-12 col-form-label">Description</label>
                    <div class="col-sm-12">
                    <textarea  name="description" id="description2" class="form-control description" placeholder="Enter Description " autocomplete="off" >{{$post->description}}</textarea>
                      <font style="color:red">{{($errors)->has('description')?($errors->first('description')):''}}</font>
                  </div>
                </div>

   </div>   
           

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-warning ">Update Post</button>
             
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
@foreach($alldata as $key => $post)
  <div class="modal fade" id="showPost-{{ $post->id }}" style="display: none;" aria-hidden="true">
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
              <th width="70%">{{ $post->id }}</th>
            </tr>
            <tr>
              <th width="30%"> Name</th>
              <th width="70%">{{ $post->name }}</th>
            </tr>
            <tr>
              <th width="30%">Email</th>
              <th width="70%">{{ $post->email }}</th>
            </tr>
            <tr>
              <th width="30%"> Mobile</th>
              <th width="70%">{{ $post->mobile }}</th>
            </tr>
            <tr>
              <th width="30%">Address</th>
              <th width="70%">{{ $post->address }}</th>
            </tr>
             <tr>
              <th width="30%">Post Photo</th>
               <td>
                        @if($post->role_id == 1)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($post->image))?url('upload/adminimage/'.$post->image):url('upload/postimage.png')}}"
                       alt="post profile picture">
                       @elseif($post->role_id == 2)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($post->image))?url('upload/librarianimage/'.$post->image):url('upload/postimage.png')}}"
                       alt="post profile picture">
                        @elseif($post->role_id == 3)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($post->image))?url('upload/userimage/'.$user->image):url('upload/userimage.png')}}"
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