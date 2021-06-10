function add_to_cart(pid, pname, price) {
    let cart = localStorage.getItem("cart");
    //no cart is there
    if (cart == null) {
        //no cart
        let products = []; //array of product

        let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };
        //add to products
        products.push(product);

        //add to localStorage and converting into string (as now in array i.e JavaScript Object)
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("New Product is Added for the first time");
    } else {

        //cart is present
        let pcart = JSON.parse(cart); //convert into JavaScript Object i.e Array (From String)

        let oldProduct = pcart.find((item) => item.productId == pid);

        //Now check if we got oldproduct
        if (oldProduct) {
            //increse the quantity
            oldProduct.productQuantity = oldProduct.productQuantity + 1;

            pcart.map((item) => {
                    //check if the oldproduct id matches new product
                    if (item.productId === oldProduct.productId) {
                        //if matches then update it with new value
                        item.productQuantity = oldProduct.productQuantity;

                    }
                })
                //add to localStorage
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("product quantity is increased");

        } else {
            //add the product 
            let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };
            //add to pcart (our local cart)
            pcart.push(product);
            //add to localStorage and converting into string (as now in array i.e JavaScript Object)
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("new product is added ");
        }



    }
    updateCart();

}
//manage product Quantity check if it is greater then that present in the backend. Or manage at the time of checkout



//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//update cart function 

function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);

    if (cart == null || cart.length == 0) {
        //cart has no items
        console.log("cart is empty");
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h3>Cart Is Empty. Please Add Some Items.</h3>");
        $(".checkout-btn").attr('disabled', true);

    } else {
        //there is smoething in the cart
        console.log(cart);
        $(".cart-items").html(`(${cart.length})`);
        let table = `
        <table class='table'>
        <thead class='thead-light'>
        <tr>
        <th>Item Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total Price</th>
        <th>Action</th>
        </tr>
        </thead>
        `;
        let totalPrice = 0;
        cart.map((item) => {
            table += ` <tr>
                    <td> ${item.productName} </td> 
                    <td> ${item.productPrice} </td> 
                    <td> ${item.productQuantity} </td> 
                    <td> ${item.productQuantity * item.productPrice} </td>
                    <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'> Remove </button></td>
                    </tr>
                    
                `
            totalPrice += item.productPrice * item.productQuantity;
        })


        table = table + ` 
        <tr><td colspan='5' class='text-right font-weight-bold m-5'>Total Price: ${totalPrice}</td></tr>
         </table> 
`
        $(".cart-body").html(table);
        $(".checkout-btn").attr('disabled', false);


    }
}

$(document).ready(function() {
    updateCart()
})

//delete item from cart
function deleteItemFromCart(pid) {
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newcart = cart.filter((item) => item.productId != pid);
    localStorage.setItem('cart', JSON.stringify(newcart))
    updateCart()
}

function goToCheckout() {
    window.location = "checkout.jsp"
}

