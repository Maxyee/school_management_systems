<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sts', function (Blueprint $table) {
            $table->id();
             $table->longtext('tution')->nullable();
            $table->longtext('uniform')->nullable();
            $table->longtext('exam_manage')->nullable();
            $table->longtext('rules')->nullable();
            $table->longtext('our_student')->nullable();
            $table->longtext('student_success')->nullable();
            $table->integer('created_by')->nullable();
            $table->integer('updated_by')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sts');
    }
}
