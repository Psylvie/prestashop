{**
 * 2007-2018 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
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
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2018 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file='catalog/listing/product-list.tpl'}

{block name='product_list_header'}

{*    Crée une variable "banner_manufacturer" et assigne le chemin vers le fichier img
       inclus l'ID fabricant stocké dans $manufacturer.id*}
    {assign var="banner_manufacturer" value="img/m/{$manufacturer.id}-banner.jpg"}

    {if file_exists($banner_manufacturer)}

{* Si le fichier existe, crée un élément div avec l'ID "manufacturer-banner *}
        <div id="manufacturer-banner">

{* Crée un élément image qui affiche l'image de bannière du fabricant, image responsive *}
            <img src="{$urls.img_ps_url}m/{$manufacturer.id}-banner.jpg"
                 alt="{$manufacturer.name}"
                 title="{$manufacturer.name}"
                 class="img-responsive">
        </div>
    {/if}

    <h1>{l s='List of products by brand %brand_name%' sprintf=['%brand_name%' => $manufacturer.name] d='Shop.Theme.Catalog'}</h1>
    <div id="manufacturer-short_description">{$manufacturer.short_description nofilter}</div>
    <div id="manufacturer-description">{$manufacturer.description nofilter}</div>
{/block}


