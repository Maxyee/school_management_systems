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
              <li class="breadcrumb-item active">Contact List</li>
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
                <h5>Contact List
                
                </h5>
              </div> 
            <div class="card-body">
                <table id="example1" class="table  table-hover table-sm">
                  <thead>
                  <tr style="background-color: #001f3f;color: white">
                    
                    
                     <th>Address</th>
                     <th>Email</th>
                     <th>Mobile</th>
                     <th>Phone</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    @foreach($alldata as $key => $contact)
            <tr>
                      
                      <td>{{ $contact->address}}</td>
                      <td>{{ $contact->email}}</td>
                      <td>{{$contact->mobile}}</td>
                      <td>{{  $contact->phone}}</td>
                      <td>
                   

                     <button type="button" class="btn btn-primary  btn-xs" data-toggle="modal" data-target="#editContact-{{ $contact->id }}"><i class="fa fa-edit"></i></button>

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


  <!-- /.content-wrapper -->
@foreach($alldata as $key => $contact)
  <div class="modal fade" id="editContact-{{ $contact->id }}" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-lg">
          <div class="modal-content"style="background-color:#d9dad6;border-bottom: 5px solid #605ca8 ;">
            <div class="modal-header " style="background-color: #605ca8;color: white;padding: 10px">
              <h4 class="modal-title">Edit Contact</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
            <form method="post" action="{{route('admin.contact.update',$contact->id)}}" id="myform2" enctype="multipart/form-data">
                @csrf
            <div class="row">
                  

                  <div class="form-group col-md-6">
                    <label for="address"  class="col-sm-12 col-form-label">Address</label>
                    <div class="col-sm-12">
                    <input type="text" name="address" id="address" class="form-control " placeholder="Enter Address"  autocomplete="off" value="{{$contact->address}}">
                    <font style="color:red">{{($errors)->has('address')?($errors->first('address')):''}}</font>
                  </div>
                </div>

                <div class="form-group col-md-6">
                    <label for="email"  class="col-sm-12 col-form-label">Email</label>
                    <div class="col-sm-12">
                    <input type="email" name="email" id="email" class="form-control " placeholder="Enter Email"  autocomplete="off" value="{{$contact->email}}">
                    <font style="color:red">{{($errors)->has('email')?($errors->first('email')):''}}</font>
                  </div>
                </div>

                
                 

                <div class="form-group col-md-6">
                    <label for="mobile"  class="col-sm-12 col-form-label">Mobile</label>
                    <div class="col-sm-12">
                    <input type="text" name="mobile" id="mobile" class="form-control " placeholder="Enter Mobile"  autocomplete="off" value="{{$contact->mobile}}">
                    <font style="color:red">{{($errors)->has('mobile')?($errors->first('mobile')):''}}</font>
                  </div>
                </div>

               



               <div class="form-group col-md-6">
                    <label for="phone"  class="col-sm-12 col-form-label">Phone</label>
                    <div class="col-sm-12">
                    <input type="text"  name="phone" id="phone" class="form-control " placeholder="Enter Phone " autocomplete="off" value="{{ $contact->phone }}">
                      <font style="color:red">{{($errors)->has('phone')?($errors->first('phone')):''}}</font>
                  </div>
                </div>

                <div class="form-group col-md-6">
                    <label for="map"  class="col-sm-12 col-form-label">Map Link</label>
                    <div class="col-sm-12">
                    <input type="text"  name="map" id="map" class="form-control " placeholder="Enter Map Link" autocomplete="off" value="{{ $contact->map }}">
                      <font style="color:red">{{($errors)->has('map')?($errors->first('map')):''}}</font>
                  </div>
                </div>

                
       </div>
           

              <div class="modal-footer ">
                 <button type="button" class="btn btn-danger "  data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-warning ">Update Academic Contact</button>
             
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

      address: {
      required: true,
        
      },
      map: {
        required: true,
        
      },
      phone: {
        required: true,
        
      },
      mobile: {
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