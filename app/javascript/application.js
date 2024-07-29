import Rails from "@rails/ujs";
import "@hotwired/turbo-rails";
import "controllers";


document.addEventListener('DOMContentLoaded', () => {
  const ingredientiContainer = document.querySelector('#ingredienti-container');
  const addIngredientiButton = document.querySelector('#add-ingredienti');

  if (!ingredientiContainer || !addIngredientiButton) {
    console.error('Contenitore degli ingredienti o pulsante di aggiunta non trovato.');
    return;
  }

  addIngredientiButton.addEventListener('click', () => {
    const lastField = ingredientiContainer.querySelector('.ingredienti-fields:last-of-type');
    if (lastField) {
      const newField = lastField.cloneNode(true);
      const newIndex = ingredientiContainer.querySelectorAll('.ingredienti-fields').length;

      newField.querySelectorAll('[name]').forEach(input => {
        const name = input.name.replace(/\[\d+\]/, `[${newIndex}]`);
        input.name = name;
        input.id = name;

        // Reset input values
        if (input.type !== 'hidden') {
          input.value = '';
        }
      });

      // Ensure the new field is appended correctly
      ingredientiContainer.appendChild(newField);
    }
  });

  ingredientiContainer.addEventListener('click', event => {
    if (event.target.classList.contains('remove_fields')) {
      event.preventDefault();
      const field = event.target.closest('.ingredienti-fields');
      if (field) {
        const hiddenField = field.querySelector('input[type=hidden]');
        if (hiddenField) {
          hiddenField.value = '1'; // Mark the field for removal
        }
        field.style.display = 'none';
      }
    }
  });
});


  

// Inizializza Rails UJS
Rails.start();
