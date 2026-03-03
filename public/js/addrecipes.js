document.addEventListener('DOMContentLoaded', function() {
  const container = document.getElementById('ingredient-container');
  if (!container) return;

  document.getElementById('add-row').addEventListener('click', function() {
    const row = container.querySelector('.ingredient-row').cloneNode(true);
    row.querySelector('select').value = '';
    row.querySelector('input').value = '';
    container.appendChild(row);
  });

  container.addEventListener('click', function(e) {
    if (e.target.classList.contains('remove-row')) {
      const row = e.target.closest('.ingredient-row');
      if (row && container.children.length > 1) {
        row.remove();
      }
    }
  });
});