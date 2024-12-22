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
              <li class="breadcrumb-item active">Setting List</li>
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
                <h5>Setting List
                  @if($alldata['0']==null)
                 <button type="button" class="btn btn-warning float-right btn" data-toggle="modal" data-target="#addsetting"><i class="fa fa-plus-circle"></i> Add Setting</button>
                 @endif
                </h5>
              </div> 
            <div class="card-body">
                <table id="example1" class="table  table-hover table-sm">
                  <thead>
                  <tr style="background-color: #001f3f;color: white">
                     <th>College Name</th>
                     <th>Email</th>
                     <th>Mobile</th>
                     <th>Address</th>
                     <th>Status</th>
                     <th>Logo</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    @foreach($alldata as $key => $setting)
            <tr>
                      <td>{{ $setting->college_name}}</td>
                      <td>{{ $setting->email}}</td>
                      <td>{{ $setting->mobile}}</td>
                      <td>{{ $setting->address}}</td>
                         <td>
                     @if($setting->status==1)
                    <span class="badge badge-success">Active</span>
                    @else
                    <span class="badge badge-danger">Inactive</span>
                    @endif
                  </td>
                     <td><a target="_blank" href="{{ asset('upload/settingimage/'.$setting->logo) }}"><img class="profile-user-img " src="{{(!empty($setting->logo))?url('upload/settingimage/'.$setting->logo):url('upload/usernoimage.png')}}" style="width:40px;height: 45;" alt="User profile picture"></a></td>
                      
                  
                  <td>
                        @if($setting->status==1)
                          <a id="inactive" href="{{route('admin.setting.inactive',$setting->id)}}" class="btn  btn-warning btn-xs mr-2"> <i class="fa fa-arrow-up"></i></a>
                          @else
                          <a id="active" href="{{route('admin.setting.active',$setting->id)}}" class="btn btn-success btn-xs mr-2" > <i class="fa fa-arrow-down"></i></a>
                          @endif
                    <button type="button" class="btn btn-dark  btn-xs" data-toggle="modal" data-target="#showsetting-{{ $setting->id }}"><i class="fa fa-eye"></i></button>

                     <button type="button" class="btn btn-primary  btn-xs" data-toggle="modal" data-target="#editsetting-{{ $setting->id }}"><i class="fa fa-edit"></i></button>

                     <a title="Delete" id="delete" href="{{route('admin.setting.delete',$setting->id)}}" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></a>
                   
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

  <div class="modal fade" id="addsetting" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-lg">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Add Setting</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.setting.store')}}" id="myform" enctype="multipart/form-data">
                @csrf

<div class="row">
                  <div class="form-group col-md-6">
                    <label for="college_name"  class="col-sm-12 col-form-label">College Name</label>
                    <div class="col-sm-12">
                    <input type="text" name="college_name" id="setting_college_name" class="form-control " placeholder="Enter College Name"  autocomplete="off" value="{{old('college_name')}}">
                    <font style="color:red">{{($errors)->has('college_name')?($errors->first('college_name')):''}}</font>
                  </div>
                </div>

                <div class="form-group col-md-6">
                    <label for="email"  class="col-sm-12 col-form-label">College Email</label>
                    <div class="col-sm-12">
                    <input type="text" name="email" id="setting_email" class="form-control " placeholder="Enter College Email"  autocomplete="off" value="{{old('email')}}">
                    <font style="color:red">{{($errors)->has('email')?($errors->first('email')):''}}</font>
                  </div>
                </div>

                <div class="form-group col-md-6">
                    <label for="mobile"  class="col-sm-12 col-form-label">College Mobile</label>
                    <div class="col-sm-12">
                    <input type="text" name="mobile" id="setting_mobile" class="form-control " placeholder="Enter College Mobile"  autocomplete="off" value="{{old('mobile')}}">
                    <font style="color:red">{{($errors)->has('mobile')?($errors->first('mobile')):''}}</font>
                  </div>
                </div>

                 <div class="form-group col-md-6">
                    <label for="address"  class="col-sm-12 col-form-label">College Address</label>
                    <div class="col-sm-12">
                    <input type="text" name="address" id="address" class="form-control " placeholder="Enter College Address"  autocomplete="off" value="{{old('address')}}">
                    <font style="color:red">{{($errors)->has('address')?($errors->first('address')):''}}</font>
                  </div>
                </div>

                <div class="form-group col-md-6">
                    <label for="slogan"  class="col-sm-12 col-form-label">College Slogan</label>
                    <div class="col-sm-12">
                    <input type="text" name="slogan" id="slogan" class="form-control " placeholder="Enter College Slogan"  autocomplete="off" value="{{old('slogan')}}">
                    <font style="color:red">{{($errors)->has('slogan')?($errors->first('slogan')):''}}</font>
                  </div>
                </div>


               

                 <div class="form-group col-md-6">
                    <label for="logo"  class="col-sm-12 col-form-label">Logo</label>
                    <div class="col-sm-12">
                        <img id="showimage" src="{{(empty($setting->logo))?url('backend/settingimage/'.$setting->logo):url('upload/usernoimage.jpg')}}" style="width: 40px;height: 45px;border:1px solid #000;">
                    <input type="file" name="logo" id="logo" class="form-control" placeholder="Enter Image " autocomplete="off" value="{{old('logo')}}">
                      <font style="color:red">{{($errors)->has('logo')?($errors->first('logo')):''}}</font>
                  </div>
                </div>

                
       </div>

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success ">Add setting</button>
             
            </div>
            </form>
            </div>
           
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- end Add Category -->
</div>
  <!-- /.content-wrapper -->
