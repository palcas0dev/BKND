export function isValidDate(date:any) {
  return date && Object.prototype.toString.call(date) === "[object Date]" && !isNaN(date);
}