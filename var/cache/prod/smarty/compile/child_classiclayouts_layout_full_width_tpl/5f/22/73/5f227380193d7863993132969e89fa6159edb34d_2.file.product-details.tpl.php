<?php
/* Smarty version 3.1.47, created on 2022-12-31 19:49:46
  from 'C:\xampp\htdocs\prestashop\themes\child-classic\templates\catalog\_partials\product-details.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.47',
  'unifunc' => 'content_63b0844aedc6d7_17072286',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '5f227380193d7863993132969e89fa6159edb34d' => 
    array (
      0 => 'C:\\xampp\\htdocs\\prestashop\\themes\\child-classic\\templates\\catalog\\_partials\\product-details.tpl',
      1 => 1672406395,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_63b0844aedc6d7_17072286 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, false);
?>
<div "
     id="product-details"
     data-product="<?php echo htmlspecialchars(call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'json_encode' ][ 0 ], array( $_smarty_tpl->tpl_vars['product']->value['embedded_attributes'] )), ENT_QUOTES, 'UTF-8');?>
"
     role="tabpanel"
>






    <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_21794216763b0844aecbc84_28951455', 'product_quantities');
?>






    <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_50340660763b0844aed7ac8_09324966', 'product_condition');
?>

</div>
<?php }
/* {block 'product_quantities'} */
class Block_21794216763b0844aecbc84_28951455 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'product_quantities' => 
  array (
    0 => 'Block_21794216763b0844aecbc84_28951455',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

        <?php if ($_smarty_tpl->tpl_vars['product']->value['show_quantities']) {?>
            <div class="product-quantities">

                        <span class="stock_round" id="<?php if ($_smarty_tpl->tpl_vars['product']->value['quantity'] > 0) {?>stock1<?php } else {
if ($_smarty_tpl->tpl_vars['product']->value['allow_oosp']) {?>stock2<?php } else { ?>stock0<?php }
}?>"></span>

                        <label class="label"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Stock','d'=>'Shop.Theme.Catalog'),$_smarty_tpl ) );?>
 : </label>

                        <span data-stock="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['product']->value['quantity'], ENT_QUOTES, 'UTF-8');?>
" data-allow-oosp="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['product']->value['allow_oosp'], ENT_QUOTES, 'UTF-8');?>
"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['product']->value['quantity'], ENT_QUOTES, 'UTF-8');?>
</span>

            </div>
        <?php }?>
    <?php
}
}
/* {/block 'product_quantities'} */
/* {block 'product_condition'} */
class Block_50340660763b0844aed7ac8_09324966 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'product_condition' => 
  array (
    0 => 'Block_50340660763b0844aed7ac8_09324966',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

        <?php if ($_smarty_tpl->tpl_vars['product']->value['condition']) {?>
            <div class="product-condition">
                <label class="label"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Condition','d'=>'Shop.Theme.Catalog'),$_smarty_tpl ) );?>
 </label>
                <link itemprop="itemCondition" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['product']->value['condition']['schema_url'], ENT_QUOTES, 'UTF-8');?>
"/>
                <span><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['product']->value['condition']['label'], ENT_QUOTES, 'UTF-8');?>
</span>
            </div>
        <?php }?>
    <?php
}
}
/* {/block 'product_condition'} */
}
