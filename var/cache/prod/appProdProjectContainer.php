<?php

// This file has been auto-generated by the Symfony Dependency Injection Component for internal use.

if (\class_exists(\ContainerVbbentx\appProdProjectContainer::class, false)) {
    // no-op
} elseif (!include __DIR__.'/ContainerVbbentx/appProdProjectContainer.php') {
    touch(__DIR__.'/ContainerVbbentx.legacy');

    return;
}

if (!\class_exists(appProdProjectContainer::class, false)) {
    \class_alias(\ContainerVbbentx\appProdProjectContainer::class, appProdProjectContainer::class, false);
}

return new \ContainerVbbentx\appProdProjectContainer([
    'container.build_hash' => 'Vbbentx',
    'container.build_id' => '99ce6c17',
    'container.build_time' => 1670588391,
], __DIR__.\DIRECTORY_SEPARATOR.'ContainerVbbentx');
