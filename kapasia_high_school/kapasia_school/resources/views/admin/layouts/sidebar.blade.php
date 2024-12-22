 <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="https://www.elitedesign.com.bd" class="brand-link">
      <img src="{{ asset('backend') }}/dist/img/elite.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">Elite design</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img class="profile-user-img img-fluid img-circle"
                       src="{{(!empty(Auth::user()->image))?url('upload/adminimage/'.Auth::user()->image):url('upload/userimage.png')}}"
                       alt="User profile picture" style="width: 50px;height: 50px">
        </div>
        <div class="info">
          <a href="{{ route('admin.profiles.view') }}" class="d-block">{{ Auth::user()->name}}</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
     {{--  <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div> --}}

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

            <li class="nav-item">
            <a href="{{ route('admin.dashboard') }}" class="nav-link {{ request()->is('admin/dashboard') ? 'active' : '' }}">
              <i class="nav-icon fas fa-tachometer-alt mr-2"></i>
              <p>
                Dashboard
                
              </p>
            </a>
          </li>

         
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
         {{--  <li class="nav-item {{ request()->is('admin/user-list') ? 'menu-open' : '' }}">
            <a href="#" class="nav-link {{ request()->is('admin/user-list') ? 'active' : '' }}">
              <i class="fa fa-user " style="margin-right:5px"></i>
              <p>
                User Section
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{ route('user.list') }}" class="nav-link {{ request()->is('admin/user-list') ? 'active' : '' }}">
                  <i class="fa fa-users" style="margin-right:5px"></i>
                  <p>User List</p>
                </a>
              </li>
            </ul>
          </li> --}}

          <li class="nav-item">
            <a href="{{ route('admin.teacher.view') }}" class="nav-link {{ request()->is('admin/teacher/view') ? 'active' : '' }}">
              <i class="fas fa-chalkboard-teacher mr-2"></i>
              <p>
                Teacher Manage
               
              </p>
            </a>
          </li>
              <li class="nav-item">
            <a href="{{ route('admin.student.view') }}" class="nav-link {{ request()->is('admin/student/view') ? 'active' : '' }}">
              <i class="fa fa-graduation-cap mr-2"></i>
              <p>
                Student Manage
               
              </p>
            </a>
          </li>
            <li class="nav-item">
            <a href="{{ route('admin.category.view') }}" class="nav-link {{ request()->is('admin/category/view') ? 'active' : '' }}">
              <i class="fa fa-certificate mr-2"></i>
              <p>
                Category Manage
               
              </p>
            </a>
          </li>
           <li class="nav-item">
            <a href="{{ route('admin.studentclass.view') }}" class="nav-link {{ request()->is('admin/student/class/view') ? 'active' : '' }}">
              <i class="fas fa-archway mr-2"></i>
              <p>
                Student Class
               
              </p>
            </a>
          </li>
           <li class="nav-item">
            <a href="{{ route('admin.post.view') }}" class="nav-link {{ request()->is('admin/post/view') ? 'active' : '' }}">
              <i class="fa fa-paper-plane mr-2"></i>
              <p>
               Notice & Post Manage
               
              </p>
            </a>
          </li>
           <li class="nav-item">
            <a href="{{ route('admin.campus.view') }}" class="nav-link {{ request()->is('admin/campus/view') ? 'active' : '' }}">
              <i class="fas fa-campground mr-2"></i>
              <p>
                Campus Manage
               
              </p>
            </a>
          </li>

           <li class="nav-item">
            <a href="{{ route('admin.academic.view') }}" class="nav-link {{ request()->is('admin/academic/view') ? 'active' : '' }}">
              <i class="fas fa-place-of-worship mr-2"></i>
              <p>
                Academic Manage
               
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{ route('admin.admission.view') }}" class="nav-link {{ request()->is('admin/admission/view') ? 'active' : '' }}">
              <i class="fas fa-university mr-2"></i>
              <p>
                Admission Manage
               
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{ route('admin.paper.view') }}" class="nav-link {{ request()->is('admin/paper/view') ? 'active' : '' }}">
              <i class="fa fa-file-word mr-2"></i>
              <p>
                Academic Paper Manage
               
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{ route('admin.principal.view') }}" class="nav-link {{ request()->is('admin/principal/view') ? 'active' : '' }}">
              <i class="fa fa-header mr-2"></i>
              <p>
                Principal Manage
               
              </p>
            </a>
          </li>

           <li class="nav-item">
            <a href="{{ route('admin.st.view') }}" class="nav-link {{ request()->is('admin/st/view') ? 'active' : '' }}">
              <i class="fas fa-user-graduate mr-2"></i>
              <p>
                Front Student Manage
               
              </p>
            </a>
          </li>

           <li class="nav-item">
            <a href="{{ route('admin.resource.view') }}" class="nav-link {{ request()->is('admin/resource/view') ? 'active' : '' }}">
              <i class="fa fa-soundcloud mr-2"></i>
              <p>
                Resource Manage
               
              </p>
            </a>
          </li>

          <li class="nav-item">
            <a href="{{ route('admin.course.view') }}" class="nav-link {{ request()->is('admin/course/view') ? 'active' : '' }}">
              <i class="fas fa-concierge-bell mr-2"></i>
              <p>
                Course Manage
               
              </p>
            </a>
          </li>
            <li class="nav-item">
            <a href="{{ route('admin.photo.view') }}" class="nav-link {{ request()->is('admin/photo/view') ? 'active' : '' }}">
              <i class="fas fa-images mr-2"></i>
              <p>
                Photo Gallery
               
              </p>
            </a>
          </li>
            <li class="nav-item">
            <a href="{{ route('admin.video.view') }}" class="nav-link {{ request()->is('admin/video/view') ? 'active' : '' }}">
              <i class="fa fa-video mr-2"></i>
              <p>
                Video Gallery
               
              </p>
            </a>
          </li>

          <li class="nav-item">
            <a href="{{ route('admin.contact.view') }}" class="nav-link {{ request()->is('admin/contact/view') ? 'active' : '' }}">
              <i class="fa fa-phone mr-2"></i>
              <p>
                Contact
               
              </p>
            </a>
          </li>
           <li class="nav-item">
            <a href="{{ route('admin.slider.view') }}" class="nav-link {{ request()->is('admin/slider/view') ? 'active' : '' }}">
              <i class="fas fa-x-ray mr-2"></i>
              <p>
                Slider
               
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{ route('admin.setting.view') }}" class="nav-link {{ request()->is('admin/setting/view') ? 'active' : '' }}">
              <i class="fas fa-cogs mr-2"></i>
              <p>
                Settings
               
              </p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>