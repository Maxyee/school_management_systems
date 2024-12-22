<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Hash;
use App\Models\User;
class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $admin = User::create([
            'user_id' => 'admin',
            'role_id' => 1,
            'name' => 'Ahmed Sagor',
            'email' => 'admin@gmail.com',
            'password' => Hash::make('12345678'),
        ]);

        $user = User::create([
            'user_id' => 'user',
            'role_id' => 2,
            'name' => 'Afridi Ahmed',
            'email' => 'user@gmail.com',
            'password' => Hash::make('12345678'),
        ]);

         $teacher = User::create([
            'user_id' => 'teacher',
            'role_id' => 3,
            'name' => 'Teacher',
            'email' => 'teacher@gmail.com',
            'password' => Hash::make('12345678'),
        ]);

        $student = User::create([
            'user_id' => 'student',
            'role_id' => 4,
            'name' => 'Student',
            'email' => 'student@gmail.com',
            'password' => Hash::make('12345678'),
        ]);
    }
}