@foreach($alldata as $key => $setting)
  <div class="modal fade" id="editsetting-{{ $setting->id }}" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-lg">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Edit Setting</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.setting.update',$setting->id)}}" id="myform2" enctype="multipart/form-data">
                @csrf
            <div class="row">
                  

                  <div class="form-group col-md-6">
                    <label for="college_name"  class="col-sm-12 col-form-label">College Name</label>
                    <div class="col-sm-12">
                    <input type="text" name="college_name" id="setting_college_name" class="form-control " placeholder="Enter College Name"  autocomplete="off" value="{{$setting->college_name}}">
                    <font style="color:red">{{($errors)->has('college_name')?($errors->first('college_name')):''}}</font>
                  </div>
                </div>

                <div class="form-group col-md-6">
                    <label for="email"  class="col-sm-12 col-form-label">College Email</label>
                    <div class="col-sm-12">
                    <input type="text" name="email" id="setting_email" class="form-control " placeholder="Enter College Email"  autocomplete="off" value="{{$setting->email}}">
                    <font style="color:red">{{($errors)->has('email')?($errors->first('email')):''}}</font>
                  </div>
                </div>

                <div class="form-group col-md-6">
                    <label for="mobile"  class="col-sm-12 col-form-label">College Mobile</label>
                    <div class="col-sm-12">
                    <input type="text" name="mobile" id="setting_mobile" class="form-control " placeholder="Enter College Mobile"  autocomplete="off" value="{{$setting->mobile}}">
                    <font style="color:red">{{($errors)->has('mobile')?($errors->first('mobile')):''}}</font>
                  </div>
                </div>

                 <div class="form-group col-md-6">
                    <label for="address"  class="col-sm-12 col-form-label">College Address</label>
                    <div class="col-sm-12">
                    <input type="text" name="address" id="address" class="form-control " placeholder="Enter College Address"  autocomplete="off" value="{{$setting->address}}">
                    <font style="color:red">{{($errors)->has('address')?($errors->first('address')):''}}</font>
                  </div>
                </div>
				                 <div class="form-group col-md-6">
                    <label for="meta_description"  class="col-sm-12 col-form-label">Meta description</label>
                    <div class="col-sm-12">
                    <input type="text" name="meta_description" id="meta_description" class="form-control " placeholder="Enter Meta Description"  autocomplete="off" value="{{$setting->meta_description}}">
                    <font style="color:red">{{($errors)->has('meta_description')?($errors->first('meta_description')):''}}</font>
                  </div>
                </div>
				
								                 <div class="form-group col-md-6">
                    <label for="meta_keywords"  class="col-sm-12 col-form-label">Meta Keywords</label>
                    <div class="col-sm-12">
                    <input type="text" name="meta_keywords" id="meta_keywords" class="form-control " placeholder="Enter Meta Keywords"  autocomplete="off" value="{{$setting->meta_keywords}}">
                    <font style="color:red">{{($errors)->has('meta_keywords')?($errors->first('meta_keywords')):''}}</font>
                  </div>
                </div>
												                 <div class="form-group col-md-6">
                    <label for="facebook"  class="col-sm-12 col-form-label">Facebook Page Link</label>
                    <div class="col-sm-12">
                    <input type="text" name="facebook" id="facebook" class="form-control " placeholder="Your Facebook Page URL"  autocomplete="off" value="{{$setting->facebook}}">
                    <font style="color:red">{{($errors)->has('facebook')?($errors->first('facebook')):''}}</font>
                  </div>
                </div>
												                 <div class="form-group col-md-6">
                    <label for="youtube"  class="col-sm-12 col-form-label">Youtube Chanel Link</label>
                    <div class="col-sm-12">
                    <input type="text" name="youtube" id="youtube" class="form-control " placeholder="Your Youtube chanel Link"  autocomplete="off" value="{{$setting->youtube}}">
                    <font style="color:red">{{($errors)->has('youtube')?($errors->first('youtube')):''}}</font>
                  </div>
                </div>
												                 <div class="form-group col-md-6">
                    <label for="teacher_login"  class="col-sm-12 col-form-label">Teacher Login Link</label>
                    <div class="col-sm-12">
                    <input type="text" name="teacher_login" id="teacher_login" class="form-control " placeholder="Teacher login Link"  autocomplete="off" value="{{$setting->teacher_login}}">
                    <font style="color:red">{{($errors)->has('teacher_login')?($errors->first('teacher_login')):''}}</font>
                  </div>
                </div>
												                 <div class="form-group col-md-6">
                    <label for="student_login"  class="col-sm-12 col-form-label">Student Login Link</label>
                    <div class="col-sm-12">
                    <input type="text" name="student_login" id="student_login" class="form-control " placeholder="Student Login Link"  autocomplete="off" value="{{$setting->student_login}}">
                    <font style="color:red">{{($errors)->has('student_login')?($errors->first('student_login')):''}}</font>
                  </div>
                </div>
				
																                 <div class="form-group col-md-6">
                    <label for="admit_card"  class="col-sm-12 col-form-label">Admit Card Link</label>
                    <div class="col-sm-12">
                    <input type="text" name="admit_card" id="admit_card" class="form-control " placeholder="Admit Link"  autocomplete="off" value="{{$setting->admit_card}}">
                    <font style="color:red">{{($errors)->has('admit_card')?($errors->first('admit_card')):''}}</font>
                  </div>
                </div>
				
																				                 <div class="form-group col-md-6">
                    <label for="result"  class="col-sm-12 col-form-label">Result Link</label>
                    <div class="col-sm-12">
                    <input type="text" name="result" id="result" class="form-control " placeholder="Result Link"  autocomplete="off" value="{{$setting->result}}">
                    <font style="color:red">{{($errors)->has('result')?($errors->first('result')):''}}</font>
                  </div>
                </div>
				
																								                 <div class="form-group col-md-6">
                    <label for="certificate"  class="col-sm-12 col-form-label">Certificate Link</label>
                    <div class="col-sm-12">
                    <input type="text" name="certificate" id="certificate" class="form-control " placeholder="Certificate Link"  autocomplete="off" value="{{$setting->certificate}}">
                    <font style="color:red">{{($errors)->has('certificate')?($errors->first('certificate')):''}}</font>
                  </div>
                </div>
				
																												                 <div class="form-group col-md-6">
                    <label for="admission_link"  class="col-sm-12 col-form-label">Admission Link</label>
                    <div class="col-sm-12">
                    <input type="text" name="admission_link" id="admission_link" class="form-control " placeholder="Admission Link"  autocomplete="off" value="{{$setting->admission_link}}">
                    <font style="color:red">{{($errors)->has('admission_link')?($errors->first('admission_link')):''}}</font>
                  </div>
                </div>

                <div class="form-group col-md-6">
                    <label for="slogan"  class="col-sm-12 col-form-label">College Slogan</label>
                    <div class="col-sm-12">
                    <input type="text" name="slogan" id="slogan" class="form-control " placeholder="Enter College Slogan"  autocomplete="off" value="{{$setting->slogan}}">
                    <font style="color:red">{{($errors)->has('slogan')?($errors->first('slogan')):''}}</font>
                  </div>
                </div>

             

                 <div class="form-group col-md-6">
                    <label for="logo"  class="col-sm-12 col-form-label">Logo</label>
                    <div class="col-sm-12">
                        <img id="showimage2" src="{{(!empty($setting->logo))?url('upload/settingimage/'.$setting->logo):url('upload/usernoimage.jpg')}}" style="width: 40px;height: 45px;border:1px solid #000;">
                    <input type="file" name="logo" id="logo" class="form-control" placeholder="Enter Image " autocomplete="off" value="{{$setting->logo}}">
                      <font style="color:red">{{($errors)->has('logo')?($errors->first('logo')):''}}</font>
                  </div>
                </div>


                
       </div>
           

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success ">Update setting</button>
             
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
@foreach($alldata as $key => $setting)
  <div class="modal fade" id="showsetting-{{ $setting->id }}" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-small">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title"> setting Details</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
           
           <table class="table table-bordered table-hover table-sm" >
            <tr>
              <th width="30%">setting ID</th>
              <th width="70%">{{ $setting->id }}</th>
            </tr>
            <tr>
              <th width="30%"> setting Title</th>
              <th width="70%">{{ $setting->title }}</th>
            </tr>
            
             <tr>
              <th width="30%"> setting</th>
               <td><a target="_blank" href="{{ asset('upload/settingimage/'.$setting->logo) }}"><img class="profile-user-img " src="{{(!empty($setting->logo))?url('upload/settinglogo/'.$setting->logo):url('upload/usernoimage.png')}}" style="width:120px;height: 150;" alt="User profile picture"></a></td>
                      <td>
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
  @endsection