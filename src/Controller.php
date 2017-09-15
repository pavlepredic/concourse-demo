<?php

namespace ConcourseDemo;

class Controller
{
    /**
     * @var \Twig_Environment
     */
    private $twig;

    public function __construct(\Twig_Environment $twig)
    {
        $this->twig = $twig;
    }


    public function run()
    {
        $model = new Model();
        return $this->twig->render('index.html.twig', [
            'name' => $model->getName(),
            'title' => $model->getName(),
        ]);
    }
}
