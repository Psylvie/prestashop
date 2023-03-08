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
<html>
<head>
{if isset($css_files)}
    {foreach from=$css_files key=css_uri item=media}
        <link href="{$css_uri|escape:'htmlall':'UTF-8'}" rel="stylesheet" type="text/css" media="{$media|escape:'htmlall':'UTF-8'}" />
    {/foreach}
{/if}
</head>
<body>
    <script type="text/javascript">
        var id_selected_product = parent.$('#id_product option:selected').val();

        parent.$('#products_err', window.parent.document).html('{$customization_errors|escape:'htmlall':'UTF-8'}');
        parent.$('#id_product option[value="'+id_selected_product+'"]').attr('selected', true);
        parent.$('#id_product').change();

        {if $customization_errors}
            parent.customization_errors = true;
        {else}
            parent.customization_errors = false;
        {/if}

        parent.customizationProductListener();
    </script>
    </body>
</html>
