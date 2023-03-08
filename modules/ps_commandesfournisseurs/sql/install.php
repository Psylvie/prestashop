    <?php

    // Creation de la table en base de données

    $sql = array();

    $sql[] = 'CREATE TABLE IF NOT EXISTS `' . _DB_PREFIX_ . 'fournisseurs_infos` (
        `id_supplier` int(10) UNSIGNED NOT NULL,
        `name` varchar(64) NOT NULL,
        `mail` varchar(64)  NULL,
        `delai` int (10)  NULL,
        `franco_port` float DEFAULT NULL,
        `frais_de_port` float DEFAULT NULL,
        `delai_paiement` int (10) NULL,
        PRIMARY KEY  (`id_supplier`)
    ) ENGINE=' . _MYSQL_ENGINE_ . ' DEFAULT CHARSET=utf8;';

    foreach ($sql as $query) {
        if (Db::getInstance()->execute($query) == false) {
            return false;
        }
    }
