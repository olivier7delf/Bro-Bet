import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js"

flatpickr(".datepicker", {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
    locale: 'fr',
    disableMobile: false
});
