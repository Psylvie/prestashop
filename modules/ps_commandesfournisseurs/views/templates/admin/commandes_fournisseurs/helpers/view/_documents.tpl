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
    <table class="table" id="documents_table">
        <thead>
            <tr>
                <th>
                    <span class="title_box ">{l s='Date' mod='accountmanager'}</span>
                </th>
                <th>
                    <span class="title_box ">{l s='Document' mod='accountmanager'}</span>
                </th>
                <th>
                    <span class="title_box ">{l s='Number' mod='accountmanager'}</span>
                </th>
                <th>
                    <span class="title_box ">{l s='Amount' mod='accountmanager'}</span>
                </th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            {foreach from=$order->getDocuments() item=document}

                {if get_class($document) eq 'OrderInvoice'}
                    {if isset($document->is_delivery)}
                    <tr id="delivery_{$document->id|escape:'htmlall':'UTF-8'}">
                    {else}
                    <tr id="invoice_{$document->id|escape:'htmlall':'UTF-8'}">
                    {/if}
                {elseif get_class($document) eq 'OrderSlip'}
                    <tr id="orderslip_{$document->id|escape:'htmlall':'UTF-8'}">
                {/if}

                        <td>{dateFormat date=$document->date_add}</td>
                        <td>
                            {if get_class($document) eq 'OrderInvoice'}
                                {if isset($document->is_delivery)}
                                    {l s='Delivery slip' mod='accountmanager'}
                                {else}
                                    {l s='Invoice' mod='accountmanager'}
                                {/if}
                            {elseif get_class($document) eq 'OrderSlip'}
                                {l s='Credit Slip' mod='accountmanager'}
                            {/if}
                        </td>
                        <td>
                            {if get_class($document) eq 'OrderInvoice'}
                                {if isset($document->is_delivery)}
                                    <a class="_blank" title="{l s='See the document' mod='accountmanager'}" href="{$link->getAdminLink('AdminPdf')|escape:'html':'UTF-8'}&amp;submitAction=generateDeliverySlipPDF&amp;id_order_invoice={$document->id|escape:'htmlall':'UTF-8'}">
                                {else}
                                    <a class="_blank" title="{l s='See the document' mod='accountmanager'}" href="{$link->getAdminLink('AdminPdf')|escape:'html':'UTF-8'}&amp;submitAction=generateInvoicePDF&amp;id_order_invoice={$document->id|escape:'htmlall':'UTF-8'}">
                               {/if}
                            {elseif get_class($document) eq 'OrderSlip'}
                                <a class="_blank" title="{l s='See the document' mod='accountmanager'}" href="{$link->getAdminLink('AdminPdf')|escape:'html':'UTF-8'}&amp;submitAction=generateOrderSlipPDF&amp;id_order_slip={$document->id|escape:'htmlall':'UTF-8'}">
                            {/if}
                            {if get_class($document) eq 'OrderInvoice'}
                                {if isset($document->is_delivery)}
                                    {Configuration::get('PS_DELIVERY_PREFIX', $current_id_lang|escape:'htmlall':'UTF-8', null, $order->id_shop|escape:'htmlall':'UTF-8')}{'%06d'|sprintf:$document->delivery_number|escape:'htmlall':'UTF-8'}
                                {else}
                                    {$document->getInvoiceNumberFormatted($current_id_lang|escape:'htmlall':'UTF-8', $order->id_shop|escape:'htmlall':'UTF-8')}
                                {/if}
                            {elseif get_class($document) eq 'OrderSlip'}
                                {Configuration::get('PS_CREDIT_SLIP_PREFIX', $current_id_lang|escape:'htmlall':'UTF-8')}{'%06d'|sprintf:$document->id|escape:'htmlall':'UTF-8'}
                            {/if}
                            </a>
                        </td>
                        <td>
                        {if get_class($document) eq 'OrderInvoice'}
                            {if isset($document->is_delivery)}
                                --
                            {else}
                                {displayPrice price=$document->total_paid_tax_incl currency=$currency->id}&nbsp;
                                {if $document->getTotalPaid()}
                                    <span>
                                    {if $document->getRestPaid() > 0}
                                        ({displayPrice price=$document->getRestPaid() currency=$currency->id} {l s='not paid' mod='accountmanager'})
                                    {elseif $document->getRestPaid() < 0}
                                        ({displayPrice price=-$document->getRestPaid() currency=$currency->id} {l s='overpaid' mod='accountmanager'})
                                    {/if}
                                    </span>
                                {/if}
                            {/if}
                        {elseif get_class($document) eq 'OrderSlip'}
                            {displayPrice price=$document->amount+$document->shipping_cost_amount currency=$currency->id}
                        {/if}
                        </td>
                        <td class="text-right document_action">
                        {if get_class($document) eq 'OrderInvoice'}
                            {if !isset($document->is_delivery)}

                                {if $document->getRestPaid()}
                                    <a href="#formAddPaymentPanel" class="js-set-payment btn btn-default anchor" data-amount="{$document->getRestPaid()|escape:'html':'UTF-8'}" data-id-invoice="{$document->id|escape:'htmlall':'UTF-8'}" title="{l s='Set payment form' mod='accountmanager'}">
                                        <i class="icon-money"></i>
                                        {l s='Enter payment' mod='accountmanager'}
                                    </a>
                                {/if}

                                <a href="#" class="btn btn-default" onclick="$('#invoiceNote{$document->id|escape:'htmlall':'UTF-8'}').show(); return false;" title="{if $document->note eq ''}{l s='Add note' mod='accountmanager'}{else}{l s='Edit note' mod='accountmanager'}{/if}">
                                    {if $document->note eq ''}
                                        <i class="icon-plus-sign-alt"></i>
                                        {l s='Add note' mod='accountmanager'}
                                    {else}
                                        <i class="icon-pencil"></i>
                                        {l s='Edit note' mod='accountmanager'}
                                    {/if}
                                </a>

                            {/if}
                        {/if}
                        </td>
                    </tr>
                {if get_class($document) eq 'OrderInvoice'}
                    {if !isset($document->is_delivery)}
                    <tr id="invoiceNote{$document->id|escape:'htmlall':'UTF-8'}" style="display:none">
                        <td colspan="5">
                            <form action="{$current_index|escape:'htmlall':'UTF-8'}&amp;viewOrder&amp;id_order={$order->id|escape:'htmlall':'UTF-8'}{if isset($smarty.get.token)}&amp;token={$smarty.get.token|escape:'html':'UTF-8'}{/if}" method="post">
                                <p>
                                    <label for="editNote{$document->id|escape:'htmlall':'UTF-8'}" class="t">{l s='Note' mod='accountmanager'}</label>
                                    <input type="hidden" name="id_order_invoice" value="{$document->id|escape:'htmlall':'UTF-8'}" />
                                    <textarea name="note" id="editNote{$document->id|escape:'htmlall':'UTF-8'}" class="edit-note textarea-autosize">{$document->note|escape:'html':'UTF-8'}</textarea>
                                </p>
                                <p>
                                    <button type="submit" name="submitEditNote" class="btn btn-default">
                                        <i class="icon-save"></i>
                                        {l s='Save' mod='accountmanager'}
                                    </button>
                                    <a class="btn btn-default" href="#" id="cancelNote" onclick="$('#invoiceNote{$document->id|escape:'htmlall':'UTF-8'}').hide();return false;">
                                        <i class="icon-remove"></i>
                                        {l s='Cancel' mod='accountmanager'}
                                    </a>
                                </p>
                            </form>
                        </td>
                    </tr>
                    {/if}
                {/if}
            {foreachelse}
                <tr>
                    <td colspan="5" class="list-empty">
                        <div class="list-empty-msg">
                            <i class="icon-warning-sign list-empty-icon"></i>
                            {l s='There is no available document' mod='accountmanager'}
                        </div>
                        {if isset($invoice_management_active) && $invoice_management_active}
                            <a class="btn btn-default" href="{$current_index|escape:'htmlall':'UTF-8'}&amp;viewOrder&amp;submitGenerateInvoice&amp;id_order={$order->id|escape:'htmlall':'UTF-8'}{if isset($smarty.get.token)}&amp;token={$smarty.get.token|escape:'html':'UTF-8'}{/if}">
                                <i class="icon-repeat"></i>
                                {l s='Generate invoice' mod='accountmanager'}
                            </a>
                        {/if}
                    </td>
                </tr>
            {/foreach}
        </tbody>
    </table>
</div>
