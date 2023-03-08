<?php
class Commandesfournisseurs extends ObjectModel
{
    public $id_supplier;
    public $supplier;
    public $name;
    public $mail;
    public $delai;
    public $franco_port;
    public $frais_de_port;
    public $delai_paiement;

    public static $definition = [
        'table'     => 'fournisseurs_infos',
        'primary'   => 'id_supplier',
        'fields'   => [
            'name'  => ['type' => self::TYPE_STRING, 'validate' => 'isAnything', 'size' => 64],
            'mail' => ['type' => self::TYPE_STRING, 'validate' => 'isAnything', 'size' => 64],
            'delai' => ['type' => self::TYPE_INT, 'validate' => 'isUnsignedInt'],
            'franco_port' => ['type' => self::TYPE_FLOAT, 'required' => false],
            'frais_de_port' => ['type' => self::TYPE_FLOAT, 'required' => false],
            'delai_paiement' => ['type' => self::TYPE_INT, 'validate' => 'isUnsignedInt'],
        ],
    ];

    public function __construct($id = null, $id_lang = null)
    {
        if (!$this->getFournisseursInfos($id)) {
            $id = (int)Tools::getValue('id_supplier');
            Db::getInstance()->execute('
                    INSERT INTO ' . _DB_PREFIX_ . 'fournisseurs_infos
                    (id_supplier)
                    VALUES(' . (int)$id . ')');
            $this->id_supplier;
        }
        parent::__construct($id);
    }

    public function getFournisseursInfos($id)
    {
        $result = Db::getInstance()->executeS('
        SELECT *
        FROM `' . _DB_PREFIX_ . 'fournisseurs_infos`
        WHERE `id_supplier` = ' . (int)$id);
        return $result;
    }
}