<?php

// This file has been auto-generated by the Symfony Dependency Injection Component for internal use.

if (\class_exists(\Container2hltqay\appDevDebugProjectContainer::class, false)) {
    // no-op
} elseif (!include __DIR__.'/Container2hltqay/appDevDebugProjectContainer.php') {
    touch(__DIR__.'/Container2hltqay.legacy');

    return;
}

if (!\class_exists(appDevDebugProjectContainer::class, false)) {
    \class_alias(\Container2hltqay\appDevDebugProjectContainer::class, appDevDebugProjectContainer::class, false);
}

return new \Container2hltqay\appDevDebugProjectContainer([
    'container.build_hash' => '2hltqay',
    'container.build_id' => '89997bf1',
    'container.build_time' => 1672389771,
], __DIR__.\DIRECTORY_SEPARATOR.'Container2hltqay');
