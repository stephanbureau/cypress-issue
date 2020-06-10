// const MY_INTERNAL_URL='https://my-internal-url.org/my_route';
const MY_INTERNAL_URL='https://my-internal-url.org/my-route/';

const getData = () =>
  new Promise((resolve, reject) => {
    let xhr = new XMLHttpRequest();
    xhr.open('get', MY_INTERNAL_URL, true);
    xhr.addEventListener('load', () => resolve({ data: JSON.parse(xhr.response), statusCode: xhr.status }));
    xhr.addEventListener('error', () => reject('Request failed'));
    xhr.send();
  });

(async () => {
  const { data } = await getData();
  const li = document.createElement('li');
  li.innerHTML = data;  
  document.querySelector('#list').appendChild(li);
})();