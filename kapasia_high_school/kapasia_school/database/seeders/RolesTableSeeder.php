<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Role;
class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $admin = Role::create(['name'=>'admin']);
        $user = Role::create(['name'=>'user']);
        $teacher = Role::create(['name'=>'teacher']);
        $student = Role::create(['name'=>'student']);
        $suspend = Role::create(['name'=>'suspend']);
    }
}
