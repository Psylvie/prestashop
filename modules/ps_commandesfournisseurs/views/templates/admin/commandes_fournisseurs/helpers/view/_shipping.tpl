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
<div class="table-responsive">
    <table class="table" id="shipping_table">
        <thead>
            <tr>
                <th>
                    <span class="title_box ">{l s='Date' mod='accountmanager'}</span>
                </th>
                <th>
                    <span class="title_box ">{l s='Weight' mod='accountmanager'}</span>
                </th>
                <th>
                    <span class="title_box ">{l s='Shipping cost' mod='accountmanager'}</span>
                </th>
                <th>
                    <span class="title_box ">{l s='Tracking number' mod='accountmanager'}</span>
                </th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            {foreach from=$order->getShipping() item=line}
            <tr>
                <td><input type="text" name="delivery_date" class="datepicker77" value="{$line.date_add}" id="date_livraison"></td>
                <td class="weight">{$line.weight|string_format:"%.3f"|escape:'htmlall':'UTF-8'} {Configuration::get('PS_WEIGHT_UNIT')|escape:'htmlall':'UTF-8'}</td>
                <td class="center">
                    {if $order->getTaxCalculationMethod() == $smarty.const.PS_TAX_INC}
                        {displayPrice price=$line.shipping_cost_tax_incl currency=$currency->id}
                    {else}
                        {displayPrice price=$line.shipping_cost_tax_excl currency=$currency->id}
                    {/if}
                </td>
                <td>
                    <span class="shipping_number_show">{if $line.url && $line.tracking_number}<a class="_blank" href="{$line.url|replace:'@':$line.tracking_number|escape:'htmlall':'UTF-8'}">{$line.tracking_number|escape:'htmlall':'UTF-8'}</a>{else}{$line.tracking_number|escape:'htmlall':'UTF-8'}{/if}</span>
                </td>
                <td>
                    {if $line.can_edit}
                        <form method="post" action="{$link->getAdminLink('AdminAccountManagerOrders')|escape:'html':'UTF-8'}&amp;vieworder&amp;id_order={$order->id|intval}">
                            <span class="shipping_number_edit" style="display:none;">
                                <input type="hidden" name="id_order_carrier" value="{$line.id_order_carrier|htmlentities|escape:'htmlall':'UTF-8'}" />
                                <input type="text" name="tracking_number" value="{$line.tracking_number|htmlentities|escape:'htmlall':'UTF-8'}" />
                                <button type="submit" class="btn btn-default" name="submitShippingNumber">
                                    <i class="icon-ok"></i>
                                    {l s='Update' mod='accountmanager'}
                                </button>
                            </span>
                            <a href="#" class="edit_shipping_number_link btn btn-default">
                                <i class="icon-pencil"></i>
                                {l s='Edit' mod='accountmanager'}
                            </a>
                            <a href="#" class="cancel_shipping_number_link btn btn-default" style="display: none;">
                                <i class="icon-remove"></i>
                                {l s='Cancel' mod='accountmanager'}
                            </a>
                        </form>
                    {/if}
                </td>
            </tr>
            {/foreach}
        </tbody>
    </table>
</div>
