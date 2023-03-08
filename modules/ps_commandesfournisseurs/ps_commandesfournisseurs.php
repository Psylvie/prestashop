<?php

/**
* 2007-2022 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2022 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

if (!defined('_PS_VERSION_')) {
    exit;
}
include_once(dirname(__FILE__).'/model/Commandesfournisseurs.php');

class Ps_Commandesfournisseurs extends Module
{
    protected $config_form = false;
    public function __construct()
    {
        $this->name = 'ps_commandesfournisseurs';
        $this->tab = 'shipping_logistics';
        $this->version = '1.0.0';
        $this->author = 'David MEYER';
        $this->need_instance = 1;

        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Gestion des commandes fournisseur');
        $this->description = $this->l('Gestion des commandes fournisseur');

        $this->confirmUninstall = $this->l('Vous êtes sur ?');

        $this->ps_versions_compliancy = array('min' => '1.7', 'max' => _PS_VERSION_);
    }

    public function install()
    {
        Configuration::updateValue('PS_COMMANDESFOURNISSEURS_LIVE_MODE', false);

        include(dirname(__FILE__).'/sql/install.php');

        return parent::install() &&
            $this->createTab() &&
            $this->registerHook('header') &&
            $this->registerHook('backOfficeHeader') &&
            $this->registerHook('actionOrderStatusUpdate');
    }

    public function uninstall()
    {
        Configuration::deleteByName('PS_COMMANDESFOURNISSEURS_LIVE_MODE');

        include(dirname(__FILE__).'/sql/uninstall.php');

        return parent::uninstall() &&
		 $this->deleteTab();
    }

    /**
     * Load the configuration form
     */
    public function getContent()
    {
        /**
         * If values have been submitted in the form, process.
         */
        if (((bool)Tools::isSubmit('submitPs_commandesfournisseursModule')) == true) {
            $this->postProcess();
        }

        $this->context->smarty->assign('module_dir', $this->_path);

        $output = $this->context->smarty->fetch($this->local_path.'views/templates/admin/configure.tpl');

        return $output.$this->renderForm();
    }

    /**
     * Create the form that will be displayed in the configuration of your module.
     */
    protected function renderForm()
    {
        $helper = new HelperForm();

        $helper->show_toolbar = false;
        $helper->table = $this->table;
        $helper->module = $this;
        $helper->default_form_language = $this->context->language->id;
        $helper->allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG', 0);

        $helper->identifier = $this->identifier;
        $helper->submit_action = 'submitPs_commandesfournisseursModule';
        $helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false)
            .'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');

        $helper->tpl_vars = array(
            'fields_value' => $this->getConfigFormValues(), /* Add values for your inputs */
            'languages' => $this->context->controller->getLanguages(),
            'id_language' => $this->context->language->id,
        );

        return $helper->generateForm(array($this->getConfigForm()));
    }

    /**
     * Create the structure of your form.
     */
    protected function getConfigForm()
    {
        return array(
            'form' => array(
                'legend' => array(
                'title' => $this->l('Settings'),
                'icon' => 'icon-cogs',
                ),
                'input' => array(
                    array(
                        'type' => 'switch',
                        'label' => $this->l('Live mode'),
                        'name' => 'PS_COMMANDESFOURNISSEURS_LIVE_MODE',
                        'is_bool' => true,
                        'desc' => $this->l('Use this module in live mode'),
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => true,
                                'label' => $this->l('Enabled')
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => false,
                                'label' => $this->l('Disabled')
                            )
                        ),
                    ),
                    array(
                        'col' => 3,
                        'type' => 'text',
                        'prefix' => '<i class="icon icon-envelope"></i>',
                        'desc' => $this->l('Enter a valid email address'),
                        'name' => 'PS_COMMANDESFOURNISSEURS_ACCOUNT_EMAIL',
                        'label' => $this->l('Email'),
                    ),
                    array(
                        'type' => 'password',
                        'name' => 'PS_COMMANDESFOURNISSEURS_ACCOUNT_PASSWORD',
                        'label' => $this->l('Password'),
                    ),
                ),
                'submit' => array(
                    'title' => $this->l('Save'),
                ),
            ),
        );
    }

    /**
     * Set values for the inputs.
     */
    protected function getConfigFormValues()
    {
        return array(
            'PS_COMMANDESFOURNISSEURS_LIVE_MODE' => Configuration::get('PS_COMMANDESFOURNISSEURS_LIVE_MODE', true),
            'PS_COMMANDESFOURNISSEURS_ACCOUNT_EMAIL' => Configuration::get('PS_COMMANDESFOURNISSEURS_ACCOUNT_EMAIL', 'contact@prestashop.com'),
            'PS_COMMANDESFOURNISSEURS_ACCOUNT_PASSWORD' => Configuration::get('PS_COMMANDESFOURNISSEURS_ACCOUNT_PASSWORD', null),
        );
    }

    /**
     * Save form data.
     */
    protected function postProcess()
    {
        $form_values = $this->getConfigFormValues();

        foreach (array_keys($form_values) as $key) {
            Configuration::updateValue($key, Tools::getValue($key));
        }
    }
    protected function createTab()
    {
        $error = false;
        $tab_cf = new Tab();
        $tab_cf->name = array();
        foreach (Language::getLanguages() as $language) {
            $tab_cf->name[$language['id_lang']] = $this->l('Gestion commandes fournisseurs');
        }
        $tab_cf->module = $this->name;
        $tab_cf->class_name = 'AdminMainCommandesFournisseurs';
        $tab_cf->id_parent = 0;
        $tab_cf->active = 1;
        if (!$tab_cf->add()) {
            $error = true;
        }

        $tab_cf_fournisseurs = new Tab();
        $tab_cf_fournisseurs->name = array();
        foreach (Language::getLanguages() as $language) {
            $tab_cf_fournisseurs->name[$language['id_lang']] = $this->l('Fournisseurs');
        }
        $tab_cf_fournisseurs->module = $this->name;
        $tab_cf_fournisseurs->class_name = 'AdminFournisseurs';
        $tab_cf_fournisseurs->id_parent = $tab_cf->id;
        $tab_cf_fournisseurs->active = 1;
        if (!$tab_cf_fournisseurs->add()) {
            $error = true;
        }

        $tab_cf_encours = new Tab();
        $tab_cf_encours->name = array();
        foreach (Language::getLanguages() as $language) {
            $tab_cf_encours->name[$language['id_lang']] = $this->l('FOURNISSEURS');
        }
        $tab_cf_encours->module = $this->name;
        $tab_cf_encours->class_name = 'AdminCommandesFournisseurs';
        $tab_cf_encours->id_parent = $tab_cf->id;
        $tab_cf_encours->active = 1;
        if (!$tab_cf_encours->add()) {
            $error = true;
        }

        $tab_cf_enattente = new Tab();
        $tab_cf_enattente->name = array();
        foreach (Language::getLanguages() as $language) {
            $tab_cf_enattente->name[$language['id_lang']] = $this->l('Carts');
        }
        $tab_cf_enattente->module = $this->name;
        $tab_cf_enattente->class_name = 'AdminCommandesFournisseursAttente';
        $tab_cf_enattente->id_parent = $tab_cf->id;
        $tab_cf_enattente->active = 1;
        if (!$tab_cf_enattente->add()) {
            $error = true;
        }

        return $error ? false : true;
    }

    protected function deleteTab()
    {
        $error = false;
        $tab_cf_enattente = new Tab(Tab::getIdFromClassName('AdminCommandesFournisseursAttente'));
        if (!$tab_cf_enattente->delete()) {
            $error = true;
        }
        $tab_cf_encours = new Tab(Tab::getIdFromClassName('AdminCommandesFournisseurs'));
        if (!$tab_cf_encours->delete()) {
            $error = true;
        }
        $tab_cf_fournisseurs = new Tab(Tab::getIdFromClassName('AdminFournisseurs'));
        if (!$tab_cf_fournisseurs->delete()) {
            $error = true;
        }

        $tab_cf = new Tab(Tab::getIdFromClassName('AdminMainCommandesFournisseurs'));
        if (!$tab_cf->delete()) {
            $error = true;
        }
        return $error ? false : true;
    }



    /**
    * Add the CSS & JavaScript files you want to be loaded in the BO.
    */
    public function hookBackOfficeHeader()
    {
        if (Tools::getValue('module_name') == $this->name) {
            $this->context->controller->addJS($this->_path.'views/js/back.js');
            $this->context->controller->addCSS($this->_path.'views/css/back.css');
        }
    }

    /**
     * Add the CSS & JavaScript files you want to be added on the FO.
     */
    public function hookHeader()
    {
        $this->context->controller->addJS($this->_path.'/views/js/front.js');
        $this->context->controller->addCSS($this->_path.'/views/css/front.css');
    }

    public function hookActionOrderStatusUpdate()
    {
        /* Place your code here. */
    }
}
