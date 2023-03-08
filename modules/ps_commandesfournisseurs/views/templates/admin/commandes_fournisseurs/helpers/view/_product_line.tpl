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

{* Assign product price *}
{if ($order->getTaxCalculationMethod() == $smarty.const.PS_TAX_EXC)}
    {assign var=product_price value=($product['unit_price_tax_excl'] + $product['ecotax'])}
{else}
    {assign var=product_price value=$product['unit_price_tax_incl']}
{/if}

{if ($product['product_quantity'] > $product['customized_product_quantity'])}
<tr class="product-line-row">
    <td>{if isset($product.image) && $product.image->id}{$product.image_tag|escape:'quotes':'UTF-8'}{/if}</td>
    <td>
        <a href="{$link->getAdminLink('AdminProducts')|escape:'html':'UTF-8'}&amp;id_product={$product['product_id']|intval}&amp;updateproduct&amp;token={getAdminToken tab='AdminProducts'}">
            <span class="productName">{$product['product_name']|escape:'htmlall':'UTF-8'}</span><br />
            {if $product.product_reference}{l s='Reference number:' mod='accountmanager'} {$product.product_reference|escape:'htmlall':'UTF-8'}<br />{/if}
            {if $product.product_supplier_reference}{l s='Supplier reference:' mod='accountmanager'} {$product.product_supplier_reference|escape:'htmlall':'UTF-8'}{/if}
        </a>
        <div class="row-editing-warning" style="display:none;">
            <div class="alert alert-warning">
                <strong>{l s='Editing this product line will remove the reduction and base price.' mod='accountmanager'}</strong>
            </div>
        </div>
    </td>
    {if ($order->getTaxCalculationMethod() != $smarty.const.PS_TAX_EXC)}
    <td class="unit_price_tax_excl">
        <span>{displayPrice price=$product.unit_price_tax_excl currency=$currency->id}</span>
    </td>
    {/if}
    <td>
        <span class="product_price_show">{displayPrice price=$product_price currency=$currency->id}</span>
        {if $can_edit}
        <div class="product_price_edit" style="display:none;">
            <input type="hidden" name="product_id_order_detail" class="edit_product_id_order_detail" value="{$product['id_order_detail']|escape:'htmlall':'UTF-8'}" />
            <div class="form-group">
                <div class="fixed-width-xl">
                    <div class="input-group">
                        {if $currency->format % 2}<div class="input-group-addon">{$currency->sign|escape:'htmlall':'UTF-8'} {l s='tax excl.' mod='accountmanager'}</div>{/if}
                        <input type="text" name="product_price_tax_excl" class="edit_product_price_tax_excl edit_product_price" value="{Tools::ps_round($product['unit_price_tax_excl']|escape:'htmlall':'UTF-8', 2)}"/>
                        {if !($currency->format % 2)}<div class="input-group-addon">{$currency->sign|escape:'htmlall':'UTF-8'} {l s='tax excl.' mod='accountmanager'}</div>{/if}
                    </div>
                </div>
                <br/>
                <div class="fixed-width-xl">
                    <div class="input-group">
                        {if $currency->format % 2}<div class="input-group-addon">{$currency->sign|escape:'htmlall':'UTF-8'} {l s='tax incl.' mod='accountmanager'}</div>{/if}
                        <input type="text" name="product_price_tax_incl" class="edit_product_price_tax_incl edit_product_price" value="{Tools::ps_round($product['unit_price_tax_incl']|escape:'htmlall':'UTF-8', 2)}"/>
                        {if !($currency->format % 2)}<div class="input-group-addon">{$currency->sign|escape:'htmlall':'UTF-8'} {l s='tax incl.' mod='accountmanager'}</div>{/if}
                    </div>
                </div>
            </div>
        </div>
        {/if}
    </td>
    <td class="productQuantity text-center">
        <span class="product_quantity_show{if (int)$product['product_quantity'] - (int)$product['customized_product_quantity'] > 1} badge{/if}">{(int)$product['product_quantity']|escape:'htmlall':'UTF-8' - (int)$product['customized_product_quantity']|escape:'htmlall':'UTF-8'}</span>
        {if $can_edit}
        <span class="product_quantity_edit" style="display:none;">
            <input type="text" name="product_quantity" class="edit_product_quantity" value="{$product['product_quantity']|htmlentities|escape:'htmlall':'UTF-8'}"/>
        </span>
        {/if}
    </td>
    {if $display_warehouse}
        <td>
            {$product.warehouse_name|escape:'html':'UTF-8'}
            {if $product.warehouse_location}
                <br>{l s='Location' mod='accountmanager'}: <strong>{$product.warehouse_location|escape:'html':'UTF-8'}</strong>
            {/if}
        </td>
    {/if}
    {if ($order->hasBeenPaid())}
        <td class="productQuantity text-center">
            {if !empty($product['amount_refund'])}
                {l s='%s (%s refund)' sprintf=[$product['product_quantity_refunded'], $product['amount_refund']] mod='accountmanager'}
            {/if}
            <input type="hidden" value="{$product['quantity_refundable']|escape:'htmlall':'UTF-8'}" class="partialRefundProductQuantity" />
            <input type="hidden" value="{(Tools::ps_round($product_price, 2) * ($product['product_quantity']|escape:'htmlall':'UTF-8' - $product['customizationQuantityTotal']|escape:'htmlall':'UTF-8'))}" class="partialRefundProductAmount" />
            {if count($product['refund_history'])}
                <span class="tooltip">
                    <span class="tooltip_label tooltip_button">+</span>
                    <span class="tooltip_content">
                    <span class="title">{l s='Refund history' mod='accountmanager'}</span>
                    {foreach $product['refund_history'] as $refund}
                        {l s='%1s - %2s' sprintf=[{dateFormat date=$refund.date_add}, {displayPrice price=$refund.amount_tax_incl}] mod='accountmanager'}<br />
                    {/foreach}
                    </span>
                </span>
            {/if}
        </td>
    {/if}
    {if $order->hasBeenDelivered() || $order->hasProductReturned()}
        <td class="productQuantity text-center">
            {$product['product_quantity_return']|escape:'htmlall':'UTF-8'}
            {if count($product['return_history'])}
                <span class="tooltip">
                    <span class="tooltip_label tooltip_button">+</span>
                    <span class="tooltip_content">
                    <span class="title">{l s='Return history' mod='accountmanager'}</span>
                    {foreach $product['return_history'] as $return}
                        {l s='%1s - %2s - %3s' sprintf=[{dateFormat date=$return.date_add}, $return.product_quantity, $return.state] mod='accountmanager'}<br />
                    {/foreach}
                    </span>
                </span>
            {/if}
        </td>
    {/if}
    {if $stock_management}<td class="productQuantity product_stock text-center">{$product['current_stock']|escape:'htmlall':'UTF-8'}</td>{/if}
    <td class="total_product">
        {displayPrice price=(Tools::ps_round($product_price, 2) * ($product['product_quantity'] - $product['customizationQuantityTotal'])) currency=$currency->id}
    </td>
    <td colspan="2" style="display: none;" class="add_product_fields">&nbsp;</td>
    <td class="cancelCheck standard_refund_fields current-edit" style="display:none">
        <input type="hidden" name="totalQtyReturn" id="totalQtyReturn" value="{$product['product_quantity_return']|escape:'htmlall':'UTF-8'}" />
        <input type="hidden" name="totalQty" id="totalQty" value="{$product['product_quantity']|escape:'htmlall':'UTF-8'}" />
        <input type="hidden" name="productName" id="productName" value="{$product['product_name']|escape:'htmlall':'UTF-8'}" />
    {if ((!$order->hasBeenDelivered() OR Configuration::get('PS_ORDER_RETURN')) AND (int)($product['product_quantity_return']) < (int)($product['product_quantity']))}
        <input type="checkbox" name="id_order_detail[{$product['id_order_detail']|escape:'htmlall':'UTF-8'}]" id="id_order_detail[{$product['id_order_detail']|escape:'htmlall':'UTF-8'}]" value="{$product['id_order_detail']|escape:'htmlall':'UTF-8'}" onchange="setCancelQuantity(this, {$product['id_order_detail']|escape:'htmlall':'UTF-8'}, {$product['product_quantity']|escape:'htmlall':'UTF-8' - $product['customizationQuantityTotal']|escape:'htmlall':'UTF-8' - $product['product_quantity_return']|escape:'htmlall':'UTF-8' - $product['product_quantity_refunded']|escape:'htmlall':'UTF-8'})" {if ($product['product_quantity_return'] + $product['product_quantity_refunded'] >= $product['product_quantity'])}disabled="disabled" {/if}/>
    {else}
        --
    {/if}
    </td>
    <td class="cancelQuantity standard_refund_fields current-edit" style="display:none">
    {if ($product['product_quantity_return'] + $product['product_quantity_refunded'] >= $product['product_quantity'])}
        <input type="hidden" name="cancelQuantity[{$product['id_order_detail']|escape:'htmlall':'UTF-8'}]" value="0" />
    {elseif (!$order->hasBeenDelivered() OR Configuration::get('PS_ORDER_RETURN'))}
        <input type="text" id="cancelQuantity_{$product['id_order_detail']|escape:'htmlall':'UTF-8'}" name="cancelQuantity[{$product['id_order_detail']|escape:'htmlall':'UTF-8'}]" onchange="checkTotalRefundProductQuantity(this)" value="" />
    {/if}

    {if $product['customizationQuantityTotal']}
        {assign var=productQuantity value=($product['product_quantity']-$product['customizationQuantityTotal'])}
    {else}
        {assign var=productQuantity value=$product['product_quantity']}
    {/if}

    {if ($order->hasBeenDelivered())}
        {$product['product_quantity_refunded']|escape:'htmlall':'UTF-8'}/{$productQuantity-$product['product_quantity_refunded']|escape:'htmlall':'UTF-8'}
    {elseif ($order->hasBeenPaid())}
        {$product['product_quantity_return']|escape:'htmlall':'UTF-8'}/{$productQuantity|escape:'htmlall':'UTF-8'}
    {else}
        0/{$productQuantity|escape:'htmlall':'UTF-8'}
    {/if}
    </td>
    <td class="partial_refund_fields current-edit" colspan="2" style="display:none; width: 250px;">
        {if $product['quantity_refundable'] > 0}
        {if ($order->getTaxCalculationMethod() == $smarty.const.PS_TAX_EXC)}
            {assign var='amount_refundable' value=$product['amount_refundable']}
        {else}
            {assign var='amount_refundable' value=$product['amount_refundable_tax_incl']}
        {/if}
        <div class="form-group">
            <div class="{if $product['amount_refundable'] > 0}col-lg-4{else}col-lg-12{/if}">
                <label class="control-label">
                    {l s='Quantity:' mod='accountmanager'}
                </label>
                <div class="input-group">
                    <input onchange="checkPartialRefundProductQuantity(this)" type="text" name="partialRefundProductQuantity[{$product['id_order_detail']|escape:'html':'UTF-8'}]" value="0" />
                    <div class="input-group-addon">/ {$product['quantity_refundable']|escape:'htmlall':'UTF-8'}</div>
                </div>
            </div>
            <div class="{if $product['quantity_refundable'] > 0}col-lg-8{else}col-lg-12{/if}">
                <label class="control-label">
                    <span class="title_box ">{l s='Amount:' mod='accountmanager'}</span>
                    <small class="text-muted">({$smarty.capture.TaxMethod|escape:'htmlall':'UTF-8'})</small>
                </label>
                <div class="input-group">
                    {if $currency->format % 2}<div class="input-group-addon">{$currency->sign|escape:'htmlall':'UTF-8'}</div>{/if}
                    <input onchange="checkPartialRefundProductAmount(this)" type="text" name="partialRefundProduct[{$product['id_order_detail']|escape:'htmlall':'UTF-8'}]" />
                    {if !($currency->format % 2)}<div class="input-group-addon">{$currency->sign|escape:'htmlall':'UTF-8'}</div>{/if}
                </div>
                <p class="help-block"><i class="icon-warning-sign"></i> {l s='(Max %s %s)' sprintf=[Tools::displayPrice(Tools::ps_round($amount_refundable, 2), $currency->id) , $smarty.capture.TaxMethod] mod='accountmanager'}</p>
            </div>
        </div>
        {/if}
    </td>
    {if ($can_edit && !$order->hasBeenDelivered())}
    <td class="product_invoice" style="display: none;">
        {if sizeof($invoices_collection)}
        <select name="product_invoice" class="edit_product_invoice">
            {foreach from=$invoices_collection item=invoice}
            <option value="{$invoice->id|escape:'htmlall':'UTF-8'}" {if $invoice->id == $product['id_order_invoice']}selected="selected"{/if}>
                #{Configuration::get('PS_INVOICE_PREFIX', $current_id_lang|escape:'htmlall':'UTF-8', null, $order->id_shop|escape:'htmlall':'UTF-8')}{'%06d'|sprintf:$invoice->number|escape:'htmlall':'UTF-8'}
            </option>
            {/foreach}
        </select>
        {else}
        &nbsp;
        {/if}
    </td>
    <td class="product_action text-right">
        {* edit/delete controls *}
        <div class="btn-group">
            <button type="button" class="btn btn-default edit_product_change_link">
                <i class="icon-pencil"></i>
                {l s='Edit' mod='accountmanager'}
            </button>
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li>
                    <a href="#" class="delete_product_line">
                        <i class="icon-trash"></i>
                        {l s='Delete' mod='accountmanager'}
                    </a>
                </li>
            </ul>
        </div>
        {* Update controls *}
        <button type="button" class="btn btn-default submitProductChange" style="display: none;">
            <i class="icon-ok"></i>
            {l s='Update' mod='accountmanager'}
        </button>
        <button type="button" class="btn btn-default cancel_product_change_link" style="display: none;">
            <i class="icon-remove"></i>
            {l s='Cancel' mod='accountmanager'}
        </button>
    </td>
    {/if}
</tr>
{/if}
