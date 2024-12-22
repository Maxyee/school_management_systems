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
              <li class="breadcrumb-item active">Campus List</li>
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
                <h5>Campus List
                 <button type="button" class="btn btn-warning float-right btn" data-toggle="modal" data-target="#addCampus"><i class="fa fa-plus-circle"></i> Add Campus</button>
                </h5>
              </div> 
            <div class="card-body">
                <table id="example1" class="table  table-hover table-sm">
                  <thead>
                  <tr style="background-color: #001f3f;color: white">
                    
                    
                     <th>About</th>
                     <th>History</th>
                     <th>Structure</th>
                     <th>Mission Vission</th>
                    <th>Infrastructure</th>
                    <th>Purification</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    @foreach($alldata as $key => $campus)
            <tr>
                      
                      <td>{!!$campus->about!!}</td>
                      <td>{!!$campus->history!!}</td>
                      <td>{!!$campus->mv!!}</td>
                      <td>{!!$campus->structure!!}</td>
                     <td>{!!$campus->infrastructure!!}</td>
                     <td>{!!$campus->purification!!}</td>
                      <td>
                    <button type="button" class="btn btn-dark  btn-xs" data-toggle="modal" data-target="#showCampus-{{ $campus->id }}"><i class="fa fa-eye"></i></button>

                     <button type="button" class="btn btn-primary  btn-xs" data-toggle="modal" data-target="#editCampus-{{ $campus->id }}"><i class="fa fa-edit"></i></button>
                   
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

  <div class="modal fade" id="addCampus" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Add Campus</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.campus.store')}}" id="myform" enctype="multipart/form-data">
                @csrf

<div class="row">
                  

                  <div class="form-group col-md-6">
                     <label for="about"  class="col-sm-12 col-form-label">Insititute About</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="about" id="title" class="form-control " placeholder="Enter About" autocomplete="off" value="{{old('about')}}"></textarea>
                     <font style="color:red">{{($errors)->has('about')?($errors->first('about')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="history"  class="col-sm-12 col-form-label">Insititute History</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="history" id="description" class="form-control description" placeholder="Enter Insititute History " autocomplete="off" value="{{old('history')}}"></textarea>
                      <font style="color:red">{{($errors)->has('history')?($errors->first('history')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="mv"  class="col-sm-12 col-form-label">Insititute Mision Vission</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="mv" id="title" class="form-control title" placeholder="Enter mv" autocomplete="off" value="{{old('mv')}}"></textarea>
                     <font style="color:red">{{($errors)->has('mv')?($errors->first('mv')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="structure"  class="col-sm-12 col-form-label">Insititute Structure</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="structure" id="description" class="form-control description" placeholder="Enter Insititute Structure " autocomplete="off" value="{{old('structure')}}"></textarea>
                      <font style="color:red">{{($errors)->has('structure')?($errors->first('structure')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="infrastructure"  class="col-sm-12 col-form-label">Insititute Infrastructure</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="infrastructure" id="ins" class="form-control " placeholder="Enter Infrastructure" autocomplete="off" value="{{old('infrastructure')}}"></textarea>
                     <font style="color:red">{{($errors)->has('infrastructure')?($errors->first('infrastructure')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="purification"  class="col-sm-12 col-form-label">Insititute Purification</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="purification" id="puri" class="form-control " placeholder="Enter Insititute Purification " autocomplete="off" value="{{old('purification')}}"></textarea>
                      <font style="color:red">{{($errors)->has('purification')?($errors->first('purification')):''}}</font>
                  </div>
                </div>

                
       </div>

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success ">Add Campus</button>
             
            </div>
            </form>
            </div>
           
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- end Add Category -->
</div>
  <!-- /.content-wrapper -->
@foreach($alldata as $key => $campus)
  <div class="modal fade" id="editCampus-{{ $campus->id }}" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Edit Campus</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.campus.update',$campus->id)}}" id="myform2" enctype="multipart/form-data">
                @csrf
            <div class="row">
                  

                  <div class="form-group col-md-6">
                     <label for="about"  class="col-sm-12 col-form-label">Insititute About</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="about" id="about" class="form-control " placeholder="Enter About" autocomplete="off" >{{ $campus->about }}</textarea>
                     <font style="color:red">{{($errors)->has('about')?($errors->first('about')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="history"  class="col-sm-12 col-form-label">Insititute History</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="history" id="description" class="form-control description" placeholder="Enter Insititute History " autocomplete="off" >{{ $campus->history }}</textarea>
                      <font style="color:red">{{($errors)->has('history')?($errors->first('history')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="mv"  class="col-sm-12 col-form-label">Insititute Mision Vission</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="mv" id="title" class="form-control title" placeholder="Enter mv" autocomplete="off" >{{ $campus->mv }}</textarea>
                     <font style="color:red">{{($errors)->has('mv')?($errors->first('mv')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="structure"  class="col-sm-12 col-form-label">Insititute Structure</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="structure" id="description" class="form-control description" placeholder="Enter Insititute Structure " autocomplete="off" >{{ $campus->structure }}</textarea>
                      <font style="color:red">{{($errors)->has('structure')?($errors->first('structure')):''}}</font>
                  </div>
                </div>


                <div class="form-group col-md-6">
                     <label for="infrastructure"  class="col-sm-12 col-form-label">Insititute Infrastructure</label>
                 <div class="col-sm-12">
                    <textarea type="text" name="infrastructure" id="ins1" class="form-control " placeholder="Enter Infrastructure" autocomplete="off" >{{ $campus->infrastructure }}</textarea>
                     <font style="color:red">{{($errors)->has('infrastructure')?($errors->first('infrastructure')):''}}</font>
                  </div>
                </div>

                
                 

                  <div class="form-group col-md-6">
                    <label for="purification"  class="col-sm-12 col-form-label">Insititute Purification</label>
                    <div class="col-sm-12">
                    <textarea type="text" name="purification" id="puri1" class="form-control " placeholder="Enter Insititute Purification " autocomplete="off" >{{ $campus->purification }}</textarea>
                      <font style="color:red">{{($errors)->has('purification')?($errors->first('purification')):''}}</font>
                  </div>
                </div>

                
       </div>
           

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-warning ">Update Campus</button>
             
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
@foreach($alldata as $key => $campus)
  <div class="modal fade" id="showPost-{{ $campus->id }}" style="display: none;" aria-hidden="true">
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
              <th width="70%">{{ $campus->id }}</th>
            </tr>
            <tr>
              <th width="30%"> Name</th>
              <th width="70%">{{ $campus->name }}</th>
            </tr>
            <tr>
              <th width="30%">Email</th>
              <th width="70%">{{ $campus->email }}</th>
            </tr>
            <tr>
              <th width="30%"> Mobile</th>
              <th width="70%">{{ $campus->mobile }}</th>
            </tr>
            <tr>
              <th width="30%">Address</th>
              <th width="70%">{{ $campus->address }}</th>
            </tr>
             <tr>
              <th width="30%">Post Photo</th>
               <td>
                        @if($campus->role_id == 1)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($campus->image))?url('upload/adminimage/'.$campus->image):url('upload/postimage.png')}}"
                       alt="post profile picture">
                       @elseif($campus->role_id == 2)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($campus->image))?url('upload/librarianimage/'.$campus->image):url('upload/postimage.png')}}"
                       alt="post profile picture">
                        @elseif($campus->role_id == 3)
                        <img style="width: 80px;height: 100px" class="profile-post-img img-fluid "
                       src="{{(!empty($campus->image))?url('upload/userimage/'.$user->image):url('upload/userimage.png')}}"
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