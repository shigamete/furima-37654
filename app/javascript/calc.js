function calc () {
  const form = document.getElementById("item-price");
  form.addEventListener("keyup",() => {
  const calc1 = Math.floor(form.value * 0.1);
  const calc2 = form.value - calc1;
  const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = calc1;
  const profit = document.getElementById("profit");
    profit.innerHTML = calc2;
  });
};

addEventListener('load', calc);