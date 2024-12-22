@extends('admin.layouts.index')

@section('content')

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row ">
          <div class="col-sm-6">
            <h1 class="m-0">Admin Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
              <li class="breadcrumb-item active">Admin Dashboard</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
	<marquee behavior="scroll" direction="left">আমাদের স্কুল ম্যানেজমেন্ট ওয়েব সাইট ও সফটওয়্যারে আপনাকে স্বাগতম।যেকোন ধরনের আইটি সেবা পেতে আমাদের হট-লাইন নাম্বারে কল করুনঃ ০১৭৭৫৪৫৭০০৮ । আমাদের হোয়াটস অ্যাপ নাম্বারঃ 01775457008 (Whats App)</marquee>

    <!-- /.content-header -->
@php
  $post=DB::table('posts')->get();
  $class=DB::table('student_classes')->get();
  $campus=DB::table('campuses')->get();
  $photo=DB::table('photos')->get();
  $video=DB::table('videos')->get();
  $course=DB::table('courses')->get();
  $slide=DB::table('sliders')->get();
  $academic=DB::table('academics')->get();
@endphp
<!-- Main content -->
<section class="content">
  <div class="container-fluid">
    <!-- Small boxes (Stat box) -->
    <div class="row">
      <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-info">
          <div class="inner">
            <h3>{{ count($post) }}</h3>

            <p>Posts</p>
          </div>
          <div class="icon">
            <i class="ion ion-bag"></i>
          </div>
        </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-success">
          <div class="inner">
            <h3>{{ count($class) }}</h3>

            <p>Student Class</p>
          </div>
          <div class="icon">
            <i class="ion ion-stats-bars"></i>
          </div>
        </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-warning">
          <div class="inner">
            <h3>{{ count($campus) }}</h3>

            <p>Campus List</p>
          </div>
          <div class="icon">
            <i class="ion ion-person-add"></i>
          </div>
         </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-danger">
          <div class="inner">
            <h3>{{ count($photo) }}</h3>

            <p>Totall Photo Gallery</p>
          </div>
          <div class="icon">
            <i class="ion ion-pie-graph"></i>
          </div>
         </div>
      </div>
      <!-- ./col -->
    </div>
    <!-- /.row -->
    <div class="row">
      <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-info">
          <div class="inner">
            <h3>{{ count($video) }}</h3>

            <p>Video Gallery</p>
          </div>
          <div class="icon">
            <i class="ion ion-bag"></i>
          </div>
		  </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-success">
          <div class="inner">
            <h3>{{ count($photo) }}</h3>

            <p>Totall Course</p>
          </div>
          <div class="icon">
            <i class="ion ion-stats-bars"></i>
          </div>
		  </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-warning">
          <div class="inner">
            <h3>{{ count($slide) }}</h3>

            <p>Totall Sliders</p>
          </div>
          <div class="icon">
            <i class="ion ion-person-add"></i>
          </div>
        </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-danger">
          <div class="inner">
            <h3>{{ count($academic) }}</h3>

            <p>Academic</p>
          </div>
          <div class="icon">
            <i class="ion ion-pie-graph"></i>
          </div>
         </div>
      </div>
      <!-- ./col -->
    </div>
    <!-- /.row -->
     
      <!-- right col -->
    </div>
    <!-- /.row (main row) -->
  </div><!-- /.container-fluid -->
</section>

@endsection