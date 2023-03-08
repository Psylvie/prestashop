<?php

/**
 * NOTICE OF LICENSE
 *
 * This source file is subject to a commercial license from AC2ID.
 * Any use, reproduction, modification or distribution of this source file without
 * writing acccord from AC2ID is expressly prohibited.
 * The purchase of the module via the http://addons.prestashop.com official platform,
 * equivalent to obtaining a commercial license for an e-commerce site.
 *
 * ----------------------------------------------------------------------------------
 *
 * INFORMATION SUR LA LICENCE D'UTILISATION
 *
 * L'utilisation de ce fichier source est soumise a une licence commerciale
 * concédée AC2ID.
 * Toute utilisation, reproduction, modification ou distribution du present
 * fichier source sans l'acccord écrit de la part de AC2ID est
 * expressement interdite.
 * L'achat du module via la plateforme officielle http://addons.prestashop.com/,
 * équivaut à l'obtention d'une licence commerciale pour un site e-commerce.
 *
 * ----------------------------------------------------------------------------------
 *
 * @author    AC2ID
 * @copyright 2013-2020 AC2ID
 * @license   Commercial license
 * @package    AccountManager
 * @support    support@ac2id.fr
 */

class AdminCommandesFournisseursController extends ModuleAdminController
{
    public $toolbar_title;

    protected $statuses_array = array();
    protected $cn;
    protected $id_shop;
    protected $ame = null;
    protected $id_employee = null;
    protected $display_list_am = false;

    public function __construct()
    {
        $this->bootstrap = true;
        $this->table = 'fournisseurs_infos';
        $this->identifier = 'id_supplier';
        $this->className = 'Commandesfournisseurs';
        $this->lang = false;

        parent::__construct();
        $this->addRowAction('see');
        $this->addRowAction('details');
        $this->addRowAction('edit');
        $this->explicitSelect = false;
        $this->deleted = false;
        $this->list_no_link = true;
        $this->context = Context::getContext();

        $this->cn = $this->controller_name;
        $id_lang = (int)$this->context->language->id;

        // tri par id_supplier
        $this->_defaultOrderBy = 'id_supplier';
        //$this->_defaultOrderWay = 'DESC';


        // jointure pour recuperer les id_supplier de la table supplier

        $this->_select = ' s.id_supplier, s.name';
        $this->_join = '
                RIGHT JOIN `' . _DB_PREFIX_ . 'supplier` s ON (s.`id_supplier` = a.`id_supplier`)';

        $this->fields_list = [
            'id_supplier' => [
                'title' => $this->l('ID', $this->cn),
                'filter_key' => 's!id_supplier',
                'align' => 'text-center',
                'class' => 'fixed-width-xs'
            ],
            'name' => [
                'title' => $this->l('Nom', $this->cn),
                'filter_key' => 'a!name',
            ],
            'mail' => [
                'title' => $this->l('Adresse Mail', $this->cn),
                'align' => 'text-center',


            ],
            'delai' => [
                'title' => $this->l('Delai', $this->cn),
                'align' => 'text-center',

            ],
            'franco_port' => [
                'title' => $this->l('Franco de port', $this->cn),
                'align' => 'text-center',

            ],
            'frais_de_port' => [
                'title' => $this->l('Frais de port', $this->cn),
                'align' => 'text-center',

            ],
            'delai_paiement' => [
                'title' => $this->l('Delai paiement', $this->cn),
                'align' => 'text-center',

            ],

        ];
    }

    public function renderForm()
    {

        $supplier = Supplier::getSuppliers(false, 1, true);

        $this->fields_form = [
            'legend' => [
                'title' => $this->l(' fournisseurs infos'), 'icon' => 'icon-certificate'],
            'input' => [
                ['name' => 'rien', 'type' => 'html', 'html_content' => '<div class="alert alert-info">enregistrer les nouvelles données </div>'],
                ['name' => 'id_supplier', 'label' => 'id_supplier', 'type' => 'text', 'required' => true,
                    'options' => ['query' => $supplier, 'id' => 'id_supplier', 'name' => 'name',],
                ],
                ['name' => 'name', 'type' => 'text', 'label' => $this->l('Nom: '), 'required' => true],
                ['name' => 'mail', 'type' => 'text', 'label' => $this->l('Email: '), 'placeholder' => 'mail@mail.fr', 'required' => false,],
                ['name' => 'delai', 'type' => 'text', 'label' => $this->l('Delai: '), 'required' => false,],
                ['name' => 'franco_port', 'type' => 'text', 'label' => $this->l('franco de port: '), 'required' => false,],
                ['name' => 'frais_de_port', 'type' => 'text', 'label' => $this->l('Frais de port: '), 'required' => false,],
                ['name' => 'delai_paiement', 'type' => 'text', 'label' => $this->l('Delai paiement: '), 'required' => false,],
                ['name' => 'csv', 'type' => 'file', 'label' => $this->l('Fichier tarifs: '), 'required' => false,],

            ],


            'submit' => [
                'title' => $this->trans('Save', [], 'Admin.Actions'),
            ]
        ];

        return parent::renderForm();
    }

