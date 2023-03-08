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

{extends file="helpers/list/list_header.tpl"}

{block name=leadin}
    {if isset($lensesSales)}
        <div class="row panel">
            <div class="panel-heading">
                {l s='Sales targets' mod='accountmanager'}
            </div>
            {if !isset($notGoalShop)}
                <div class="col-sm-6 {if isset($modeChief)}col-lg-3{else}col-lg-4{/if}">
                    <div class="panel color1">
                        <div class="panel-heading">
                            <i class="icon-credit-card"></i>  {l s='Total lenses sales' mod='accountmanager'}
                        </div>
                        <div class="text-center value">
                            <h2>
                                {if isset($goalShop)}
                                    {$goalShop|escape:'htmlall':'UTF-8'} {l s='without taxe by month' mod='accountmanager'}
                                {else}
                                    {l s='Select a shop' mod='accountmanager'}
                                {/if}
                            </h2>
                        </div>
                    </div>
                </div>
            {/if}
            {if isset($modeChief)}
                <div class="col-sm-6 {if !isset($notGoalShop)}col-lg-3{else}col-lg-4{/if}">
                    <div class="panel color2">
                        <div class="panel-heading">
                            <i class="icon-credit-card"></i>  {if isset($saleManager)}{l s='Your total Lenses sales' mod='accountmanager'}{else}{l s='Lenses sales of select sales manager' mod='accountmanager'}{/if}
                        </div>
                        <div class="text-center value">
                            <h2>
                                {if isset($goalSM)}
                                    {$goalSalesManager|escape:'htmlall':'UTF-8'} {l s='without taxe by month' mod='accountmanager'}
                                {else}
                                    {if isset($shopSM)}
                                        {l s='Select a sales manager' mod='accountmanager'}
                                    {else}
                                        {l s='Select a shop' mod='accountmanager'}
                                    {/if}
                                {/if}
                            </h2>
                        </div>
                    </div>
                </div>
            {/if}
            <div class="col-sm-6 {if !isset($notGoalShop)}col-lg-3{else}{if isset($modeChief)}col-lg-4{else}col-lg-6{/if}{/if}">
                <div class="panel color3">
                    <div class="panel-heading">
                        <i class="icon-credit-card"></i>  {if isset($ame)}{l s='Your Lenses sales' mod='accountmanager'}{else}{l s='Lenses sales of select account manager' mod='accountmanager'}{/if}
                    </div>
                    <div class="text-center value">
                            <h2>
                                {if isset($goalAM)}
                                    {$goalAccountManager|escape:'htmlall':'UTF-8'} {l s='without taxe by month' mod='accountmanager'}
                                {else}
                                    {if isset($shopAM)}
                                        {l s='Select an account manager' mod='accountmanager'}
                                    {else}
                                        {l s='Select a shop' mod='accountmanager'}
                                    {/if}
                                {/if}
                            </h2>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 {if !isset($notGoalShop)}col-lg-3{else}{if isset($modeChief)}col-lg-4{else}col-lg-6{/if}{/if}">
                <div class="panel color4">
                    <div class="panel-heading">
                        <i class="icon-money"></i>  {l s='Turnover achieved' mod='accountmanager'}
                    </div>
                    <div class="text-center value">
                        <h2>{$goalOfSelect|escape:'htmlall':'UTF-8'} {l s='without taxe' mod='accountmanager'}</h2>
                    </div>
                </div>
            </div>
        </div>
    {/if}
    {if isset($updateOrderStatus_mode) && $updateOrderStatus_mode}
        <div class="panel">
            <div class="panel-heading">
                {l s='Choose an order status' mod='accountmanager'}
            </div>
            <form action="{$REQUEST_URI|escape:'htmlall':'UTF-8'}" method="post">
                <div class="radio">
                    <label for="id_order_state">
                        <select id="id_order_state" name="id_order_state">
    {foreach from=$order_statuses item=order_status_name key=id_order_state}
                            <option value="{$id_order_state|intval}">{$order_status_name|escape}</option>
    {/foreach}
                        </select>
                    </label>
                </div>
    {foreach $POST as $key => $value}
        {if is_array($value)}
            {foreach $value as $val}
                <input type="hidden" name="{$key|escape:'html':'UTF-8'}[]" value="{$val|escape:'html':'UTF-8'}" />
            {/foreach}
        {elseif strtolower($key) != 'id_order_state'}
                <input type="hidden" name="{$key|escape:'html':'UTF-8'}" value="{$value|escape:'html':'UTF-8'}" />
    
        {/if}
    {/foreach}
                <div class="panel-footer">
                    <button type="submit" name="cancel" class="btn btn-default">
                        <i class="icon-remove"></i>
                        {l s='Cancel' mod='accountmanager'}
                    </button>
                    <button type="submit" class="btn btn-default" name="submitUpdateOrderStatus">
                        <i class="icon-check"></i>
                        {l s='Update Order Status' mod='accountmanager'}
                    </button>
                </div>
            </form>
        </div>
    {/if}
{/block}
