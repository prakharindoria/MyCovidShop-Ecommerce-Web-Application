function add_to_cart(pid, pname, price) {
    let cart = localStorage.getItem("cart");
    if (cart == null) {
        //no cart
        let products = [];
        let product = {
            productId: pid,
            productName: pname,
            productQuantity: 1,
            productPrice: price
        }
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
    } else {
        //cart is present
        let pcart = JSON.parse(cart);

        let quantity = localStorage.getItem("cart.products.product.productQuantity");
        quantity = quantity + 1;
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));

    }
}