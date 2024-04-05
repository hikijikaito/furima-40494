window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  const feeDisplay = document.getElementById("add-tax-price");
  const profitDisplay = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const price = parseInt(priceInput.value);

    if (!isNaN(price)) {
      const taxAmount = Math.floor(price * 0.1);
      const profitAmount = price - taxAmount;

      feeDisplay.innerHTML = taxAmount.toLocaleString();
      profitDisplay.innerHTML = profitAmount.toLocaleString();
    } else {
      feeDisplay.innerHTML = '';
      profitDisplay.innerHTML = '';
    }
  })
});
