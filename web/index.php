<?php

require __DIR__ . '/../vendor/autoload.php';

$twig = new Twig_Environment(new Twig_Loader_Filesystem(__DIR__ . '/../src/view/'));

$controller = new \ConcourseDemo\Controller($twig);
echo $controller->run();
