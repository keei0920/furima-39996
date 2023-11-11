function subtraction (){
  const setPrice = document.getElementById("item-price");
  setPrice.addEventListener("keyup", () => {
    const profitPrice = Math.floor(setPrice.value*0.9);
    const profit = document.getElementById("profit")
    profit.innerHTML = profitPrice;
  });
};

window.addEventListener('turbo:load', subtraction);
