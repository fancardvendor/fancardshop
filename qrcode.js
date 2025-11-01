document.addEventListener('click', (e) => {
  if (e.target && e.target.classList.contains('qrBtn')) {
    const name = e.target.dataset.name || 'fancard';
    const qrUrl = `https://api.qrserver.com/v1/create-qr-code/?data=${encodeURIComponent(name)}&size=300x300`;
    const out = document.createElement('div');
    out.innerHTML = `<img src="${qrUrl}" alt="QR for ${name}" style="margin-top:8px;max-width:100%">`;
    e.target.parentElement.appendChild(out);
  }
});