@extends('layouts.app')
@section('content')
<!-- Content Header (Page header) -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0 text-dark">Website Settings</h1>
      </div><!-- /.col -->
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
          <li class="breadcrumb-item active">Website Settings</li>
        </ol>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>



          <div class="card">
            <div class="card-header">
              <h3 class="card-title"> Website Settings</h3>
            
            </div>
            <!-- /.card-header -->
            <div class="card-body col-lg-12">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h4 class="modal-title">Website Setting</h4>
                       
                      </div>

                      <div class="modal-body">
                         <form action="{{ route('update.websitesetting',$setting->id) }}" method="Post" enctype="multipart/form-data">
                         	@csrf
                           <div class="form-group">
                             <label for="logo">Header Logo Black</label>
                             <input type="file" class="form-control "  aria-describedby="emailHelp" name="logo" >
                           </div>
						                              <div class="form-group">
                             <label for="mobilelogo">Mobile Logo White</label>
                             <input type="file" class="form-control "  aria-describedby="emailHelp" name="mobilelogo" >
                           </div>
						   <div class="form-group">
                             <label for="favicon">Favicon (64X64 PX))</label>
                             <input type="file" class="form-control "  aria-describedby="emailHelp" name="favicon" >
                           </div>
						   						   	<div class="form-group">
                             <label for="upodkahhoimg">Upodokher Images (800X1000 PX)</label>
                             <input type="file" class="form-control "  aria-describedby="emailHelp" name="upodkahhoimg" >
                           </div>
						   						   	<div class="form-group">
                             <label for="oddhakhorimg">Oddokher Images (800X1000 PX)</label>
                             <input type="file" class="form-control "  aria-describedby="emailHelp" name="oddhakhorimg" >
                           </div>
						   	<div class="form-group">
                             <label for="baner1">Baner 1 (1920X751 PX)</label>
                             <input type="file" class="form-control "  aria-describedby="emailHelp" name="baner1" >
                           </div>
						   <div class="form-group">
                             <label for="exampleInputEmail1">Baner 1 Text</label>
                               <textarea class="textarea" placeholder="Place some text here" name="baner1_text" 
                          style="width: 100%; height: 300px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">
                          		{{ $setting->baner1_text }}
                          </textarea>
                           </div>
						   	<div class="form-group">
                             <label for="baner2">Baner 2 (1920X751 PX)</label>
                             <input type="file" class="form-control "  aria-describedby="emailHelp" name="baner2" >
                           </div>
						     <div class="form-group">
                             <label for="exampleInputEmail1">Baner 2 Text</label>
                               <textarea class="textarea" placeholder="Place some text here" name="baner2_text" 
                          style="width: 100%; height: 300px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">
                          		{{ $setting->baner2_text }}
                          </textarea>
                           </div>
						   	<div class="form-group">
                             <label for="baner3">Baner 3 (1920X751 PX)</label>
                             <input type="file" class="form-control "  aria-describedby="emailHelp" name="baner3" >
                           </div>
						    <div class="form-group">
                             <label for="exampleInputEmail1">Baner 3 Text</label>
                               <textarea class="textarea" placeholder="Place some text here" name="baner3_text" 
                          style="width: 100%; height: 300px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">
                          		{{ $setting->baner3_text }}
                          </textarea>
                           </div>
						   						   	<div class="form-group">
                             <label for="baner3">Institute History Images (741X320 PX)</label>
                             <input type="file" class="form-control "  aria-describedby="emailHelp" name="institutehistoryimages" >
                           </div>
						   	<div class="form-group">
                             <label for="exampleInputEmail1">Institute History Name</label>
                             <input type="text" class="form-control " value="{{ $setting->institute_history }}" aria-describedby="emailHelp" name="institute_history" required="">
                           </div>

						   		<div class="form-group">
                             <label for="exampleInputEmail1">Institute History Short</label>
                             <input type="text" class="form-control " value="{{ $setting->institute_info_short }}" aria-describedby="emailHelp" name="institute_info_short" required="">
                           </div>
						   	<div class="form-group">
                             <label for="exampleInputEmail1">Institute History Long</label>
                               <textarea class="textarea" placeholder="Place some text here" name="institute_info_long" 
                          style="width: 100%; height: 300px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">
                          		{{ $setting->institute_info_long }}
                          </textarea>
                           </div>	
						   						   						   	<div class="form-group">
                             <label for="exampleInputEmail1">EIIAN No</label>
                             <input type="text" class="form-control " value="{{ $setting->eiinno }}" aria-describedby="emailHelp" name="eiinno" required="">
                           </div>
						   						   						   	<div class="form-group">
                             <label for="exampleInputEmail1">College Code</label>
                             <input type="text" class="form-control " value="{{ $setting->collegecode }}" aria-describedby="emailHelp" name="collegecode" required="">
                           </div>
						   						   	<div class="form-group">
                             <label for="exampleInputEmail1">Teacher Login Link</label>
                             <input type="text" class="form-control " value="{{ $setting->teacherlogin }}" aria-describedby="emailHelp" name="teacherlogin" required="">
                           </div>
						   						   	<div class="form-group">
                             <label for="exampleInputEmail1">Student Login Link</label>
                             <input type="text" class="form-control " value="{{ $setting->studentlogin }}" aria-describedby="emailHelp" name="studentlogin" required="">
                           </div>
						   	<div class="form-group">
                             <label for="exampleInputEmail1">Result Link</label>
                             <input type="text" class="form-control " value="{{ $setting->resultlink }}" aria-describedby="emailHelp" name="resultlink" required="">
                           </div>
						   						   	<div class="form-group">
                             <label for="exampleInputEmail1">Online Admission Link</label>
                             <input type="text" class="form-control " value="{{ $setting->onlineadmission }}" aria-describedby="emailHelp" name="onlineadmission" required="">
                           </div>
						    <div class="form-group">
                             <label for="exampleInputEmail1">Facebook Page ID</label>
                             <input type="text" class="form-control " value="{{ $setting->facebookpage }}" aria-describedby="emailHelp" name="facebookpage" required="">
                           </div>
                           <div class="form-group">
                             <label for="exampleInputEmail1">Phone Bangla</label>
                             <input type="text" class="form-control " value="{{ $setting->phone_bn }}" aria-describedby="emailHelp" name="phone_bn" required="">
                           </div>
                             <div class="form-group">
                             <label for="exampleInputEmail1">Phone English</label>
                             <input type="text" class="form-control " value="{{ $setting->phone_en }}" aria-describedby="emailHelp" name="phone_en" required="">
                           </div>
                           <div class="form-group">
                             <label for="exampleInputEmail1">Email</label>
                             <input type="text" class="form-control " value="{{ $setting->email }}" aria-describedby="emailHelp" name="email" required="">
                           </div>
                            <div class="form-group">
                             <label for="exampleInputEmail1">Addres Bangle</label>
                              <textarea class="textarea" placeholder="Place some text here" name="address_bn" 
                          style="width: 100%; height: 300px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">
                          	{{ $setting->address_bn }}
                          </textarea>
                           </div>
                            <div class="form-group">
                             <label for="exampleInputEmail1">Address English</label>
                               <textarea class="textarea" placeholder="Place some text here" name="address_en" 
                          style="width: 100%; height: 300px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">
                          		{{ $setting->address_en }}
                          </textarea>
                           </div>

						   	<div class="form-group">
                             <label for="exampleInputEmail1">Terms & Condition</label>
                               <textarea class="textarea" placeholder="Place some text here" name="terms" 
                          style="width: 100%; height: 300px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">
                          		{{ $setting->terms }}
                          </textarea>
                           </div>
						   	<div class="form-group">
                             <label for="exampleInputEmail1">Privacy & Policy</label>
                               <textarea class="textarea" placeholder="Place some text here" name="privacy" 
                          style="width: 100%; height: 300px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">
                          		{{ $setting->privacy }}
                          </textarea>
                           </div>
						   
						      
                           <button type="submit" class="btn btn-success btn-block">Update</button>
                         </form>
                      </div>
                    </div>
            </div>
            <!-- /.card-body -->
          </div>


@endsection