    protected function openCsvFile($offset = false)
    {
        $file = $this->excelToCsvFile(Tools::getValue('csv'));
        $handle = false;
        if (is_file($file) && is_readable($file)) {
            if (!mb_check_encoding(file_get_contents($file), 'UTF-8')) {
                $this->convert = true;
            }
            $handle = fopen($file, 'rb');
        }
        if (!$handle) {
            $this->errors[] = $this->trans('Cannot read the .CSV file', [], 'AdminAdvparameters.Notification');
            return null; //error case
        }
        AdminImportController::rewindBomAware($handle);
        $toSkip = (int)Tools::getValue('skip');
        if ($offset && $offset > 0) {
            $toSkip += $offset;
        }
        for ($i = 0; $i < $toSkip; ++$i) {
            $line = fgetcsv($handle, MAX_LINE_SIZE, $this->separator);
            if ($line === false) {
                return false; // reached end of file
            }
        }
        return $handle;
    }

    protected function closeCsvFile($handle)
    {
        fclose($handle);
    }


    protected function excelToCsvFile($filename)
    {
        if (preg_match('#(.*?)\.(csv)#is', $filename)) {
            $dest_file = AdminImportController::getPath((string)(preg_replace('/\.{2,}/', '.', $filename)));
        } else {
            $csv_folder = AdminImportController::getPath();
            $excel_folder = $csv_folder . 'csvfromexcel/';
            $info = pathinfo($filename);
            $csv_name = basename($filename, '.' . $info['extension']) . '.csv';
            $dest_file = $excel_folder . $csv_name;

            if (!is_dir($excel_folder)) {
                mkdir($excel_folder);
            }

            if (!is_file($dest_file)) {
                $reader_excel = IOFactory::createReaderForFile($csv_folder . $filename);
                $reader_excel->setReadDataOnly(true);
                $excel_file = $reader_excel->load($csv_folder . $filename);
                $csv_writer = IOFactory::createWriter($excel_file, 'Csv');
                $csv_writer->setSheetIndex(0);
                $csv_writer->setDelimiter(';');
                $csv_writer->save($dest_file);
            }
        }
        return $dest_file;
    }

    public function postProcess()
    {
        if (Tools::getValue('submitAddCommandesfournisseurs')) {
            //récupere l'ID du fournisseur
            $idSupplier = (int)Tools::getValue('id_supplier');

            // verifie si un fichier a été envoyé
            if (!empty(Tools::getValue('csv'))) {

            //verifie si le fichier a été téléchargé correctement
                if (is_uploaded_file($_FILES['csv']['tmp_name'])) {
            //crée un onjet SplFileObject pour lire le fichier
                    $file = new SplFileObject($_FILES['csv']['tmp_name']);
            //Définit les flags pour indiquer que le fichier est au format csv
                    $file->setFlags(SplFileObject::READ_CSV);
            // Crée un itérateur limité pour lire le fichier CSV ligne par ligne
                    $limit = new LimitIterator($file, 0);
            // Initialise un compteur de lignes
                    $line = 0;
            // je boucle les lignes du fichier CSV
                    foreach ($limit as $dataA) {
            // Divise chaque ligne en un tableau de données séparées
                        $data = explode(";", $dataA[0]);

            //requête sql pour recuperer l'ID du produit et l'ID product_attribute en fonction de l'EAN contenu dans le fichier
                         $sql = "SELECT id_product, id_product_attribute FROM `'._DB_PREFIX_.'product_attribute` WHERE ean like '" . $data[0] . "'";
            //récupére les résultats de la requête
                        $results = Db::getInstance()->getRow($sql);
            //Incrémente le compteur de lignes
                        $line++;

             //requête sql pour mettre a jour les données dans la table product_supplier
                        Db::getInstance()->execute('
                            INSERT INTO ' . _DB_PREFIX_ . 'product_supplier
                            (id_product, id_supplier, id_product_attribute, product_supplier_price_te)
                            VALUES(' . (int)$results['id_product'] . ',' . $idSupplier . ',' . (int)$results['id_product_attribute'] . ',' . $data[1] . ')
                            ON DUPLICATE KEY UPDATE product_supplier_price_te =' . $data[1] . ')');
                    }
                }
            }
        }
                    return parent::postProcess();
  }
}

