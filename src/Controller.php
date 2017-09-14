<?php

namespace ConcourseDemo;

class Controller
{
    public function run()
    {
        $model = new Model();
        return sprintf('%s rocks!', $model->getName());
    }
}
