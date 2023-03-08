    <?php

    // suppression de la table

    $sql = array();

    $sql[] = 'DROP TABLE IF EXISTS `' . _DB_PREFIX_ . 'fournisseurs_infos`';

    foreach ($sql as $query) {
        if (Db::getInstance()->execute($query) == false) {
            return false;
        }
    }
