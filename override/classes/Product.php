<?php

class Product extends ProductCore
{
    public static function getQuantity(
        $idProduct,
        $idProductAttribute = null,
        $cacheIsPack = null,
        Cart $cart = null,
        $idCustomization = null
    ) {if (Pack::isPack((int)$idProduct)) {
            return Pack::getQuantity($idProduct, $idProductAttribute, $cacheIsPack, $cart, $idCustomization);}
        $availableQuantity = StockAvailable::getQuantityAvailableByProduct($idProduct, $idProductAttribute);
        $nbProductInCart = 0;
        if (!empty($cart)) {
            $cartProduct = $cart->getProductQuantity($idProduct, $idProductAttribute, $idCustomization);
            if (!empty($cartProduct['deep_quantity'])) {
                $nbProductInCart = $cartProduct['deep_quantity'];}
        }
        $Context = Context::getContext();

        if($Context->controller->php_self=='product'){
            $nbProductInCart = 0;
        }
        return $availableQuantity - $nbProductInCart;
    }
}
