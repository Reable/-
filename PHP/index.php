<?php

namespace App;

class FileManager
{
    private static $instance;

    private function __construct()
    {
    }

    public static function getInstance(): FileManager
    {
        if (!self::$instance) {
            self::$instance = new self();
        }

        return self::$instance;
    }

    private function __clone()
    {
    }

    private function __wakeup()
    {
    }

    private array $allowedExtensions = ['jpg','jpeg','png','gif'];

    public function handle() : void
    {
        try {
            $root = $_SERVER['DOCUMENT_ROOT'];
            $dir = $_GET['dir'] ?? '';
            $path = $root . $dir;

            if (strpos(realpath($path), $root) !== 0) {
                throw new \Exception('Access denied');
            }
            
            $arFiles = array_filter(scandir($path), fn($file) => $this->isImageOrDirectory($path . '/' . $file));
            $this->output($arFiles, $dir);
        } catch(\Exception $e) {
            die($e->getMessage());
        }
    }

    private function isImageOrDirectory(string $file) : bool
    {
        return is_dir($file) || $this->isImage($file);
    }

    private function isImage(string $file): bool
    {
        return preg_match('/\.('.implode('|', $this->allowedExtensions).')$/i', $file);
    }

    private function output(array $arFiles, string $dir) : void
    {
        echo '<h2>Файловый менеджер</h2>';
        echo '<ul>';
        foreach ($arFiles as $file) {
            if ($file == '.' || $file == '..') continue;
            
            if($this->isImage($file)){
                echo '<li><a target="_blank" href="' . $dir . '/' . $file.'">' . $file . '</a></li>';
            } else {
                echo '<li><a href="?dir=' . urlencode($dir . '/' . $file) . '">' . $file . '</a></li>';
            }
        }
        echo '</ul>';
    }

}

\App\FileManager::getInstance()->handle();

