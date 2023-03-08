{*
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
 *}

<div class="form-horizontal well">
    <div class="form-group">
        <label class="control-label col-lg-3">
            {l s='Name' mod='accountmanager'}
        </label>
        <div class="col-lg-9">
            <input class="form-control" type="text" name="discount_name" value="" />
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-lg-3">
            {l s='Type' mod='accountmanager'}
        </label>
        <div class="col-lg-9">
            <select class="form-control" name="discount_type" id="discount_type">
                <option value="1">{l s='Percent' mod='accountmanager'}</option>
                <option value="2">{l s='Amount' mod='accountmanager'}</option>
                <option value="3">{l s='Free shipping' mod='accountmanager'}</option>
            </select>
        </div>
    </div>

    <div id="discount_value_field" class="form-group">
        <label class="control-label col-lg-3">
            {l s='Value' mod='accountmanager'}
        </label>
        <div class="col-lg-9">
            <div class="input-group">
                <div class="input-group-addon">
                    <span id="discount_currency_sign" style="display: none;">{$currency->sign|escape:'htmlall':'UTF-8'}</span>
                    <span id="discount_percent_symbol">%</span>
                </div>
                <input class="form-control" type="text" name="discount_value"/>
            </div>
            <p class="text-muted" id="discount_value_help" style="display: none;">
                {l s='This value must include taxes.' mod='accountmanager'}
            </p>
        </div>
    </div>

    {if $order->hasInvoice()}
    <div class="form-group">
        <label class="control-label col-lg-3">
            {l s='Invoice' mod='accountmanager'}
        </label>
        <div class="col-lg-9">
            <select name="discount_invoice">
                {foreach from=$invoices_collection item=invoice}
                <option value="{$invoice->id|escape:'htmlall':'UTF-8'}" selected="selected">
                    {$invoice->getInvoiceNumberFormatted($current_id_lang|escape:'htmlall':'UTF-8')} - {displayPrice price=$invoice->total_paid_tax_incl currency=$order->id_currency}
                </option>
                {/foreach}
            </select>
        </div>
    </div>

    <div class="form-group">
        <div class="col-lg-9 col-lg-offset-3">
            <p class="checkbox">
                <label class="control-label" for="discount_all_invoices">
                    <input type="checkbox" name="discount_all_invoices" id="discount_all_invoices" value="1" /> 
                    {l s='Apply on all invoices' mod='accountmanager'}
                </label>
            </p>
            <p class="help-block">
                {l s='If you chooses to create this discount for all invoices, only one discount will be created per order invoice.' mod='accountmanager'}
            </p>
        </div>
    </div>
    {/if}

    <div class="row">
        <div class="col-lg-9 col-lg-offset-3">
            <button class="btn btn-default" type="button" id="cancel_add_voucher">
                <i class="icon-remove text-danger"></i>
                {l s='Cancel' mod='accountmanager'}
            </button>
            <button class="btn btn-default" type="submit" name="submitNewVoucher">
                <i class="icon-ok text-success"></i>
                {l s='Add' mod='accountmanager'}
            </button>
        </div>
    </div>
</div>