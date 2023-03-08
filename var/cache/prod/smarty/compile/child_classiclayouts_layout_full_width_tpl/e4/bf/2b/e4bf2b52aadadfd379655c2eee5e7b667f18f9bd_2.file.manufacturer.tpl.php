<?php
/* Smarty version 3.1.47, created on 2022-12-30 17:57:07
  from 'C:\xampp\htdocs\prestashop\themes\child-classic\templates\catalog\listing\manufacturer.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.47',
  'unifunc' => 'content_63af186332adb7_30361910',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'e4bf2b52aadadfd379655c2eee5e7b667f18f9bd' => 
    array (
      0 => 'C:\\xampp\\htdocs\\prestashop\\themes\\child-classic\\templates\\catalog\\listing\\manufacturer.tpl',
      1 => 1672412806,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_63af186332adb7_30361910 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_27002186463af18632ff678_17271819', 'product_list_header');
?>



<?php $_smarty_tpl->inheritance->endChild($_smarty_tpl, 'catalog/listing/product-list.tpl');
}
/* {block 'product_list_header'} */
class Block_27002186463af18632ff678_17271819 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'product_list_header' => 
  array (
    0 => 'Block_27002186463af18632ff678_17271819',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>


    <?php $_smarty_tpl->_assignInScope('banner_manufacturer', "img/m/".((string)$_smarty_tpl->tpl_vars['manufacturer']->value['id'])."-banner.jpg");?>

    <?php if (file_exists($_smarty_tpl->tpl_vars['banner_manufacturer']->value)) {?>

        <div id="manufacturer-banner">

            <img src="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['urls']->value['img_ps_url'], ENT_QUOTES, 'UTF-8');?>
m/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['manufacturer']->value['id'], ENT_QUOTES, 'UTF-8');?>
-banner.jpg"
                 alt="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['manufacturer']->value['name'], ENT_QUOTES, 'UTF-8');?>
"
                 title="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['manufacturer']->value['name'], ENT_QUOTES, 'UTF-8');?>
"
                 class="img-responsive">
        </div>
    <?php }?>

    <h1><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'List of products by brand %brand_name%','sprintf'=>array('%brand_name%'=>$_smarty_tpl->tpl_vars['manufacturer']->value['name']),'d'=>'Shop.Theme.Catalog'),$_smarty_tpl ) );?>
</h1>
    <div id="manufacturer-short_description"><?php echo $_smarty_tpl->tpl_vars['manufacturer']->value['short_description'];?>
</div>
    <div id="manufacturer-description"><?php echo $_smarty_tpl->tpl_vars['manufacturer']->value['description'];?>
</div>
<?php
}
}
/* {/block 'product_list_header'} */
}
