<?php

namespace App\Models;

use CodeIgniter\Model;

class Inclure extends Model
{
    protected $table = 'INCLURE';

    protected $useAutoIncrement = false;

    protected $returnType     = 'array';
    protected $useSoftDeletes = false;

    protected $allowedFields = ['id_user', 'id_reunion'];
}
