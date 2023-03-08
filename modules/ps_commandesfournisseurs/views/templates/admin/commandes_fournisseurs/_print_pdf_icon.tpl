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

{* Generate HTML code for printing Invoice Icon with link *}
<span class="btn-group-action">
    <span class="btn-group">
    {if Configuration::get('PS_INVOICE') && $order->invoice_number}
        <a class="btn btn-default _blank" href="{$link->getAdminLink('AdminPdf')|escape:'html':'UTF-8'}&amp;submitAction=generateInvoicePDF&amp;id_order={$order->id|escape:'htmlall':'UTF-8'}">
            <i class="icon-file-text"></i>
        </a>
    {/if}
    {* Generate HTML code for printing Delivery Icon with link *}
    {if $order->delivery_number}
        <a class="btn btn-default _blank" href="{$link->getAdminLink('AdminPdf')|escape:'html':'UTF-8'}&amp;submitAction=generateDeliverySlipPDF&amp;id_order={$order->id|escape:'htmlall':'UTF-8'}">
            <i class="icon-truck"></i>
        </a>
    {/if}
    </span>
</span>
