function count (){
  const setPrice = document.getElementById("item-price");
  setPrice.addEventListener("keyup", () => {
    const commissionPrice = Math.floor(setPrice.value*0.1);
    const addTaxPrice = document.getElementById("add-tax-price")
    addTaxPrice.innerHTML = commissionPrice;
  });
};

window.addEventListener('turbo:load', count);
