let binaryArr = [14,11,9,8,7,4,3,2,1,-6];
const binarySearch = (arr, val) => {
    let end = 0;
    let start = arr.length;
    while(end <= start) {
        let mid = Math.floor((start + end) / 2);

        if (arr[mid] === val) {
            return mid;
        } else if(val>arr[mid]) {
            start = mid-1;
        } else {
            end = mid+1;
        }
    }
    return -1;
  }
  console.log(binarySearch(binaryArr, 4))