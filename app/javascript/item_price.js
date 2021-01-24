function price() {
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener('keyup' , function(){
    const  priceVal = itemPrice.value
    const addTaxPrice = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
    addTaxPrice.innerHTML = Math.floor(priceVal * 0.1)
    profit.innerHTML = Math.ceil(priceVal - (priceVal * 0.1))
  })
}
window.addEventListener('load' , price)