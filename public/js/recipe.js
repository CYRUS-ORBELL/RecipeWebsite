document.addEventListener('DOMContentLoaded', function() {
  const ingredients = document.querySelectorAll('.ingredient');
  const factBox = document.getElementById('factBox');
  if (!factBox) return;

  ingredients.forEach(ing => {
    ing.addEventListener('mouseenter', () => {
      const fact = ing.getAttribute('data-fact');
      if (fact && fact.trim()) {
        factBox.textContent = fact;
        factBox.style.display = 'block';
      }
    });
    ing.addEventListener('mouseleave', () => {
      factBox.style.display = 'none';
    });
  });
});