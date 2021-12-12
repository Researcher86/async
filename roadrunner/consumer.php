<?php

use Spiral\Goridge\RPC\RPC;
use Spiral\RoadRunner\Jobs\Jobs;

require __DIR__ . '/vendor/autoload.php';

// Jobs service
$jobs = new Jobs(RPC::create('tcp://127.0.0.1:6001'));

// Select "test" queue from jobs
$queue = $jobs->connect('test');

// Create task prototype with default headers
$prototype = $queue->create('echo')
    ->withHeader('attempts', 4)
    ->withHeader('retry-delay', 10)
;

// Execute "echo" task with Closure as payload
$task = $queue->dispatch(
    $prototype->withValue(static fn($arg) => print $arg)
);

var_dump($task->getId() . ' has been queued');