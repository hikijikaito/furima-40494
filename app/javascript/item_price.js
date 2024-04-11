const handleTurboLoad = () => {
  const priceInput = document.getElementById("item-price");
  const feeDisplay = document.getElementById("add-tax-price");
  const profitDisplay = document.getElementById("profit");

  if (priceInput && feeDisplay && profitDisplay) {
    priceInput.addEventListener("input", () => {
      const price = parseInt(priceInput.value);

      if (!isNaN(price)) {
        const taxAmount = Math.floor(price * 0.1);
        const profitAmount = price - taxAmount;

        feeDisplay.textContent = taxAmount.toLocaleString();
        profitDisplay.textContent = profitAmount.toLocaleString();
      } else {
        feeDisplay.textContent = '';
        profitDisplay.textContent = '';
      }
    });
  }
};

document.addEventListener("turbo:load", handleTurboLoad);
document.addEventListener("turbo:render", handleTurboLoad);
