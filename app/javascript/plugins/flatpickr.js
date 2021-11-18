import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepickerstart", {
    minDate: "today"
  });
  flatpickr(".datepickerend", {
    minDate: new Date().fp_incr(1)
  });

}

export { initFlatpickr };
