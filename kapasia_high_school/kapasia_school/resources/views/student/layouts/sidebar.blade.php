 <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{ route('student.dashboard') }}" class="brand-link">
      <img src="{{ asset('backend') }}/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img class="profile-user-img img-fluid img-circle"
                       src="{{(!empty(Auth::user()->image))?url('upload/studentimage/'.Auth::user()->image):url('upload/userimage.png')}}"
                       alt="User profile picture" style="width: 50px;height: 50px">
        </div>
        <div class="info">
          <a href="{{ route('student.profiles.view') }}" class="d-block">{{ Auth::user()->name}}</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

            <li class="nav-item">
            <a href="{{ route('student.dashboard') }}" class="nav-link {{ request()->is('student/dashboard') ? 'active' : '' }}">
              <i class="nav-icon fas fa-tachometer-alt "style="margin-right:5px"></i>
              <p>
                Dashboard
                
              </p>
            </a>
          </li>
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
        {{--   <li class="nav-item {{ request()->is('admin/user-list') ? 'menu-open' : '' }}">
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
          {{-- <li class="nav-item">
            <a href="{{ route('admin.teacher.view') }}" class="nav-link {{ request()->is('teacher-view') ? 'active' : '' }}">
              <i class="nav-icon fas fa-th"></i>
              <p>
                Teacher Manage
               
              </p>
            </a>
          </li>
              <li class="nav-item">
            <a href="{{ route('admin.student.view') }}" class="nav-link {{ request()->is('student-view') ? 'active' : '' }}">
              <i class="nav-icon fas fa-th"></i>
              <p>
                Student Manage
               
              </p>
            </a>
          </li> --}}
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>