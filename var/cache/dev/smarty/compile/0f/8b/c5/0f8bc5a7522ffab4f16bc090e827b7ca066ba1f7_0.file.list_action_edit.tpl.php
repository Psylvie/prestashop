<?php
/* Smarty version 3.1.47, created on 2022-12-30 09:26:17
  from 'C:\xampp\htdocs\prestashop\admin452kyioku\themes\default\template\helpers\list\list_action_edit.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.47',
  'unifunc' => 'content_63aea0a9edc1f0_39756063',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '0f8bc5a7522ffab4f16bc090e827b7ca066ba1f7' => 
    array (
      0 => 'C:\\xampp\\htdocs\\prestashop\\admin452kyioku\\themes\\default\\template\\helpers\\list\\list_action_edit.tpl',
      1 => 1670568129,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_63aea0a9edc1f0_39756063 (Smarty_Internal_Template $_smarty_tpl) {
?><a href="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['href']->value,'html','UTF-8' ));?>
" title="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['action']->value,'html','UTF-8' ));?>
" class="edit">
	<i class="icon-pencil"></i> <?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['action']->value,'html','UTF-8' ));?>

</a>
<?php }
}
