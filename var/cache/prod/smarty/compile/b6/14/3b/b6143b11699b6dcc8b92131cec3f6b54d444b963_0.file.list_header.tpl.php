<?php
/* Smarty version 3.1.47, created on 2022-12-31 12:47:17
  from 'C:\xampp\htdocs\prestashop\modules\ps_commandesfournisseurs\views\templates\admin\commandes_fournisseurs\helpers\list\list_header.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.47',
  'unifunc' => 'content_63b02145684f79_94403856',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'b6143b11699b6dcc8b92131cec3f6b54d444b963' => 
    array (
      0 => 'C:\\xampp\\htdocs\\prestashop\\modules\\ps_commandesfournisseurs\\views\\templates\\admin\\commandes_fournisseurs\\helpers\\list\\list_header.tpl',
      1 => 1669909492,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_63b02145684f79_94403856 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>



<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_25902704763b02145660849_34323882', 'leadin');
?>

<?php $_smarty_tpl->inheritance->endChild($_smarty_tpl, "helpers/list/list_header.tpl");
}
/* {block 'leadin'} */
class Block_25902704763b02145660849_34323882 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'leadin' => 
  array (
    0 => 'Block_25902704763b02145660849_34323882',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

    <?php if ((isset($_smarty_tpl->tpl_vars['lensesSales']->value))) {?>
        <div class="row panel">
            <div class="panel-heading">
                <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Sales targets','mod'=>'accountmanager'),$_smarty_tpl ) );?>

            </div>
            <?php if (!(isset($_smarty_tpl->tpl_vars['notGoalShop']->value))) {?>
                <div class="col-sm-6 <?php if ((isset($_smarty_tpl->tpl_vars['modeChief']->value))) {?>col-lg-3<?php } else { ?>col-lg-4<?php }?>">
                    <div class="panel color1">
                        <div class="panel-heading">
                            <i class="icon-credit-card"></i>  <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Total lenses sales','mod'=>'accountmanager'),$_smarty_tpl ) );?>

                        </div>
                        <div class="text-center value">
                            <h2>
                                <?php if ((isset($_smarty_tpl->tpl_vars['goalShop']->value))) {?>
                                    <?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['goalShop']->value,'htmlall','UTF-8' ));?>
 <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'without taxe by month','mod'=>'accountmanager'),$_smarty_tpl ) );?>

                                <?php } else { ?>
                                    <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Select a shop','mod'=>'accountmanager'),$_smarty_tpl ) );?>

                                <?php }?>
                            </h2>
                        </div>
                    </div>
                </div>
            <?php }?>
            <?php if ((isset($_smarty_tpl->tpl_vars['modeChief']->value))) {?>
                <div class="col-sm-6 <?php if (!(isset($_smarty_tpl->tpl_vars['notGoalShop']->value))) {?>col-lg-3<?php } else { ?>col-lg-4<?php }?>">
                    <div class="panel color2">
                        <div class="panel-heading">
                            <i class="icon-credit-card"></i>  <?php if ((isset($_smarty_tpl->tpl_vars['saleManager']->value))) {
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Your total Lenses sales','mod'=>'accountmanager'),$_smarty_tpl ) );
} else {
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Lenses sales of select sales manager','mod'=>'accountmanager'),$_smarty_tpl ) );
}?>
                        </div>
                        <div class="text-center value">
                            <h2>
                                <?php if ((isset($_smarty_tpl->tpl_vars['goalSM']->value))) {?>
                                    <?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['goalSalesManager']->value,'htmlall','UTF-8' ));?>
 <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'without taxe by month','mod'=>'accountmanager'),$_smarty_tpl ) );?>

                                <?php } else { ?>
                                    <?php if ((isset($_smarty_tpl->tpl_vars['shopSM']->value))) {?>
                                        <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Select a sales manager','mod'=>'accountmanager'),$_smarty_tpl ) );?>

                                    <?php } else { ?>
                                        <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Select a shop','mod'=>'accountmanager'),$_smarty_tpl ) );?>

                                    <?php }?>
                                <?php }?>
                            </h2>
                        </div>
                    </div>
                </div>
            <?php }?>
            <div class="col-sm-6 <?php if (!(isset($_smarty_tpl->tpl_vars['notGoalShop']->value))) {?>col-lg-3<?php } else {
