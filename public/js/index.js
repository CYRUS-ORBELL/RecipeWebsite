document.addEventListener('DOMContentLoaded', function () {
  const input = document.getElementById('searchInput');
  if (!input) return;

  function normalize(s) {
    return (s || '').toString().trim().toLowerCase();
  }

  input.addEventListener('input', function (e) {
    const q = normalize(e.target.value);

    
    document.querySelectorAll('.lists > div').forEach(category => {
      let anyVisible = false;
      const items = category.querySelectorAll('ul.list li');

      items.forEach(li => {
        const a = li.querySelector('a');
        const text = normalize(a && a.textContent);
        const match = q === '' || text.indexOf(q) !== -1;
        li.style.display = match ? '' : 'none';
        if (match) anyVisible = true;
      });

      
      category.style.display = anyVisible ? '' : 'none';
    });
  });
});