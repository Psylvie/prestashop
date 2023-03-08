<?php
/* Smarty version 3.1.47, created on 2022-12-31 12:01:42
  from 'C:\xampp\htdocs\prestashop\themes\classic\templates\_partials\helpers.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.47',
  'unifunc' => 'content_63b016960b8ef8_61718751',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4dd5ce8a0122af4b2bf2c5817311e713de746278' => 
    array (
      0 => 'C:\\xampp\\htdocs\\prestashop\\themes\\classic\\templates\\_partials\\helpers.tpl',
      1 => 1670568133,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_63b016960b8ef8_61718751 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->smarty->ext->_tplFunction->registerTplFunctions($_smarty_tpl, array (
  'renderLogo' => 
  array (
    'compiled_filepath' => 'C:\\xampp\\htdocs\\prestashop\\var\\cache\\prod\\smarty\\compile\\child_classiclayouts_layout_left_column_tpl\\4d\\d5\\ce\\4dd5ce8a0122af4b2bf2c5817311e713de746278_2.file.helpers.tpl.php',
    'uid' => '4dd5ce8a0122af4b2bf2c5817311e713de746278',
    'call_name' => 'smarty_template_function_renderLogo_80129763663b016960b1131_46125943',
  ),
));
?> 

<?php }
/* smarty_template_function_renderLogo_80129763663b016960b1131_46125943 */
if (!function_exists('smarty_template_function_renderLogo_80129763663b016960b1131_46125943')) {
function smarty_template_function_renderLogo_80129763663b016960b1131_46125943(Smarty_Internal_Template $_smarty_tpl,$params) {
foreach ($params as $key => $value) {
$_smarty_tpl->tpl_vars[$key] = new Smarty_Variable($value, $_smarty_tpl->isRenderingCache);
}
?>

  <a href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['urls']->value['pages']['index'], ENT_QUOTES, 'UTF-8');?>
">
    <img
      class="logo img-fluid"
      src="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['shop']->value['logo_details']['src'], ENT_QUOTES, 'UTF-8');?>
"
      alt="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['shop']->value['name'], ENT_QUOTES, 'UTF-8');?>
"
      width="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['shop']->value['logo_details']['width'], ENT_QUOTES, 'UTF-8');?>
"
      height="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['shop']->value['logo_details']['height'], ENT_QUOTES, 'UTF-8');?>
">
  </a>
<?php
}}
/*/ smarty_template_function_renderLogo_80129763663b016960b1131_46125943 */
}
