<?php
/* Smarty version 3.1.47, created on 2022-12-31 20:08:19
  from 'C:\xampp\htdocs\prestashop\themes\child-classic\templates\page.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.47',
  'unifunc' => 'content_63b088a3408e86_41605487',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'a916c58491e8ed2bbb4ad84863025e00bcb4c4d8' => 
    array (
      0 => 'C:\\xampp\\htdocs\\prestashop\\themes\\child-classic\\templates\\page.tpl',
      1 => 1672511440,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_63b088a3408e86_41605487 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>

<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_151803443163b088a3400a60_55341613', 'content');
$_smarty_tpl->inheritance->endChild($_smarty_tpl, $_smarty_tpl->tpl_vars['layout']->value);
}
/* {block 'page_title'} */
class Block_114517156963b088a34018a3_38361436 extends Smarty_Internal_Block
{
public $callsChild = 'true';
public $hide = 'true';
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

                <header class="page-header">
                    <h1><?php 
$_smarty_tpl->inheritance->callChild($_smarty_tpl, $this);
?>
</h1>
                </header>
            <?php
}
}
/* {/block 'page_title'} */
/* {block 'page_header_container'} */
class Block_102422331663b088a3401111_87584035 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

            <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_114517156963b088a34018a3_38361436', 'page_title', $this->tplIndex);
?>

            <a href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getPageLink('manufacturer'), ENT_QUOTES, 'UTF-8');?>
" btn class="btn btn-primary3">Voir les marques</a>
        <?php
}
}
/* {/block 'page_header_container'} */
/* {block 'page_content_top'} */
class Block_111010960963b088a34061e1_86175641 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
}
}
/* {/block 'page_content_top'} */
/* {block 'page_content'} */
class Block_115454328863b088a3406b13_15334651 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

                    <!-- Page content -->
                <?php
}
}
/* {/block 'page_content'} */
/* {block 'page_content_container'} */
class Block_8439660163b088a3405bd5_30841544 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

            <div id="content" class="page-content card card-block">
                <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_111010960963b088a34061e1_86175641', 'page_content_top', $this->tplIndex);
?>

                <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_115454328863b088a3406b13_15334651', 'page_content', $this->tplIndex);
?>

            </div>
        <?php
}
}
/* {/block 'page_content_container'} */
/* {block 'page_footer'} */
class Block_138203469563b088a3407c61_43630573 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

                    <!-- Footer content -->
                <?php
}
}
/* {/block 'page_footer'} */
/* {block 'page_footer_container'} */
class Block_36102893663b088a3407787_98729106 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

            <footer class="page-footer">
                <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_138203469563b088a3407c61_43630573', 'page_footer', $this->tplIndex);
?>

            </footer>
        <?php
}
}
/* {/block 'page_footer_container'} */
/* {block 'content'} */
class Block_151803443163b088a3400a60_55341613 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'content' => 
  array (
    0 => 'Block_151803443163b088a3400a60_55341613',
  ),
  'page_header_container' => 
  array (
    0 => 'Block_102422331663b088a3401111_87584035',
  ),
  'page_title' => 
  array (
    0 => 'Block_114517156963b088a34018a3_38361436',
  ),
  'page_content_container' => 
  array (
    0 => 'Block_8439660163b088a3405bd5_30841544',
  ),
  'page_content_top' => 
  array (
    0 => 'Block_111010960963b088a34061e1_86175641',
  ),
  'page_content' => 
  array (
    0 => 'Block_115454328863b088a3406b13_15334651',
  ),
  'page_footer_container' => 
  array (
    0 => 'Block_36102893663b088a3407787_98729106',
  ),
  'page_footer' => 
  array (
    0 => 'Block_138203469563b088a3407c61_43630573',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>


    <section id="main">

        <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_102422331663b088a3401111_87584035', 'page_header_container', $this->tplIndex);
?>


        <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_8439660163b088a3405bd5_30841544', 'page_content_container', $this->tplIndex);
?>


        <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_36102893663b088a3407787_98729106', 'page_footer_container', $this->tplIndex);
?>


    </section>

<?php
}
}
/* {/block 'content'} */
}
