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
{if $product['customizedDatas']}
{* Assign product price *}
{if ($order->getTaxCalculationMethod() == $smarty.const.PS_TAX_EXC)}
    {assign var=product_price value=($product['unit_price_tax_excl'] + $product['ecotax'])}
{else}
    {assign var=product_price value=$product['unit_price_tax_incl']}
{/if}
    <tr class="customized customized-{$product['id_order_detail']|intval} product-line-row">
        <td>
            <input type="hidden" class="edit_product_id_order_detail" value="{$product['id_order_detail']|intval}" />
            {if isset($product['image']) && $product['image']->id|intval}{$product['image_tag']|escape:'quotes':'UTF-8'}{else}--{/if}
        </td>
        <td>
            <a href="{$link->getAdminLink('AdminProducts')|escape:'html':'UTF-8'}&amp;id_product={$product['product_id']|intval}&amp;updateproduct&amp;token={getAdminToken tab='AdminProducts'}">
            <span class="productName">{$product['product_name']|escape:'htmlall':'UTF-8'} - {l s='Customized' mod='accountmanager'}</span><br />
            {if ($product['product_reference'])}{l s='Reference number:' mod='accountmanager'} {$product['product_reference']|escape:'htmlall':'UTF-8'}<br />{/if}
            {if ($product['product_supplier_reference'])}{l s='Supplier reference:' mod='accountmanager'} {$product['product_supplier_reference']|escape:'htmlall':'UTF-8'}{/if}
            </a>
        </td>
        {if ($order->getTaxCalculationMethod() != $smarty.const.PS_TAX_EXC)}
        <td>
            <span>{displayPrice price=$product.unit_price_tax_excl currency=$currency->id}</span>
        </td>
        {/if}
        <td>
            <span class="product_price_show">{displayPrice price=$product_price currency=$currency->id|intval}</span>
            {if $can_edit}
            <div class="product_price_edit" style="display:none;">
                <input type="hidden" name="product_id_order_detail" class="edit_product_id_order_detail" value="{$product['id_order_detail']|intval}" />
                <div class="form-group">
                    <div class="fixed-width-xl">
                        <div class="input-group">
                            {if $currency->format % 2}<div class="input-group-addon">{$currency->sign|escape:'htmlall':'UTF-8'} {l s='tax excl.' mod='accountmanager'}</div>{/if}
                            <input type="text" name="product_price_tax_excl" class="edit_product_price_tax_excl edit_product_price" value="{Tools::ps_round($product['unit_price_tax_excl']|escape:'htmlall':'UTF-8', 2)}" size="5" />
                            {if !($currency->format % 2)}<div class="input-group-addon">{$currency->sign|escape:'htmlall':'UTF-8'} {l s='tax excl.' mod='accountmanager'}</div>{/if}
                        </div>
                    </div>
                    <br/>
                    <div class="fixed-width-xl">
                        <div class="input-group">
                            {if $currency->format % 2}<div class="input-group-addon">{$currency->sign|escape:'htmlall':'UTF-8'} {l s='tax incl.' mod='accountmanager'}</div>{/if}
                            <input type="text" name="product_price_tax_incl" class="edit_product_price_tax_incl edit_product_price" value="{Tools::ps_round($product['unit_price_tax_incl']|escape:'htmlall':'UTF-8', 2)}" size="5" />
                            {if !($currency->format % 2)}<div class="input-group-addon">{$currency->sign|escape:'htmlall':'UTF-8'} {l s='tax incl.' mod='accountmanager'}</div>{/if}
                        </div>
                    </div>
                </div>
            </div>
            {/if}
        </td>
        <td class="productQuantity text-center">{$product['customizationQuantityTotal']|escape:'htmlall':'UTF-8'}</td>
        {if $display_warehouse}<td>&nbsp;</td>{/if}
        {if ($order->hasBeenPaid())}<td class="productQuantity text-center">{$product['customizationQuantityRefunded']|escape:'htmlall':'UTF-8'}</td>{/if}
        {if ($order->hasBeenDelivered() || $order->hasProductReturned())}<td class="productQuantity text-center">{$product['customizationQuantityReturned']|escape:'htmlall':'UTF-8'}</td>{/if}
        {if $stock_management}<td class="text-center">{$product['current_stock']|escape:'htmlall':'UTF-8'}</td>{/if}
        <td class="total_product">
        {if ($order->getTaxCalculationMethod() == $smarty.const.PS_TAX_EXC)}
            {displayPrice price=Tools::ps_round($product['product_price'] * $product['customizationQuantityTotal'], 2) currency=$currency->id|intval}
        {else}
            {displayPrice price=Tools::ps_round($product['product_price_wt'] * $product['customizationQuantityTotal'], 2) currency=$currency->id|intval}
        {/if}
        </td>
        <td class="cancelQuantity standard_refund_fields current-edit" style="display:none" colspan="2">
            &nbsp;
        </td>
        <td class="edit_product_fields" colspan="2" style="display:none">&nbsp;</td>
        <td class="partial_refund_fields current-edit" style="text-align:left;display:none;"></td>
        {if ($can_edit && !$order->hasBeenDelivered())}
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
    {foreach $product['customizedDatas'] as $customizationPerAddress}
        {foreach $customizationPerAddress as $customizationId => $customization}
            <tr class="customized customized-{$product['id_order_detail']|intval}">
                <td colspan="2">
                <input type="hidden" class="edit_product_id_order_detail" value="{$product['id_order_detail']|intval}" />
                    <div class="form-horizontal">
                        {foreach $customization.datas as $type => $datas}
                            {if ($type == Product::CUSTOMIZE_FILE)}
                                {foreach from=$datas item=data}
                                    <div class="form-group">
                                        <span class="col-lg-4 control-label"><strong>{if $data['name']}{$data['name']|escape:'htmlall':'UTF-8'}{else}{l s='Picture #' mod='accountmanager'}{$data@iteration|escape:'htmlall':'UTF-8'}{/if}</strong></span>
                                        <div class="col-lg-8">
                                            <a href="displayImage.php?img={$data['value']|escape:'htmlall':'UTF-8'}&amp;name={$order->id|intval}-file{$data@iteration|escape:'htmlall':'UTF-8'}" class="_blank">
                                                <img class="img-thumbnail" src="{$smarty.const._THEME_PROD_PIC_DIR_|escape:'htmlall':'UTF-8'}{$data['value']|escape:'htmlall':'UTF-8'}_small" alt=""/>
                                            </a>
                                        </div>
                                    </div>
                                {/foreach}
                            {elseif ($type == Product::CUSTOMIZE_TEXTFIELD)}
                                {foreach from=$datas item=data}
                                    <div class="form-group">
                                        <span class="col-lg-4 control-label"><strong>{if $data['name']}{l s='%s' sprintf=$data['name'] mod='accountmanager'}{else}{l s='Text #%s' sprintf=$data@iteration mod='accountmanager'}{/if}</strong></span>
                                        <div class="col-lg-8">
                                            <p class="form-control-static">{$data['value']|escape:'htmlall':'UTF-8'}</p>
                                        </div>
                                    </div>
                                {/foreach}
                            {/if}
                        {/foreach}
                    </div>
                </td>
                <td>-</td>
                <td class="productQuantity text-center">
                    <span class="product_quantity_show{if (int)$customization['quantity'] > 1} red bold{/if}">{$customization['quantity']|escape:'htmlall':'UTF-8'}</span>
                    {if $can_edit}
                    <span class="product_quantity_edit" style="display:none;">
                        <input type="text" name="product_quantity[{$customizationId|intval}]" class="edit_product_quantity" value="{$customization['quantity']|htmlentities}" size="2" />
                    </span>
                    {/if}
                </td>
                {if $display_warehouse}<td>&nbsp;</td>{/if}
                {if ($order->hasBeenPaid())}
                <td class="text-center">
                    {if !empty($product['amount_refund'])}
                    {l s='%s (%s refund)' sprintf=[$customization['quantity_refunded'], $product['amount_refund']] mod='accountmanager'}
                    {/if}
                    <input type="hidden" value="{$product['quantity_refundable']|escape:'htmlall':'UTF-8'}" class="partialRefundProductQuantity" />
                    <input type="hidden" value="{(Tools::ps_round($product_price|escape:'htmlall':'UTF-8', 2) * ($product['product_quantity']|escape:'htmlall':'UTF-8' - $product['customizationQuantityTotal']|escape:'htmlall':'UTF-8'))}" class="partialRefundProductAmount" />
                </td>
                {/if}
                {if ($order->hasBeenDelivered())}<td class="text-center">{$customization['quantity_returned']|escape:'htmlall':'UTF-8'}</td>{/if}
                <td class="text-center">-</td>
                <td class="total_product">
                    {if ($order->getTaxCalculationMethod() == $smarty.const.PS_TAX_EXC)}
                        {displayPrice price=Tools::ps_round($product['product_price'] * $customization['quantity'], 2) currency=$currency->id|intval}
                    {else}
                        {displayPrice price=Tools::ps_round($product['product_price_wt'] * $customization['quantity'], 2) currency=$currency->id|intval}
                    {/if}
                </td>
                <td class="cancelCheck standard_refund_fields current-edit" style="display:none">
                    <input type="hidden" name="totalQtyReturn" id="totalQtyReturn" value="{$customization['quantity_returned']|intval}" />
                    <input type="hidden" name="totalQty" id="totalQty" value="{$customization['quantity']|intval}" />
                    <input type="hidden" name="productName" id="productName" value="{$product['product_name']|escape:'htmlall':'UTF-8'}" />
                    {if ((!$order->hasBeenDelivered() OR Configuration::get('PS_ORDER_RETURN')) AND (int)($customization['quantity_returned']) < (int)($customization['quantity']))}
                        <input type="checkbox" name="id_customization[{$customizationId|intval}]" id="id_customization[{$customizationId|intval}]" value="{$product['id_order_detail']|intval}" onchange="setCancelQuantity(this, {$customizationId|intval}, {$customization['quantity']|escape:'htmlall':'UTF-8' - $product['customizationQuantityTotal']|escape:'htmlall':'UTF-8' - $product['product_quantity_reinjected']|escape:'htmlall':'UTF-8'})" {if ($product['product_quantity_return'] + $product['product_quantity_refunded'] >= $product['product_quantity'])}disabled="disabled" {/if}/>
                    {else}
                    --
                {/if}
                </td>
                <td class="cancelQuantity standard_refund_fields current-edit" style="display:none">
                {if ($customization['quantity_returned'] + $customization['quantity_refunded'] >= $customization['quantity'])}
                    <input type="hidden" name="cancelCustomizationQuantity[{$customizationId|intval}]" value="0" />
                {elseif (!$order->hasBeenDelivered() OR Configuration::get('PS_ORDER_RETURN'))}
                    <input type="text" id="cancelQuantity_{$customizationId|intval}" name="cancelCustomizationQuantity[{$customizationId|intval}]" size="2" onclick="selectCheckbox(this);" value="" />0/{$customization['quantity']|escape:'htmlall':'UTF-8'-$customization['quantity_refunded']|escape:'htmlall':'UTF-8'}
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
                                <input onchange="checkPartialRefundProductQuantity(this)" type="text" name="partialRefundProductQuantity[{$product['id_order_detail']|intval}]" value="{if ($customization['quantity']-$customization['quantity_refunded']) >0}1{else}0{/if}" />
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
                                <input onchange="checkPartialRefundProductAmount(this)" type="text" name="partialRefundProduct[{$product['id_order_detail']|intval}]" />
                                {if !($currency->format % 2)}<div class="input-group-addon">{$currency->sign|escape:'htmlall':'UTF-8'}</div>{/if}
                            </div>
                            <p class="help-block"><i class="icon-warning-sign"></i> {l s='(Max %s %s)' sprintf=[Tools::displayPrice(Tools::ps_round($amount_refundable, 2), $currency->id), $smarty.capture.TaxMethod] mod='accountmanager'}</p>
                        </div>
                    </div>
                    {/if}
                </td>
                {if ($can_edit && !$order->hasBeenDelivered())}
                    <td class="edit_product_fields" colspan="2" style="display:none"></td>
                    <td class="product_action" style="text-align:right"></td>
                {/if}
            </tr>
        {/foreach}
    {/foreach}
{/if}