if ((isset($_smarty_tpl->tpl_vars['modeChief']->value))) {?>col-lg-4<?php } else { ?>col-lg-6<?php }
}?>">
                <div class="panel color3">
                    <div class="panel-heading">
                        <i class="icon-credit-card"></i>  <?php if ((isset($_smarty_tpl->tpl_vars['ame']->value))) {
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Your Lenses sales','mod'=>'accountmanager'),$_smarty_tpl ) );
} else {
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Lenses sales of select account manager','mod'=>'accountmanager'),$_smarty_tpl ) );
}?>
                    </div>
                    <div class="text-center value">
                            <h2>
                                <?php if ((isset($_smarty_tpl->tpl_vars['goalAM']->value))) {?>
                                    <?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['goalAccountManager']->value,'htmlall','UTF-8' ));?>
 <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'without taxe by month','mod'=>'accountmanager'),$_smarty_tpl ) );?>

                                <?php } else { ?>
                                    <?php if ((isset($_smarty_tpl->tpl_vars['shopAM']->value))) {?>
                                        <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Select an account manager','mod'=>'accountmanager'),$_smarty_tpl ) );?>

                                    <?php } else { ?>
                                        <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Select a shop','mod'=>'accountmanager'),$_smarty_tpl ) );?>

                                    <?php }?>
                                <?php }?>
                            </h2>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 <?php if (!(isset($_smarty_tpl->tpl_vars['notGoalShop']->value))) {?>col-lg-3<?php } else {
if ((isset($_smarty_tpl->tpl_vars['modeChief']->value))) {?>col-lg-4<?php } else { ?>col-lg-6<?php }
}?>">
                <div class="panel color4">
                    <div class="panel-heading">
                        <i class="icon-money"></i>  <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Turnover achieved','mod'=>'accountmanager'),$_smarty_tpl ) );?>

                    </div>
                    <div class="text-center value">
                        <h2><?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['goalOfSelect']->value,'htmlall','UTF-8' ));?>
 <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'without taxe','mod'=>'accountmanager'),$_smarty_tpl ) );?>
</h2>
                    </div>
                </div>
            </div>
        </div>
    <?php }?>
    <?php if ((isset($_smarty_tpl->tpl_vars['updateOrderStatus_mode']->value)) && $_smarty_tpl->tpl_vars['updateOrderStatus_mode']->value) {?>
        <div class="panel">
            <div class="panel-heading">
                <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Choose an order status','mod'=>'accountmanager'),$_smarty_tpl ) );?>

            </div>
            <form action="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['REQUEST_URI']->value,'htmlall','UTF-8' ));?>
" method="post">
                <div class="radio">
                    <label for="id_order_state">
                        <select id="id_order_state" name="id_order_state">
    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['order_statuses']->value, 'order_status_name', false, 'id_order_state');
$_smarty_tpl->tpl_vars['order_status_name']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['id_order_state']->value => $_smarty_tpl->tpl_vars['order_status_name']->value) {
$_smarty_tpl->tpl_vars['order_status_name']->do_else = false;
?>
                            <option value="<?php echo intval($_smarty_tpl->tpl_vars['id_order_state']->value);?>
"><?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['order_status_name']->value ));?>
</option>
    <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                        </select>
                    </label>
                </div>
    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['POST']->value, 'value', false, 'key');
$_smarty_tpl->tpl_vars['value']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['key']->value => $_smarty_tpl->tpl_vars['value']->value) {
$_smarty_tpl->tpl_vars['value']->do_else = false;
?>
        <?php if (is_array($_smarty_tpl->tpl_vars['value']->value)) {?>
            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['value']->value, 'val');
$_smarty_tpl->tpl_vars['val']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['val']->value) {
$_smarty_tpl->tpl_vars['val']->do_else = false;
?>
                <input type="hidden" name="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['key']->value,'html','UTF-8' ));?>
[]" value="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['val']->value,'html','UTF-8' ));?>
" />
            <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
        <?php } elseif (strtolower($_smarty_tpl->tpl_vars['key']->value) != 'id_order_state') {?>
                <input type="hidden" name="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['key']->value,'html','UTF-8' ));?>
" value="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['value']->value,'html','UTF-8' ));?>
" />
    
        <?php }?>
    <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                <div class="panel-footer">
                    <button type="submit" name="cancel" class="btn btn-default">
                        <i class="icon-remove"></i>
                        <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Cancel','mod'=>'accountmanager'),$_smarty_tpl ) );?>

                    </button>
                    <button type="submit" class="btn btn-default" name="submitUpdateOrderStatus">
                        <i class="icon-check"></i>
                        <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Update Order Status','mod'=>'accountmanager'),$_smarty_tpl ) );?>

                    </button>
                </div>
            </form>
        </div>
    <?php }
}
}
/* {/block 'leadin'} */
}
