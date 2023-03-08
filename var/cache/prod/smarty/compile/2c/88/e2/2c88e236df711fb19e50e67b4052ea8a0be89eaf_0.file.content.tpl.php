<?php
/* Smarty version 3.1.47, created on 2022-12-31 20:09:08
  from 'C:\xampp\htdocs\prestashop\admin452kyioku\themes\default\template\content.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.47',
  'unifunc' => 'content_63b088d4b36667_29395654',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '2c88e236df711fb19e50e67b4052ea8a0be89eaf' => 
    array (
      0 => 'C:\\xampp\\htdocs\\prestashop\\admin452kyioku\\themes\\default\\template\\content.tpl',
      1 => 1670568129,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_63b088d4b36667_29395654 (Smarty_Internal_Template $_smarty_tpl) {
?><div id="ajax_confirmation" class="alert alert-success hide"></div>
<div id="ajaxBox" style="display:none"></div>

<div class="row">
	<div class="col-lg-12">
		<?php if ((isset($_smarty_tpl->tpl_vars['content']->value))) {?>
			<?php echo $_smarty_tpl->tpl_vars['content']->value;?>

		<?php }?>
	</div>
</div>
<?php }
}
