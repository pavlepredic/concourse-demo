<?php

namespace Tests\ConcourseDemo;

use PHPUnit\Framework\TestCase;
use ConcourseDemo\Model;

class ModelTest extends TestCase
{
    public function testGetName()
    {
        $model = new Model();
        $this->assertSame(
            'Concourse',
            $model->getName()
        );
    }
}
