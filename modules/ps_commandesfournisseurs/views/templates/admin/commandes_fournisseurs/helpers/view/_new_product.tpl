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
<tr id="new_product" style="display:none">
    <td style="display:none;" colspan="2">
        <input type="hidden" id="add_product_product_id" name="add_product[product_id]" value="0" />

        <div class="form-group">
            <label>{l s='Product:' mod='accountmanager'}</label>
            <div class="input-group">
                <input type="text" id="add_product_product_name" value=""/>
                <div class="input-group-addon">
                    <i class="icon-search"></i>
                </div>
            </div>
        </div>

        <div id="add_product_product_attribute_area" class="form-group" style="display: none;">
            <label>{l s='Combinations' mod='accountmanager'}</label>
            <select name="add_product[product_attribute_id]" id="add_product_product_attribute_id"></select>
        </div>

        <div id="add_product_product_warehouse_area" class="form-group" style="display: none;">
            <label>{l s='Warehouse' mod='accountmanager'}</label>
            <select  id="add_product_warehouse" name="add_product_warehouse"></select>
        </div>
    </td>
    {if ($order->getTaxCalculationMethod() != $smarty.const.PS_TAX_EXC)}
    <td></td>
    {/if}
    <td style="display:none;">
        <div class="row">
            <div class="input-group fixed-width-xl">
                {if $currency->format % 2}<div class="input-group-addon">{$currency->sign|escape:'htmlall':'UTF-8'} {l s='tax excl.' mod='accountmanager'}</div>{/if}
                <input type="text" name="add_product[product_price_tax_excl]" id="add_product_product_price_tax_excl" value="" disabled="disabled" />
                {if !($currency->format % 2)}<div class="input-group-addon">{$currency->sign|escape:'htmlall':'UTF-8'} {l s='tax excl.' mod='accountmanager'}</div>{/if}
            </div>
        </div>
        <br/>
        <div class="row">
            <div class="input-group fixed-width-xl">
                {if $currency->format % 2}<div class="input-group-addon">{$currency->sign|escape:'htmlall':'UTF-8'} {l s='tax incl.' mod='accountmanager'}</div>{/if}
                <input type="text" name="add_product[product_price_tax_incl]" id="add_product_product_price_tax_incl" value="" disabled="disabled" />
                {if !($currency->format % 2)}<div class="input-group-addon">{$currency->sign|escape:'htmlall':'UTF-8'} {l s='tax incl.' mod='accountmanager'}</div>{/if}
            </div>
        </div>
    </td>

    <td style="display:none;" class="productQuantity">
        <input type="number" class="form-control fixed-width-sm" name="add_product[product_quantity]" id="add_product_product_quantity" value="1" disabled="disabled" />
    </td>
    {if ($order->hasBeenPaid())}<td style="display:none;" class="productQuantity"></td>{/if}
    {if $display_warehouse}<td></td>{/if}
    {if ($order->hasBeenDelivered())}<td style="display:none;" class="productQuantity"></td>{/if}
    <td style="display:none;" class="productQuantity" id="add_product_product_stock">0</td>
    <td style="display:none;" id="add_product_product_total">{displayPrice price=0 currency=$currency->id}</td>
    <td style="display:none;" colspan="2">
        {if sizeof($invoices_collection)}
        <select class="form-control" name="add_product[invoice]" id="add_product_product_invoice" disabled="disabled">
            <optgroup class="existing" label="{l s='Existing' mod='accountmanager'}">
                {foreach from=$invoices_collection item=invoice}
                <option value="{$invoice->id|escape:'htmlall':'UTF-8'}">{$invoice->getInvoiceNumberFormatted($current_id_lang|escape:'htmlall':'UTF-8')}</option>
                {/foreach}
            </optgroup>
            <optgroup label="{l s='New' mod='accountmanager'}">
                <option value="0">{l s='Create a new invoice' mod='accountmanager'}</option>
            </optgroup>
        </select>
        {/if}
    </td>
    <td style="display:none;">
        <button type="button" class="btn btn-default" id="cancelAddProduct">
            <i class="icon-remove text-danger"></i>
            {l s='Cancel' mod='accountmanager'}
        </button>
        <button type="button" class="btn btn-default" id="submitAddProduct" disabled="disabled">
            <i class="icon-ok text-success"></i>
            {l s='Add' mod='accountmanager'}
        </button>
    </td>
</tr>

<tr id="new_invoice" style="display:none">
    <td colspan="10">
        <h4>{l s='New invoice information' mod='accountmanager'}</h4>
        <div class="form-horizontal">
            <div class="form-group">
                <label class="control-label col-lg-3">{l s='Carrier' mod='accountmanager'}</label>
                <div class="col-lg-9">
                    <p class="form-control-static"><strong>{$carrier->name|escape:'htmlall':'UTF-8'}</strong></p>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">{l s='Shipping Cost' mod='accountmanager'}</label>
                <div class="col-lg-9">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="add_invoice[free_shipping]" value="1" />
                            {l s='Free shipping' mod='accountmanager'}
                        </label>
                        <p class="help-block">{l s='If you don\'t select "Free shipping," the normal shipping cost will be applied.' mod='accountmanager'}</p>
                    </div>
                </div>
            </div>
        </div>
    </td>
</tr>
